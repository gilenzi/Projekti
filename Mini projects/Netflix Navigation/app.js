
const toggler = document.querySelector('#toggler');
const closeNav = document.querySelector('#close-nav');
const navigation = document.querySelector('.navigation-container');
const navigationItems = document.querySelectorAll('.navigation__item');


function slide(e){
    const slides = document.querySelectorAll('.slides');
    navigation.style.transform = "translateX(0)";

    if(toggler.classList.contains('appear')) toggler.classList.remove('appear');
    
    toggler.classList.add('hide');

    if(slides[0].getAttribute('style')){
        removeStyles(slides)
    }

        slides.forEach(slide => {
    
         slide.classList.add('slide-in');
            
        });
}

function closeNavigation(){
    const slides = document.querySelectorAll('.slides');


    toggler.classList.remove('hide');
    toggler.classList.add('appear');

    if(slides[0].classList.contains('slide-in')){

        let transDuration = 0;
        for(let i = slides.length - 1; i >= 0 ; i--){
            slides[i].removeAttribute("style");

            slides[i].style.transitionDelay = `${transDuration}s`;
            slides[i].classList.remove('slide-in');
            transDuration += 0.3;

        }
    }
        
    setTimeout( _ => navigation.style.transform = "translateX(-100%)" ,1000);
}

function removeStyles(arr){
    arr.forEach(el => el.removeAttribute('style'));
}

// EVENT LISTENERS

toggler.addEventListener('click',slide);
closeNav.addEventListener('click',closeNavigation);
navigationItems.forEach(item => {
    item.addEventListener('click',closeNavigation);
})

navigation.addEventListener('click',(e) => {
    console.log(e.target);
})