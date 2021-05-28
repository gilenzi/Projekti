'use-strict';

const todoContainer = document.querySelector('.todo-container');
const todoInput = document.querySelector('.todo-input');
const submit = document.querySelector('.submit');
const todoOption = document.querySelector('.todo-option');

let todoArrayAll = [];

// EVENT LISTENERS
submit.addEventListener('click',addNewTodo);
todoContainer.addEventListener('click',toDoManipulation);
todoOption.addEventListener('click',sorting);
window.addEventListener('DOMContentLoaded',loadingTodos);

function createTodo(text,state){
    const todo = `
    <div class="todo ${state}">
        <p class="todo-text">${text}</p>
        <div class="todo-options">
            <i class="fas fa-check todo-done"></i>
            <i class="fas fa-trash todo-delete"></i>
        </div>
    </div>`
    todoContainer.insertAdjacentHTML('beforeend',todo);
}

// Loading todos from localstorage  (OUTPUT)
function loadingTodos(e){
    if(localStorage.getItem('allTodos') !== null){
        JSON.parse(localStorage.getItem('allTodos'))
        .forEach(el => createTodo(el.text,el.state));;
    }
}

// MINIMIZING LOCAL STORAGE MANIPULATION AND CREATING TODO
function setLocalStorage(arr,storage,text){
    let todo = {
        text: text,
        state: ''
    };

    createTodo(text);
    arr.push(todo);
    localStorage.setItem(storage,JSON.stringify(arr));
}

// Adding new todo in list
function addNewTodo(e){
    e.preventDefault();
    let todoText = todoInput.value;

    if(todoText.trim() === ''){
        alert('The field must not be empty.');
    }else{

        if(localStorage.getItem('allTodos') === null){
            setLocalStorage(todoArrayAll,'allTodos',todoText);
        }else{
            todoArrayAll = JSON.parse(localStorage.getItem('allTodos'));
            setLocalStorage(todoArrayAll,'allTodos',todoText);
        }
        todoInput.value = '';
    }
}

// DONE / DELETE TODO
function toDoManipulation(e){
    let todo;

    if(e.target.closest('.todo-done')){
        todo = e.target.closest('.todo');;
        todo.classList.add('done');

        let stateArr = JSON.parse(localStorage.getItem('allTodos'));
        let stateTodo = stateArr.find(el => el.text === todo.firstElementChild.textContent);

        stateTodo.state = 'done';
        localStorage.setItem('allTodos',JSON.stringify(stateArr));
    }
    if(e.target.closest('.todo-delete')){
        todo = e.target.closest('.todo');
        todo.classList.add('delete');

        removeFromStorage(todo.firstElementChild.textContent)

        // Waiting for transition to finish and than delete todo
        todo.addEventListener('transitionend',function(){
            todo.remove();
        });
    }
}

function removeFromStorage(todo){
    let todos;
    let indexOfTodo;

    if(localStorage.getItem('allTodos') === null){
        todos = [];
    }else{
        todos = JSON.parse(localStorage.getItem('allTodos'));

        indexOfTodo = todos.findIndex(el => el === todo);
        todos.splice(indexOfTodo,1);
        localStorage.setItem('allTodos',JSON.stringify(todos));
    }
}
// SORTING TODOS
function sorting(e){
    const todos = document.querySelectorAll('.todo');
    todos.forEach(el => {
       switch(e.target.value){

            case 'all':
               el.style.display = 'flex';
            break;

            case 'completed':
                if(el.classList.contains('done'))
                    el.style.display = 'flex';
                else 
                    el.style.display = 'none';
            break;

            case 'uncompleted':
                if(!el.classList.contains('done'))
                    el.style.display = 'flex';
                else
                    el.style.display = 'none';
            break;
       }
    });
}

