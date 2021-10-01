'use strict';

const sectionP1 = document.querySelector('.player--0');
const sectionP2 = document.querySelector('.player--1');
const dice = document.querySelector('.dice');
const newGame = document.querySelector('.btn--new');
const rollDice = document.querySelector('.btn--roll');
const hold = document.querySelector('.btn--hold');
const scoreP1 = document.querySelector('#score--0');
const scoreP2 = document.querySelector('#score--1');
const currentScoreP1 = document.querySelector('#current--0');
const currentScoreP2 = document.querySelector('#current--1');
const errorMsg = document.querySelectorAll('.error-msg');

let playing = true;

let sumScoreP1 = 0;
let sumScoreP2 = 0;
let finalP1 = 0;
let finalP2 = 0;

// Hide dice
dice.classList.add('hidden');
// Dice img change
function setDiceImg(number){
	const path = `images/dice-${number}.png`;
	return dice.setAttribute('src',path);
}

function sumCurrentScore(randNumber, sum,output){
	sum += randNumber;
	return output.textContent = sum;
}

function changePlayer(player1, player2,classToAdd){
	player1.classList.add(classToAdd);
	player2.classList.remove(classToAdd);
}

function holdFunction(score,final,sum,currentScore){
	score.textContent = final;
	sum = 0;
	currentScore.textContent = sum;
	errorMsg[0].textContent = '';
	errorMsg[1].textContent = '';
}

// Roll dice
rollDice.addEventListener('click',function(){
	if(playing){
			let randNumber = Math.floor(Math.random() * 6) + 1;
		// Show dice
		dice.classList.remove('hidden');

		// Changing dice img
		setDiceImg(randNumber);
		// P1
		if(sectionP1.classList.contains('player--active')){
			currentScoreP1.textContent = randNumber;

			if (randNumber != 1) {
				sumScoreP1 += randNumber;
				currentScoreP1.textContent = sumScoreP1;
			}else{
				sumScoreP1 = 0;
				currentScoreP1.textContent = sumScoreP1;
				changePlayer(sectionP2, sectionP1,'player--active');
			}	
		}
		// P2
		else if(sectionP2.classList.contains('player--active')){

			if (randNumber != 1) {
				sumScoreP2 += randNumber;
				currentScoreP2.textContent = sumScoreP2;
			}else{
				sumScoreP2 = 0;
				currentScoreP2.textContent = sumScoreP2;
				changePlayer(sectionP1, sectionP2,'player--active');
			}
		}
	}
});

hold.addEventListener('click',function(){

	if (playing) {
		if(sectionP1.classList.contains('player--active')){
			finalP1 += sumScoreP1;
			if (finalP1 >= 10) {
				playing = false;
				sectionP1.classList.add('player--winner');
				dice.classList.add('hidden');
			}
			if (sumScoreP1 != 0) {
				holdFunction(scoreP1,finalP1,sumScoreP1,currentScoreP1);
				changePlayer(sectionP2, sectionP1,'player--active');
			}
			else{
				errorMsg[0].textContent = 'No points to save!';
			}
		}

		else if(sectionP2.classList.contains('player--active')){
			finalP2 += sumScoreP2;
			if (finalP2 >= 10) {
				playing = false;
				sectionP2.classList.add('player--winner');
				dice.classList.add('hidden');
			}
			if (sumScoreP2 != 0) {
				holdFunction(scoreP2,finalP2,sumScoreP2,currentScoreP2);
				changePlayer(sectionP1, sectionP2,'player--active');
			}else{
				errorMsg[1].textContent = 'No points to save!';
			}	
		}
	}
});

// NEW GAME
newGame.addEventListener('click',function(){
	scoreP1.textContent = 0;
	scoreP2.textContent = 0;
	currentScoreP1.textContent = 0;
	currentScoreP2.textContent = 0;
	sumScoreP1 = 0;
	sumScoreP2 = 0;
	finalP1 = 0;
	finalP2 = 0;
	playing = true;

	if (!sectionP1.classList.contains('player--active')) {
		sectionP1.classList.add('player--active');
	}
	if(sectionP2.classList.contains('player--active')){
		sectionP2.classList.remove('player--active');
	}
	if (sectionP1.classList.contains('player--winner') || sectionP2.classList.contains('player--winner')) {
		sectionP1.classList.remove('player--winner');
		sectionP2.classList.remove('player--winner');
	}
});