document.addEventListener('turbolinks:load', function () {
    var form = document.querySelector('.form_pass_check');

    if (form) {
        form.addEventListener('input', checkPassword);
    }
});

function checkPassword() {
    var password = document.querySelector('.password');
    var passwordConfirmation = document.querySelector('.password_confirmation');

    if (!(password.value.length > 0 && passwordConfirmation.value.length > 0)) {
        document.querySelector('.password_alert')?.remove()
        return;
    }

    var form = document.querySelector('.form_pass_check');
    var alert = document.querySelector('.password_alert');

    if (!alert) {
        alert = document.createElement('div');
        alert.classList.add('password_alert');
    }

    if (password.value == passwordConfirmation.value) {
        alert.textContent = "пароли совпадают"
        alert.classList.remove('fail')
        alert.classList.add('success')
    } else {
        alert.textContent = "пароли не совпадают"
        alert.classList.remove('success')
        alert.classList.add('fail')
    }

    form.prepend(alert)
}
