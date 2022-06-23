const mario = document.querySelector('.mario');
const pipe = document.querySelector('.pipe');

const jump = () => {
       mario.classList.add('jump');

       setTimeout( () => {

              mario.classList.remove('jump');

       }, 600)

}

const loop = setInterval(() => {

       const pipePosition = pipe.offsetLeft;
       const marioPosition = +window.getComputedStyle(mario).bottom.replace('px', '');

       if(pipePosition <= 120 && pipePosition > 0 && marioPosition < 80){

              pipe.style.animation = 'none';
              pipe.style.left = `${pipePosition}px`; // para a animação na posição que encostar

              mario.style.animation = 'none';
              mario.style.bottom = `${marioPosition}px`;

              mario.src = './images/game-over.png';
              mario.style.width = '75px';
              mario.style.marginLeft = '50px';

              clearInterval(loop); // quando acaba o jogo o loop para

       }

}, 10);

document.addEventListener('keydown', jump);