'use-strict';

const questions = [
    {
        title : 'Which language runs in a web browser?',
        answers: [
            'Java','C','Python','JavaScript'
        ],
        answer: 3
    },
    {
        title : 'What does CSS stand for?',
        answers : [
            'Central Style Sheets',
            'Cascading Style Sheets',
            'Cascading Simple Sheets',
            'Cars SUVs Sailboats'
        ],
        answer : 1
    },
    {
        title : 'What year was JavaSCript launched?',
        answers : [
            '1996',
            '2002',
            '1990',
            '1995',
            'none of the above'
        ],
        answer : 3
    }
]

let currentQuestion = 0;
let correctAnswers = 0;

const quizContainer = document.querySelector('.quiz');
const submitBtn = document.querySelector('.quiz__submit');

window.addEventListener('DOMContentLoaded',(e) => {
    createQuestion(questions[currentQuestion]);
    
    submitBtn.addEventListener('click',(e) => {
        const radios = document.querySelectorAll("input[type='radio']");

        const userAnswer = isChecked(radios);


        if(userAnswer !== undefined) {
            if(questions[currentQuestion].answer === userAnswer){
                correctAnswers++;
            }

            currentQuestion++;

            if(currentQuestion == questions.length) {
                removeLastSlide();
                createResult();
                return
            }
            removeLastSlide();
            createQuestion(questions[currentQuestion]);
            const slide = document.querySelector('.quiz__slide');
        }
    });
});


function removeLastSlide(){
    const slide = Array.from(quizContainer.querySelectorAll('.quiz__slide')).pop(); 
    slide.remove();
}

function createResult(){
    submitBtn.textContent = 'Reload';
    const html = `
    <h3>You answered <span>${correctAnswers}/${questions.length}</span> questions correctly</h3>
    `
    quizContainer.insertAdjacentHTML('beforeend',html);

    currentQuestion = 0;
}

function createQuestion(data){
    const answersHtml = data.answers.map( answer => {
        return `
        <div class="quiz__question">
            <label for="${answer.toLowerCase()}">${answer}</label>
            <input type="radio" name="answer" id="${answer.toLowerCase()}">
        </div>
        `
    }).join('\n');

    const html = `
    <div class="quiz__slide">
        <h2 class="quiz__question-title">${data.title}</h2>
        <div class="quiz__answers">
            ${answersHtml}
        </div>
    </div>
    `
    quizContainer.insertAdjacentHTML('beforeend',html);
}

function isChecked(radioBtns){
    let isChecked = false;

    if(submitBtn.textContent === 'Reload'){
        currentQuestion = 0;
        correctAnswers = 0;

        quizContainer.querySelector('h3').remove();
        submitBtn.textContent = 'Submit';

        createQuestion(questions[currentQuestion]);

        return;
    }
    
    for(let i = 0 ; i < radioBtns.length ; i++){
        const radioBtn = radioBtns[i];
        
        if(radioBtn.checked){
            isChecked = true;
            return i;
        }
    }
    
    if(!isChecked) alert('Please check some option');
}
