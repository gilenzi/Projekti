// JavaScript source code
'use strict';

const btnCheck = document.querySelector('.check');
const btnAgain = document.querySelector('.again');
const highScore = document.querySelector('.highscore');
const score = document.querySelector('.score');
const message = document.querySelector('.message');
let randomNumber = Math.floor(Math.random() * 20) + 1;
let points = 20;
let highScor = 0;

btnCheck.addEventListener('click',function(){
	const guessNumber = Number(document.querySelector('.guess').value);

	if (guessNumber === 0) {
		message.textContent = '🛑No number!';
	}
	else{

		if (points > 0) 
		{
			if (guessNumber > randomNumber) 
			{
				points--;
				message.textContent = 'Too high!';
				score.textContent = points;
			}
			else if(guessNumber < randomNumber)
			{
				points--;
				message.textContent = 'Too low!';
				score.textContent = points;
			}
			else
			{
				message.textContent = 'Correct number!';
				document.body.style.cssText = "background-color:green;";
				document.querySelector('.number').textContent = guessNumber;
				if (points >= highScor) {
					highScor = points;
					highScore.textContent = highScor;
				}
			}
		}else{
			message.textContent = '💥End of game!';
		}
	}
	console.log(guessNumber, randomNumber);
});

btnAgain.addEventListener('click',function(){
	document.body.style.cssText = "background-color: #222;"
	document.querySelector('.guess').value = null;
	message.textContent = 'Start guessing...';
	score.textContent = 20;
	points = 20;
	randomNumber = Math.floor(Math.random() * 20) + 1;
	document.querySelector('.number').textContent = '?';
});

