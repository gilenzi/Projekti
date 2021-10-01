'use-strict';

const joke = document.querySelector('.joke');
const jokeBtn = document.querySelector('.btn');

generateJoke();

jokeBtn.addEventListener('click',generateJoke);

async function generateJoke(){
    const config = {
        headers:{
            'Accept': 'application/json'
        }
    };
    
    const res = await fetch('https://icanhazdadjoke.com',config);
    const data = await res.json();
    joke.innerHTML = data.joke;
}