document.addEventListener('turbolinks:load', function () {
    const password = document.querySelector('#user_password');
    const passwordConfirmation = document.querySelector('#user_password_confirmation');

    if (passwordConfirmation) passwordConfirmation.addEventListener('input', checkPasswordConfirmation)

    function checkPasswordConfirmation () {

        if (passwordConfirmation.value === "") {
            document.querySelector('.octicon-x-circle').classList.add('hide');
            document.querySelector('.octicon-check-circle').classList.add('hide');
        } else if (passwordConfirmation.value === password.value) {
            document.querySelector('.octicon-x-circle').classList.add('hide');
            document.querySelector('.octicon-check-circle').classList.remove('hide');
        } else {
            document.querySelector('.octicon-x-circle').classList.remove('hide');
            document.querySelector('.octicon-check-circle').classList.add('hide');
        }
    }
})