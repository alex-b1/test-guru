document.addEventListener('turbolinks:load', function () {
    var progress = document.querySelector('.test-progress');
    var nubmer = document.querySelector('.test-progress[data-test-nubmer]');
    var size = document.querySelector('.test-progress[data-test-size]');

    if (progress) {
        var nubmer = progress.dataset.testNumber - 1;
        var size = progress.dataset.testSize;
        progress.style.width = nubmer == 0 ? 0 : (Math.round(nubmer / size * 100) + '%');
    }
});
