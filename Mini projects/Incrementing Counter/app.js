'use-strict';

const twitterNumber = document.querySelector('.twitter-number');
const youtubeNumber = document.querySelector('.youtube-number');
const facebookNumber = document.querySelector('.facebook-number');

const twitterLimit = 12000;
const youtubeLimit = 5000;
const facebookLimit = 7500;

let tCounter = 0;
let yCounter = 0;
let fCounter = 0;

const numberInterval = setInterval(() => {
    incrementFacebook();
    incrementYoutube();
    incrementTwitter();
}, 30);


function incrementTwitter(){
    tCounter += 100 * 2.4;
    display(tCounter,twitterLimit,twitterNumber);
}

function incrementYoutube(){
    yCounter += 100;
    display(yCounter,youtubeLimit,youtubeNumber);
}

function incrementFacebook(){
    fCounter += (100 * 1.5);
    display(fCounter,facebookLimit,facebookNumber);
}

function display(counter,limit,element){
    if(counter > limit){
        clearInterval(numberInterval);
        return;
    }
    element.innerHTML = counter;
}