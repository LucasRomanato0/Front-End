const input = document.querySelector('.login_input');
const button = document.querySelector('.login_button');
const form = document.querySelector('.login-form');

// function validateInput(){} --- é a mesma coisa

const validateInput = ({ target }) => {
       if(target.value.length > 2){
              button.removeAttribute('disabled');
              return; // pula para o final da função, como se fosse um "else"
       }

       button.setAttribute('disabled', '');
}

const handleSubmit = (event) => {
       event.preventDefault();

       localStorage.setItem('player', input.value); // salva o nome do player no localstorage do browser
       window.location = 'pages/game.html';
}

input.addEventListener('input', validateInput);
form.addEventListener('submit', handleSubmit);