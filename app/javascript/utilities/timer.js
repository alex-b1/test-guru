document.addEventListener('turbolinks:load', async function () {
    var timer = document.querySelector('.timer');

    if (!timer) {
        return;
    }

    var timer_count = timer.dataset.timer;
    var testId = timer.dataset.id;
    var timeEl = document.createElement('div');
    timeEl.classList.add('last_time');

    var now = +new Date();
    var executionTime = now + timer_count * 1000;
    var timeSeconds = Math.max(0, (executionTime - now) / 1000);

    var interval = setInterval(async ()=> {
        var minutes = Math.floor((timeSeconds / 60) % 60 || 0);
        var seconds = Math.floor(timeSeconds % 60 || 0);

        timeEl.textContent = `${("0" + minutes).slice(-2)} : ${("0" + seconds).slice(-2)}`;
        timer.appendChild(timeEl);
        if (timeSeconds <= 0 ) {
            clearInterval(interval);
            timeEl.textContent = 'Время вышло';
            timer.appendChild(timeEl);

            window.location.href = '/test_passages/' + testId + '/result';
        }
        timeSeconds -= 1;
    }, 1000)
});
