const inputs = document.querySelectorAll('.account-verify__number-field');

inputs[0].focus();

inputs.forEach((el, ind) => {
    el.addEventListener('keydown', (e) => {
        if(e.key >= 0 && e.key <= 9){
            inputs[ind].value = '';
            setTimeout( () =>{
                if(ind === inputs.length - 1) return;
                inputs[ind + 1].focus(); 
            },10);        
        }else if( e.key === 'Backspace'){
            setTimeout( () =>{
                if(ind === 0) return;
                inputs[ind - 1].focus(); 
            },10);  
        }
    });
})