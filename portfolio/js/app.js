/* -----------------------------------------------
/* How to use? : Check the GitHub README
/* ----------------------------------------------- */

/* To load a config file (particles.json) you need to host this demo (MAMP/WAMP/local)... */
/*
particlesJS.load('particles-js', 'particles.json', function() {
  console.log('particles.js loaded - callback');
});
*/

/* Otherwise just put the config content (json): */

particlesJS('particles-js',
  
  {
    "particles": {
      "number": {
        "value": 80,
        "density": {
          "enable": true,
          "value_area": 800
        }
      },
      "color": {
        "value": "#ffffff"
      },
      "shape": {
        "type": "circle",
        "stroke": {
          "width": 0,
          "color": "#000000"
        },
        "polygon": {
          "nb_sides": 5
        },
        "image": {
          "src": "img/github.svg",
          "width": 100,
          "height": 100
        }
      },
      "opacity": {
        "value": 0.5,
        "random": false,
        "anim": {
          "enable": false,
          "speed": 1,
          "opacity_min": 0.1,
          "sync": false
        }
      },
      "size": {
        "value": 5,
        "random": true,
        "anim": {
          "enable": false,
          "speed": 40,
          "size_min": 0.1,
          "sync": false
        }
      },
      "line_linked": {
        "enable": true,
        "distance": 150,
        "color": "#ffffff",
        "opacity": 0.4,
        "width": 1
      },
      "move": {
        "enable": true,
        "speed": 6,
        "direction": "none",
        "random": false,
        "straight": false,
        "out_mode": "out",
        "attract": {
          "enable": false,
          "rotateX": 600,
          "rotateY": 1200
        }
      }
    },
    "interactivity": {
      "detect_on": "canvas",
      "events": {
        "onhover": {
          "enable": true,
          "mode": "repulse"
        },
        "onclick": {
          "enable": true,
          "mode": "push"
        },
        "resize": true
      },
      "modes": {
        "grab": {
          "distance": 400,
          "line_linked": {
            "opacity": 1
          }
        },
        "bubble": {
          "distance": 400,
          "size": 40,
          "duration": 2,
          "opacity": 8,
          "speed": 3
        },
        "repulse": {
          "distance": 200
        },
        "push": {
          "particles_nb": 4
        },
        "remove": {
          "particles_nb": 2
        }
      }
    },
    "retina_detect": true,
    "config_demo": {
      "hide_card": false,
      "background_color": "#b61924",
      "background_image": "",
      "background_position": "50% 50%",
      "background_repeat": "no-repeat",
      "background_size": "cover"
    }
  }

);

//Navigation close
const popUp = document.querySelector('.popup');
const navigation = document.querySelector('.navigation');
const checkBox = document.querySelector('.navigation__checkbox');

// TOGGLE NAVIGATION
navigation.addEventListener('click',(e) => {
    if(e.target.classList.contains('navigation__link') && checkBox.checked)
        checkBox.checked = false;
});

//Change blob shape

const tween = KUTE.fromTo(
  '#blob1',
  {path: '#blob1'},
  {path: '#blob2'},
  {repeat: 999, duration: 3000, yoyo: true}
)
// const tween2 = KUTE.fromTo(
//   '#blob1',
//   {path: '#blob1'},
//   {path: '#blob2'},
//   {repeat: 999, duration: 3000, yoyo: true}
// ).start();

tween.start();

//SKILLS BOOTSTRAP CHANGE

const boostrap = document.querySelectorAll('.bootstrap span');

for(let i = 0 ; i < boostrap.length ; i+=2){
  boostrap[i].style.transform = "rotate(-24deg) translateY(10px)";
  boostrap[i].style.color = "rgba(255,255,255,0.9)";
  boostrap[i].style.animation = "bootstrap 4s linear infinite";
}

//GOTOTOP OBSERVER
const main = document.querySelector('.section-main');
const goTo = document.querySelector('#goTop');
const callBackFunction = function(entries){
  // console.log(entries[0]);
  if(!entries[0].isIntersecting){
    goTo.style.visibility = "visible";
    goTo.style.opacity = "1";
  }else{
    goTo.style.visibility = "hidden";
    goTo.style.opacity = "0";
  }
}

let observer = new IntersectionObserver(callBackFunction);

observer.observe(main);