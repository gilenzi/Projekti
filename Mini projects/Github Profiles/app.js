'use-strict';

const APIURL = 'https://api.github.com/users/';
const errorMessage = document.querySelector('.search__error-message');
const btn = document.querySelector('.search__submit');
const searchInput = document.querySelector('.search__input');
const searchResultContainer = document.querySelector('.search');

searchInput.focus();

// EVENT LISTENERS
btn.addEventListener('click',handleSearch);

function handleSearch(e){
    const searchResult = document.querySelector('.search-result');
    e.preventDefault();
    const username = searchInput.value;

    // Checking if input is empty
    if(username === ''){
        errorMessage.classList.add('visible');
        return;
    }
    // If searchResult block alredy exsits remove it, not to be duplicated
    if(searchResult) searchResult.remove();

    // Removing error message, if input field has value
    if(errorMessage.classList.contains('visible')){
        errorMessage.classList.remove('visible');
    }
    getUser(username);
    
}

// Fetching user data from git
function getUser(username){

    Promise.all([
        fetch(APIURL + username + '/repos'),
        fetch(APIURL + username)
    ])
    .then(responses => {
        return Promise.all(responses.map(response => response.json()))
    })
    .then(data => {
        const [repos,userData] = data;
        
        createUser({
            repository : repos.slice(0,10),
            user : userData
        });
    })
    .catch(error => {
        console.error('Error:', error);
    })
}

function createRepos(repos){
    return repos.map(repo => {
        return `<a class="search-result__skill" target="_blank" href="${repo.html_url}">${repo.name}</a>`;
    }).join('');
}

function createUser(data){
    console.log(data);
    const html = `
    <div class="search-result">
        <div class="search-result__img-container">
            <img src="${data.user.avatar_url}" class="search-result__img">
        </div>
        <div class="search-result__about-container">
            <h2 class="search-result__title">${data.user.name}</h2>
            <p class="search-result__about-text">${data.user.bio}</p>
            <div class="search-result__social-container">
                <p class="search-result__followers"><span class="search-result__number search-result__number--followers">${data.user.followers}</span> Followers</p>
                <p class="search-result__following"><span class="search-result__number search-result__number--following">${data.user.following}</span> Following</p>
                <p class="search-result__repos"><span class="search-result__number search-result__number-repos">${data.user.public_repos}</span> Repos</p>
            </div>
            <div class="search-result__skills">
                ${createRepos(data.repository)}
            </div>
        </div>
    </div>
    `
    searchResultContainer.insertAdjacentHTML('beforeend',html);
}