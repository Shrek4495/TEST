document.addEventListener('turbolinks:load', function() {
    let timer = document.querySelector('.timer');

    if (timer) {
        let minutes = document.querySelector('.minutes');
        let seconds = document.querySelector('.seconds');
        let time = parseInt(timer.dataset.time);

        if (time > 0) {
            setInterval(function() {
                if (!time) {
                    $("form").submit();
                } else {
                    minutes.textContent = Math.floor(time / 60);
                    seconds.textContent = time % 60;
                }
                time = time > 0 ? time -= 1 : 0;
            }, 1000);
        }
    }
});