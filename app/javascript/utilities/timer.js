document.addEventListener('turbolinks:load', async function () {
    var timer = document.querySelector('.timer');
    var buttonNext = document.querySelector('#test-next');

    if (!(timer || buttonNext)) {
        return;
    }

    var testPassagesId = location.pathname.split('/').reverse()[0];

    var response = await fetch(`/test_passages/${testPassagesId}/time`, {
        headers: {'content-type': 'application/json'},
        credentials: 'same-origin',
        method: 'GET',
    });

    var result = await response.json();
    var time = result.last_time || result.time;
    setTimer(time);

    buttonNext.addEventListener('click', async (e)=> {
        var timeLast = document.querySelector('.last_time');

        var response = await fetch(`/test_passages/${testPassagesId}/last_time`, {
            headers: {'content-type': 'application/json'},
            credentials: 'same-origin',
            method: 'POST',
            body: JSON.stringify({last_time: ((timeLast.textContent || '').replaceAll(' ', '').replace(':', '.')) * 100 / 60})
        });

        var result = await response.json();
    })
});

function setTimer(time) {
    var testPassagesId = location.pathname.split('/').reverse()[0];
    var timerEl = document.querySelector('.timer');
    var timeEl = document.createElement('div');
    timeEl.classList.add('last_time');
    var now = +new Date();
    var executionTime = now + time * 60 * 1000;

    var timer = setInterval(async ()=> {
        now = +new Date();
        var timeSeconds = Math.max(0, (executionTime - now) / 1000);
        var minutes = Math.floor((timeSeconds / 60) % 60 || 0);
        var seconds = Math.floor(timeSeconds % 60 || 0);

        timeEl.textContent = `${("0" + minutes).slice(-2)} : ${("0" + seconds).slice(-2)}`;
        timerEl.appendChild(timeEl);
        if (timeSeconds <= 0 ) {
            clearInterval(timer);
            timeEl.textContent = 'Время вышло';
            timerEl.appendChild(timeEl);

            var response = await fetch(`/test_passages/${testPassagesId}/time_up`, {
                headers: {'content-type': 'application/json'},
                credentials: 'same-origin',
                method: 'POST',
            });

            var result = await response.json();
            window.location.href = window.location.origin + result.result;
        }
    }, 1000)
}