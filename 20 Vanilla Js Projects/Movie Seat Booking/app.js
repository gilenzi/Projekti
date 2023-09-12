'use-strict';

const numberOfColumns = 3;

function createColumns(columns){
    const seatsWrapper = document.querySelector('.movie-booking__seats-wrapper');
    if(!seatsWrapper) return;

    for(let i = 0 ; i < columns ; i++){
        const col = document.createElement('div');
        col.classList.add('movie-booking__column',`movie-booking__column--${i + 1}`);

        seatsWrapper.append(col);
    }
}

function createSeats(column,numberOfSeats,columnInd){
    let occupiedSeats = [];
    if(localStorage.getItem('seats') !== null && JSON.parse(localStorage.getItem('seats')).length > 0){
        occupiedSeats = JSON.parse(localStorage.getItem('seats'));
        occupiedSeats = occupiedSeats[columnInd];
    }

    for(let i = 0 ; i < numberOfSeats ; i++){
        const seat = document.createElement('span');
        seat.classList.add('movie-booking__seat');

        if(occupiedSeats !== undefined && occupiedSeats.includes(i)){
            seat.classList.add('occupied');
        }

        column.append(seat);
    }
}

function createCinema(){
    const seats = [12,38,12];
    const columns = document.querySelectorAll('.movie-booking__column');

    columns.forEach((column,ind) => {
        createSeats(column,seats[ind],ind);
    });
}

function selectSeat(){
    const cinema = document.querySelector('.movie-booking__seats-wrapper');
    const reserveBtn = document.querySelector('#btn-reserve');

    cinema.addEventListener('click', (e) => {
        const seat = e.target;

        if(seat.classList.contains('movie-booking__seat')){
            if(!isReserved(seat)){
                seat.classList.toggle('selected');
            }else{
                console.log('zauzeto')
            }
        }
    });

    reserveBtn.addEventListener('click', reserveSeat);
}


function reserveSeat(e){
    e.preventDefault();

    let setLocalStorageArr = [];
    let getLocalStorageArr = JSON.parse(localStorage.getItem('seats'));
    const columns = document.querySelectorAll('.movie-booking__column');

    columns.forEach((column,ind) => {
        let arrOfSeats = [];
        let seats = [...column.querySelectorAll('.movie-booking__seat')];
        const selectedSeats = [...column.querySelectorAll('.selected')];

        if(getLocalStorageArr && getLocalStorageArr[ind] !== undefined){
            arrOfSeats = getLocalStorageArr[ind];
        }

        if(selectedSeats.length === 0) arrOfSeats.push();
            
        selectedSeats.forEach(selectedSeat => {
            if(!arrOfSeats.includes(seats.indexOf(selectedSeat))){
                arrOfSeats.push(seats.indexOf(selectedSeat));
            }
        });

        setLocalStorageArr.push(arrOfSeats);
    });
    localStorage.setItem('seats',JSON.stringify(setLocalStorageArr));
}

function calculatePrice(){
    const movies = document.querySelector('.movie-booking__movie-selector');
    const numberOfTickets = document.querySelector('.movie-booking__movie-selector');

    console.log(movies.value)

}


function isReserved(seat){
    if(!seat.classList.contains('occupied')) return false;
    else return true;
}

/* MAIN */////////////////////////////////////////////////////////////////////

createColumns(numberOfColumns);
createCinema();
selectSeat();

// let getLocalStorageArr = JSON.parse(localStorage.getItem('seats'));

// getLocalStorageArr ? console.log('jest') : console.log('nije');
// console.log(getLocalStorageArr)