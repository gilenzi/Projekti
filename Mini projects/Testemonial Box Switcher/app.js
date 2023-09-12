'use-strict';

const testemonials = [
    {
        text: 'Lucas goes to school every day of the week. He has many subjects to go to each school day: English, art, science, mathematics, gym, and history. His mother packs a big backpack full of books and lunch for Lucas.',
        name: 'John Does',
        jobPosition: 'Marketing',
        profileImg : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxTk_iIOTprWLM7XsmnDw2HArJeK8dkdH4UQ&usqp=CAU'
    },
    {
        text: 'His first class is English, and he likes that teacher very much. His English teacher says that he is a good pupil, which Lucas knows means that she thinks he is a good student.',
        name: 'Mary Jane',
        jobPosition: 'Entepronuer',
        profileImg : 'https://i0.wp.com/newdoorfiji.com/wp-content/uploads/2018/03/profile-img-1.jpg?ssl=1'
    },
    {
        text: 'His third class is science. This class is very hard for Lucas to figure out, but he gets to work with his classmates a lot, which he likes to do. His friend, Kyle, works with Lucas in science class, and they have fun.',
        name: 'Carlos Smith',
        jobPosition: 'SEO',
        profileImg : 'https://www.alucoildesign.com/assets/pages/media/profile/profile_user.jpg'
    },
    {
        text: 'The next class is mathematics, which most of the students just call math. Kyle has trouble getting a good grade in mathematics, but the teacher is very nice and helpful.',
        name: 'Kate Lucas',
        jobPosition: 'Secretary',
        profileImg : 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'
    }
];

let current = 1;

const testemonial = document.getElementsByClassName('testemonial')[0];
const testemonialText = document.querySelector('.testemonial__text');
const testemonialImage = document.querySelector('.testemonial__image');
const testemonialAbout = document.querySelector('.testemonial__about');

animation();

function updateTestemonial(){
    const {text, name, jobPosition, profileImg} = testemonials[current];

    animation();

    current++;

    testemonialText.textContent =  text;
    testemonialImage.setAttribute('src',profileImg); 
    testemonialAbout.innerHTML = name + "<br>" + jobPosition;
    
    if(current === testemonials.length) current = 0;
}

function animation(){
    testemonial.classList.add('is-switching');

    setTimeout(() => {
        testemonial.classList.remove('is-switching');
    },1000);
}

setInterval(updateTestemonial,5000);

