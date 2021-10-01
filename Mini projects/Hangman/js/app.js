'use-strict';

const word = 'presidente';
const head = document.querySelector('#head');
const body = document.querySelector('#body');
const leftArm = document.querySelector('#left-arm');
const rightArm = document.querySelector('#right-arm');
const leftLeg = document.querySelector('#left-leg');
const rightLeg = document.querySelector('#righ-leg');
const wrongLettersContainer = document.querySelector('.wrong-letters-container');
const wordToGuessContainer = document.querySelector('.word');
const notification = document.querySelector('.notification-container');
const popupOverlayLose = document.querySelector('.popup-overlay-lose');
const popupOverlayWin = document.querySelector('.popup-overlay-win');
const figureParts = document.querySelectorAll('.figure-part');
const btnPlayAgain = document.querySelectorAll('.btn-play-again');


let wrongCounter = 0;
let letterCount = word.length;
let wrongLetters = [];
let rightLetters = [];

// Creating word to guess
(function creatingWord(word){
    word.split('').forEach(letter => {
        const html = `<span class="letter"></span>`
        wordToGuessContainer.insertAdjacentHTML('beforeend',html);
    });
}(word))


function creatingWrongLetter(letter){
    if(wrongCounter === 5){
        popupOverlayLose.classList.add('visible');
    }
    figureParts[wrongCounter].classList.add('visible');
    wrongCounter++;
    const numberOfLetters = document.querySelectorAll('.wrong-letter');
    if(numberOfLetters.length > 0){
        return `<span class="wrong-letter">, ${letter}</span>`

    }else{
        return `<span class="wrong-letter">${letter}</span>`
    }
}

// function amIWin(){
//     document.querySelectorAll('.letter').forEach(letter => {
//         if(letter.innerHTML !== ''){
//             letterCount -= 1;
//         }
//     });
// }

function rightAnswer(letter,word){
    const regex = new RegExp( letter, 'g' );
    const repeatedLetters = word.match(regex).length;

    if(repeatedLetters > 0){
        letterCount -= repeatedLetters;
    }else{
        letterCount -= 1;
    }

    if(letterCount === 0){
        popupOverlayWin.classList.add('visible');
    }

    console.log(letterCount)

    // Displey letters
    for(let i = 0 ; i < word.length; i++){
        if(word[i] === letter){
            document.querySelectorAll('.letter')[i].innerHTML = letter
        }
    }

}

window.addEventListener('keydown',(e) => {
    const letter = e.key.toLowerCase();
    const wordToLower = word.toLowerCase();

    if(e.keyCode >= 65 && e.keyCode <= 90){
    // APPEARENCE OF RIGHT LETTER
    if(wordToLower.includes(letter)){
        if(rightLetters.includes(letter)){
            notification.classList.add('visible');
        }else{
            rightLetters.push(letter);
            rightAnswer(letter,wordToLower);
            notification.classList.remove('visible');
        }
    }
    else{
        // IF WRONG LETTER APPER MORE THAN 1 TIME
        if(wrongLetters.includes(letter)){
            notification.classList.add('visible');
        }else{
        // WRONG LETTER APPEAR ONCE
            wrongLettersContainer.insertAdjacentHTML('beforeend',creatingWrongLetter(letter));
            wrongLetters.push(letter)
        }
    }
}
});

//LISTEN FOR PLAY AGAIN BUTTON CLICKED

btnPlayAgain.forEach(btn => btn.addEventListener('click',() => {
    location.reload();
}));