'use-strict';

const feedBackCard = document.getElementsByClassName('feedback-card')[0];
const cards = document.getElementsByClassName('feedback-card__emoji');
const feedBackOption = document.getElementsByClassName('feedback-card__option')[0];


feedBackCard.addEventListener('click',(e) => {
    const element = e.target;
    if(element.classList.contains('feedback-card__emoji')){
        removeActive();
        element.classList.add('is-active');
    }

    if(element.classList.contains('feedback-card__btn')){
        getData();
    }
});

function removeActive(){
    for(let i = 0 ; i < cards.length ; i++){
        const card = cards[i];

        if(card.classList.contains('is-active')) card.classList.remove('is-active');
    }
}

function getData(){
    let isSelected = false;
    for(let i = 0 ; i < cards.length ; i++){
        const card = cards[i];
        if(card.classList.contains('is-active')){
            feedBackOption.textContent = card.getAttribute('data-emoji');
            isSelected = true;
        }
    }
    if(isSelected){
        feedBackCard.classList.add('is-done');
    }
}