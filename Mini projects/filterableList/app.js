'use-strict';

const filterInput = document.querySelector('#filterInput');
const contacts = document.querySelectorAll('.name');

filterInput.addEventListener('keyup',filterNames);

function filterNames(){
    let filterValue = filterInput.value.toUpperCase();
    
    contacts.forEach(el => {
        if(el.textContent.toUpperCase().includes(filterValue)){
            el.style.display = '';
            el.closest('.list-group-item').style.display = 'block'
        }else{
            el.closest('.list-group-item').style.display = 'none';
            el.style.display = 'none';   
        }
    });
}