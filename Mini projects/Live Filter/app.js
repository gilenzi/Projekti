'use-strict';

const URL = 'https://randomuser.me/api/?results=20';
const usersContainer = document.querySelector('.live-search__users');
const search = document.querySelector('.live-search__search-field');

////////////////////////////////////////////////////////////////////////////////////
// TODO

/* 
    1. Add much more data from api email, gender...
    2. Make that data searchable , pick and search through gender email etc..
    3. Implement debounce on search event listener
    4. Think more about implementing other features
*/

//EVENT LISTENERS

search.addEventListener('keydown',filterUsers);

function getUsers(){
    fetch(URL)
    .then(response => response.json())
    .then(data => {
        console.log(data);
        data.results.forEach(user => {
            genereteUserHTML(user);
        });
    });
}

function filterUsers(e){
    const searchText = search.value;
    const names = document.querySelectorAll('.live-search__user-name');
    let name = names[0].parentElement.parentElement;


    names.forEach(name => {
        if(!name.textContent.includes(searchText)){
            name.parentElement.parentElement.remove();
        }
        // console.log(name.textContent);
    });

    console.log(name)
}

function genereteUserHTML(data){
    const html = `
    <div class="live-search__user">
        <img src="${data.picture.medium}" alt="Picture of ${data.name.first + ' ' + data.name.last}" class="live-search__image">
        <div class="live-search__about">
            <h3 class="live-search__user-name">${data.name.first} ${data.name.last}</h3>
            <p class="live-search__user-location">${data.location.city} ${data.location.country}</p>
        </div>
    </div>
    `
    usersContainer.insertAdjacentHTML('beforeend',html); 
}

getUsers();