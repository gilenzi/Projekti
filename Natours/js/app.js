'use-strict';
const popUp = document.querySelector('.popup');
const navigation = document.querySelector('.navigation');
const checkBox = document.querySelector('.navigation__checkbox');

// TOGGLE NAVIGATION
navigation.addEventListener('click',(e) => {
    if(e.target.classList.contains('navigation__link') && checkBox.checked)
        checkBox.checked = false;
});

// CLOSING TOURS SECTION POPUP
popUp.addEventListener('click',(e) => {
    window.location.hash = '#section-tours';

});