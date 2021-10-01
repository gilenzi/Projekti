'use-strict';


const budgetController = (function (){
    // Array for incomes and expenses [0]->income [1]->expense
    let budgetArr = [[],[]];

    function Income(desc,value){
        this.desc = desc;
        this.value = value;
    }

    function Expense(desc,value){
        this.desc = desc;
        this.value = value;
    }


    function SetLocalStorage(item,type){
        if(localStorage.getItem('budget') === null){
            type === 'income'? budgetArr[0].push(item) : budgetArr[1].push(item);
        }else{
            budgetArr = JSON.parse(localStorage.getItem('budget'));
            type === 'income'? budgetArr[0].push(item) : budgetArr[1].push(item);
        }
        localStorage.setItem('budget',JSON.stringify(budgetArr));
    }

    return {
        addItem : function(type,desc,value){
            let newItem;

            if(type === 'expense') newItem = new Expense(desc,value);
            else if(type === 'income') newItem = new Income(desc,value);

            // Adding to local storage
            SetLocalStorage(newItem,type);
            return newItem
        },
        calculateIncome : function(){
            const arr = JSON.parse(localStorage.getItem('budget'));
            if(arr === null){
                return;
            }else{
                let result = arr[0].reduce((acc,item) => acc + item.value,0);
                return result;
            }
            
        },
        calculateExpense : function(){
            const arr = JSON.parse(localStorage.getItem('budget'));
            if(arr === null){
                return
            }
            let result = arr[1].reduce((acc,item) => acc + item.value,0);
            return result;
        },
        // Removing item from local storage and reload page
        removeItem : function(item,type){
            let indexOfItem;
            let items = [];
            if(localStorage.getItem('budget') === null){
                items = [];
            }else{
                items = JSON.parse(localStorage.getItem('budget'));
                type === 'income' ?
                    indexOfItem = items[0].findIndex(el => el.desc === item) :
                    indexOfItem = items[1].findIndex(el => el.desc === item);

                type === 'income' ?
                items[0].splice(indexOfItem,1) :
                items[1].splice(indexOfItem,1);

                localStorage.setItem('budget',JSON.stringify(items));
                location.reload();
            }
        }
    }
})();

const UIController = (function(){

    const DOMstring = {
        inputType : '.calculation__select',
        inputDesc : '.calculation__desc',
        inputValue : '.calculation__value',
        formSubmit : '.calculation__btn',
        tableExp : '.table--expense',
        tableInc : '.table--income',
        errorMsg : '.calculation__error-text',
        statsDate : '.stats__date',
        incomeValueTitle : '.stats__income--value',
        expenseValueTitle: '.stats__expenses--value',
        expenseValuePercentage : '.stats__expenses--percentage',
        statsTotal : '.stats__total',
        select: '.calculation__select',
        form : '.calculation__form',
        selectCurrency: '.calculation__select--currency'
    };

    function currencyConvert(originalValue,selectValue='RSD'){

        if(selectValue === 'EUR'){
            return originalValue = new Intl.NumberFormat('de-DE', {style: 'currency', currency: 'EUR'}).format(originalValue);
        }
        if(selectValue === 'USD'){
           return originalValue = new Intl.NumberFormat('en-US', {style: 'currency', currency: 'USD'}).format(originalValue);
        }
        if(selectValue === 'RSD'){
            return originalValue = new Intl.NumberFormat('sr-RS', {style: 'currency', currency: 'RSD'}).format(originalValue);
         }
    }
    return {
        // Getting input values from form [type,desc,value]
        getInput: function(){
            return {
                type: document.querySelector(DOMstring.inputType).value,
                desc: document.querySelector(DOMstring.inputDesc).value,
                value: parseFloat(document.querySelector(DOMstring.inputValue).value),
                selectCurrency : document.querySelector(DOMstring.selectCurrency).value
            };
        },

        
        getDOMstring: () => DOMstring,

        setIncomeAndExpense: (currency) => {
            let inc,exp;
            let percentage = document.querySelector(DOMstring.expenseValuePercentage);
            let statsTotal =  document.querySelector(DOMstring.statsTotal);

            inc = budgetController.calculateIncome();
            exp = budgetController.calculateExpense();

            // Setting statsTOtal
            // statsTotal.textContent = `${ inc - exp > 0? '+' : ''} ${inc - exp}`;
            statsTotal.textContent = currencyConvert(inc-exp,currency);
            
            //Setting percentage on expenses
            percentage.textContent = `% ${((exp/inc) * 100).toFixed(0)}`;

            if(JSON.parse(localStorage.getItem('budget')) === null){
                inc = '0.00';
                exp = '0.00';
                percentage.textContent = '-';
                statsTotal.textContent = '+ 0.00';
            }

            // Setting income and expenses
            document.querySelector(DOMstring.incomeValueTitle).textContent = currencyConvert(inc,currency);
            document.querySelector(DOMstring.expenseValueTitle).textContent = currencyConvert(exp,currency);
        },

        // Setting Month and Year to title
        setStatsDate:() => {
            const monthNames = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
          ];
            const date = new Date();

            const title = document.querySelector(DOMstring.statsDate);
    
            title.innerHTML = `Available Budget in ${monthNames[date.getMonth()]}  ${date.getFullYear()}`;
        },

        // Adding new item to UI
        createItem : (item,type,currency) => {
            // Render incomes
            if(type === 'income'){
                    const markup = `
                    <tr class="table__row">
                        <td class="table__data table__data--desc">${item.desc}</td>
                        <td class="table__data table__data--value">+ ${currencyConvert(item.value,currency)}
                            <span class="table__data--delete"><i class="far fa-times-circle"></i></span>
                        </td>
                    </tr>`;
                    document.querySelector(DOMstring.tableInc).insertAdjacentHTML('beforeend',markup);
            }
            // Render expenses
            if(type === 'expense'){
                    const total = budgetController.calculateIncome();
                    const markup = `
                    <tr class="table__row">
                        <td class="table__data table__data--desc">${item.desc}</td>
                        <td class="table__data table__data--value">- ${currencyConvert(item.value,currency)}
                            <span class="stats__expenses--percentage">${((item.value / total) * 100).toFixed(0)} %</span>
                            <span class="table__data--delete"><i class="far fa-times-circle"></i></span>
                        </td>
                    </tr>`;
                    document.querySelector(DOMstring.tableExp).insertAdjacentHTML('beforeend',markup);
            }

        },
        loadItems: function(currency='RSD'){
            document.querySelector(DOMstring.tableInc).innerHTML = '';
            document.querySelector(DOMstring.tableExp).innerHTML= '';
            
           const thInc = document.createElement('th');
           thInc.classList.add('table__header');
           thInc.textContent = 'Income'

           const thExp = document.createElement('th');
           thExp.classList.add('table__header');
           thExp.textContent = 'Expense';

           document.querySelector(DOMstring.tableInc).insertAdjacentElement('afterbegin',thInc);
           document.querySelector(DOMstring.tableExp).insertAdjacentElement('afterbegin',thExp);

            if(localStorage.getItem('budget') !== null){
                const arr = JSON.parse(localStorage.getItem('budget'));
                arr[0].forEach(item => this.createItem(item,'income',currency));
                arr[1].forEach(item => this.createItem(item,'expense',currency));
            }
        },
        // Checking if all inputs are valid
        checkInputs : function(obj){
            const errorMsg = document.querySelector(DOMstring.errorMsg);
            const select  = document.querySelector(DOMstring.select);
            
            if((obj.desc.trim() === '' || isNaN(obj.value)) || obj.value === 0 || select.value == 'none'){ 
                errorMsg.classList.add('appear');
                return false
            }else{
                errorMsg.classList.remove('appear');

                this.clearInputs();
                return true;
            }
        },
        // Clear input fields after submiting form
        clearInputs : function(){
            const desc = document.querySelector(DOMstring.inputDesc);
            const val = document.querySelector(DOMstring.inputValue);

            if(desc.value && val.value){
                desc.value = '';
                val.value = '';
            }
            desc.focus();
        }
    }
})();

