document.addEventListener('turbolinks:load', function () {
    var progress = document.querySelector('.test-progress');
    var number = document.querySelector('.test-progress[data-test-number]');
    var size = document.querySelector('.test-progress[data-test-size]');

    if (progress) {
        var number = progress.dataset.testNumber - 1;
        var size = progress.dataset.testSize;
        progress.style.width = number == 0 ? 0 : (Math.round(number / size * 100) + '%');
    }
});
