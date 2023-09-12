'use strict';

const generatorInput = document.querySelector('.password-generator__input');
const btnGenerate = document.querySelector('.password-generator__btn--generate');
const generatedText = document.querySelector('.password-generator__input');
const btnCopy = document.querySelector('.password-generator__btn--copy');


const dataStructure = {
    'uppercase' : {
        'min' : 65,
        'max' : 90
    },
    'lowercase' : {
        'min' : 97,
        'max' : 122
    },
    'numbers' : {
        'min' : 48,
        'max' : 57
    },
    'symbols' : {
        'arr' : [33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,58,59,60,61,62,63,64,91,92,93,94,95,123,124,125,126]
    }
};

let multipleArr = [];

// EVENT LISTENERS
btnCopy.addEventListener('click',copyText);

btnGenerate.addEventListener('click',() => {
    const passwordLength = document.querySelector('.password-generator__password-length').value;

    // Get ranges for checked types
    let checked = getCheckedFields();
    
    // Determine which set of range to be returned
    const arrOfRange = checked.map(check => dataStructure[check]);

    if(multipleArr.length !== 0){
        multipleArr = [];
    }
    getMultipleRandomChars(arrOfRange);
    let randText = '';
    for(let i = 0 ; i < passwordLength; i++){
        randText += getRandomChar();
    }
    generatedText.value = randText;
});

function copyText(e){
    e.preventDefault();
    /* Get the text field */
    if(generatorInput.value.trim() === '') return;
    const copyText = generatorInput;

    /* Select the text field */
    copyText.select();
    copyText.setSelectionRange(0, 99999); /* For mobile devices */

    /* Copy the text inside the text field */
    navigator.clipboard.writeText(copyText.value);
    alert('Password coppied to clip board.');
}

function getMultipleRandomChars(arrOfRange){
    for(let i = 0 ; i < arrOfRange.length ; i++){
        if(arrOfRange[i].arr){
            multipleArr.push(...arrOfRange[i].arr);
            continue;
        }
        let min = arrOfRange[i].min;
        let max = arrOfRange[i].max;
        createArrayOfSelectedChars(min,max);
    }
}

function createArrayOfSelectedChars(min,max){
    for(let i = min ; i <= max ; i++){
        multipleArr.push(i);
    }
}

// Checking which checkbox is checked,
// return: array of checked checkbox's
function getCheckedFields(){
    const checkBoxes = document.querySelectorAll('.password-generator__checkbox');
    const checked = [];
    checkBoxes.forEach(box => {
        if(box.checked == true){
            checked.push(box.getAttribute('name'));
        }
    });
    return checked;
}

//return: random number between range
function getRandomChar(){
    const decimal = Math.floor(Math.random() * multipleArr.length);

    const char = String.fromCharCode(multipleArr[decimal]);
    return char;
}
