'use-strict';

const flagsContainer = document.querySelector('.flags-container');
const searchCounrty = document.querySelector('.search');
const errorMsg = document.querySelector('.error-msg');
const searchBtn = document.querySelector('.search-btn');
const whereBtn = document.querySelector('.where-am-i-btn');

let counrty = '';
let arr = [];
let index = 0;

///////////////////////
searchBtn.addEventListener('click',function(e){
    e.preventDefault();
    country = searchCounrty.value.toLowerCase();
    fetch(`https://restcountries.eu/rest/v2/name/${country}`).then(function(response){
        if(!response.ok){
            renderError('Country not found!');
        }
        if(response.ok){
            errorMsg.innerHTML = '';
            arr.push(country);
            if(arr.length > 2){
                index = 0;
                flagsContainer.firstElementChild.remove();
                arr.shift();
                arr.unshift(country);
            }
        
            getCountryData(arr[index])
            index++;
        }
    });
});

function renderError(message){
    errorMsg.innerHTML = '';
    errorMsg.insertAdjacentHTML('beforeend',message)
}

function renderCountry(data){
    const html = `
    <div class="country">
    <div class="flag">
    <img src="${data.flag}" alt="flag-of-portugal">
    </div>
    <div class="about-country">
    <h1 class="country-name">${data.name}</h1>
    <h3 class="counrty-continent">${data.region}</h3>
    <div class="contry-population">
    <i class="fas fa-users"></i>
    <p><span class="population">${(+data.population / 1000000).toFixed(1)}</span>M</p>
    </div>
    <div class="country-language">
    <i class="fas fa-assistive-listening-systems"></i>
    <p class="language">${data.languages[0].name}</p>
    </div>
    <div class="country-currency">
    <i class="fas fa-dollar-sign"></i>
    <p class="currency">${data.currencies[0].name}</p>
    </div>
    </div>`
    
    flagsContainer.insertAdjacentHTML('beforeend',html);
}

function getJSON(url,errorMsg = 'Something went wrong'){
    return fetch(url)
    .then((response) => {
        if(!response.ok) throw new Error(`${errorMsg} ${response.status})`)
        return response.json();
    });
}

function getCountryData(country){
        getJSON(`https://restcountries.eu/rest/v2/name/${country}`,'Country not found')
        .then((data) => renderCountry(data[0]))
        .catch(err => renderError(`Something went wrong ${err.message}. Try again!`))
        .finally(() =>  flagsContainer.style.opacity = "1");
}


function wait(seconds){
    return new Promise(function(resolve){
        setTimeout(resolve,seconds * 1000);
    });
}

function createImg(imgPath){
    return new Promise(function(resolve,reject){
        const image = document.createElement('img');
        image.src = imgPath;
        image.addEventListener('load',function(){
            image.classList.add('images');
            document.body.appendChild(image);
            resolve(image);
        });
        
        image.addEventListener('error',function(){
            reject(new Error('Image not found'));
        });
    });
}
// function reportWindowSize() {
//     console.log(window.innerWidth);
//   }

// window.addEventListener('resize', reportWindowSize);