// GLOBAL APP CONTROLLER
const controller = (function(budgetCtrl,UICtrl){

    // Set title date
    UICtrl.setStatsDate();

    // Listening for submit on form
    function setUpEventListeners(){
        const DOM = UICtrl.getDOMstring();
        const submitBtn = document.querySelector(DOM.formSubmit);
        const disConatiner = document.querySelector('.display__container');
        const select = document.querySelector(DOM.select);
        const form = document.querySelector(DOM.form);
        const selectCurrency = document.querySelector(DOM.selectCurrency);

        // Select currency
        selectCurrency.addEventListener('click',() => {
            UIController.setIncomeAndExpense(selectCurrency.value);
            UIController.loadItems(selectCurrency.value);
        });

        //Set focus on form input
        select.addEventListener('click',(e) => {
            if(select.value === 'income') {
                form.classList.remove('expense')
                form.classList.add('income');
            };
            if(select.value === 'expense'){
                form.classList.remove('income');
                form.classList.add('expense');
            }
        });

        // Removing item from storage
        disConatiner.addEventListener('click',(e) => {
            if(e.target.closest('.table__data--delete')){
                const parent = e.target.closest('.table__data--value');
                const item = parent.previousElementSibling.textContent;
                let type = parent.firstElementChild.textContent;

                // Determining type of item
                type != ''? type = 'expenses' : type = 'income';

                budgetCtrl.removeItem(item,type);
            }
        });

        ['click','submit'].forEach(el => submitBtn.addEventListener(el,(e) => {
            ctrlAddItem();
        }));
    }

    function ctrlAddItem(){
        let input,newItem;
        // 1. Get the filed inut data
        input = UICtrl.getInput();
        //Checking if inputs are correct
        // 2. Add the item to the budget controller
         if(UICtrl.checkInputs(input)){
            budgetController.addItem(input.type,input.desc,input.value);
            UICtrl.createItem(input,input.type)
            UIController.setIncomeAndExpense(input.selectCurrency);
            UIController.loadItems(input.selectCurrency);
         }else{
            return;
         }

        // Clearing inputs
        UICtrl.clearInputs();
    }

    return {
        init: function(){
            setUpEventListeners();
            UIController.setIncomeAndExpense();
            UIController.loadItems();
        }
    }

})(budgetController,UIController);

controller.init();
