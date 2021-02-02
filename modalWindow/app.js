
const buttons = document.querySelectorAll('.show-modal');
const modal = document.querySelector('.modal');
const overlay = document.querySelector('.overlay');
const close = document.querySelector('.close-modal');


function closeModal(){
	overlay.classList.add('hidden');
	modal.classList.add('hidden');
}

function toggleHidden(){
	overlay.classList.toggle('hidden');
	modal.classList.toggle('hidden');
}

for(let i = 0 ; i < buttons.length ; i++){
	buttons[i].addEventListener('click',function(e){
		toggleHidden();
		close.addEventListener('click',closeModal);
	});

	buttons[i].addEventListener('keydown',function(e){
		if(e.key === 'Escape'){
			closeModal();
		}
	});

	overlay.addEventListener('click',function(){
		toggleHidden();
	});
}

