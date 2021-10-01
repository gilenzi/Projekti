'use-strict';

const API_URL = `https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=93e527969e94e81fdb78f47e2565fdd6&page=1`;
const IMG_PATH = `https://image.tmdb.org/t/p/w1280`;
const SEARCH_API = `https://api.themoviedb.org/3/search/movie?api_key=93e527969e94e81fdb78f47e2565fdd6&query="`;

const header = document.querySelector('header');
const forms = document.querySelectorAll('.search');
const movieContainer = document.querySelector('.movie-container');
const logo = document.querySelector('header p');
const toggle = document.querySelector('.toggle');
const sideBar = document.querySelector('.side-bar');
const links = document.querySelector('#links');
const errorMsg = document.querySelectorAll('.error-message');
const sliderContainer = document.querySelector('.slider-container');
const sliderView = document.querySelector('.slider-view');
const btns = document.querySelectorAll('.btn');


const pageNumbers = (total, max, current) => {
    const half = Math.floor(max / 2);
    let to = max;
    
    if(current + half >= total) {
      to = total;
    } else if(current > half) {
      to = current + half ;
    }
    
    let from = to - max;
  
    return Array.from({length: max}, (_, i) => (i + 1) + from);
  }

// console.log(pageNumbers(100,10,98));

// GETTING DATA
async function getMovies(url){
    try{
        const res = await fetch(url);
        const data =  await res.json();
        console.log(data)
        generateMarkup(data.results);

    }catch(ex){
        console.error(ex.message);
    }
}

// MAIN
getMovies(API_URL);

// Event LISTENERS
//RELOAD PAGE
logo.addEventListener('click',() => window.location.reload());


toggle.addEventListener('click',() => {
    toggle.classList.toggle('active');
    sideBar.classList.toggle('active');
});

//Toggle sidebar
[sliderContainer,movieContainer].forEach(el => el.addEventListener('click',(e)=>{
    if(sideBar.classList.contains('active')) {
        sideBar.classList.toggle('active');
        toggle.classList.toggle('active');
   }
}));


links.addEventListener('click',(e) => {
    e.preventDefault();
    let baseLink = '';
    if(e.target.classList.contains('link')) {
        baseLink = `https://api.themoviedb.org/3${e.target.getAttribute('href')}&api_key=93e527969e94e81fdb78f47e2565fdd6`;
    }

    getMovies(baseLink);
});

function search(e){
    e.preventDefault();
    const form = e.target.closest('.search');
    const searchTerm = form.childNodes[1].value;

    if(searchTerm && searchTerm.trim() !== ''){
        getMovies(SEARCH_API + searchTerm);
        searchTerm.value = '';
    }else{
        window.location.reload();
    }  
}

forms.forEach(form => form.addEventListener('submit',search));

//GENERATING MARKUP

function generateMarkup(arr){
    
    if(arr.length === 0){
        if(window.getComputedStyle(forms[0]).getPropertyValue('display') == 'none'){
            errorMsg[1].style.display = 'block';
        }else{

            errorMsg[0].style.display = 'block';
            console.log(errorMsg)
        }

    }else{
        errorMsg[0].style.display = 'none';
        errorMsg[1].style.display = 'none';

        movieContainer.innerHTML = '';
        arr.forEach(movie => {
            const markup = `
            <div class="movie">
                <img src="${IMG_PATH + movie.poster_path}" alt="${movie.original_title}">
                <div class="about-movie">
                    <p>${movie.original_title}</p>
                    <span class="movie-grade ${generateGradeClass(movie.vote_average)}">${movie.vote_average}</span>
                </div>
                <div class="movie-overview">
                    <h3>Overview</h3>
                    <p>${movie.overview}</p>
                </div>
            </div>
            `;
            movieContainer.insertAdjacentHTML('afterbegin',markup);
        });
    }
}

function generateGradeClass(grade){
   if(grade >= 8){
       return 'green';
   }else if(grade >= 5){
       return 'orange';
   }else if(grade < 5){
       return 'red';
   }
}

// Slider
let imgNumber = 1;

function changeImg(counter){
    let path = `images/photo-${counter}.jpg`;

    sliderView.style.backgroundImage  = `url('${path}')`;
    sliderContainer.style.backgroundImage  = `url('${path}')`;
}

btns[0].addEventListener('click',() => {
    imgNumber--;
    if(imgNumber < 1) imgNumber = 3;
    changeImg(imgNumber);
});

btns[1].addEventListener('click',() => {
    imgNumber++;
    if(imgNumber > 3) imgNumber = 1;
    changeImg(imgNumber);
});

//Header OBSERVER

function headerAppear(entries){
    if(!entries[0].isIntersecting){
        header.classList.add('appear');
        // console.log(11)
    }else{
        header.classList.remove('appear');

    }
    // console.log(entries[0])
}

const observerOptions = {
    root: null,
    threshold: 0,
    rootMargin :'-' + header.getBoundingClientRect().height + 'px'
}

const observer = new IntersectionObserver(headerAppear,observerOptions);

observer.observe(sliderContainer);
// observer.disconnect();