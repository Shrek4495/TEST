document.addEventListener('turbolinks:load', function () {
    const progressBar = document.querySelector('.progress-bar');
    if (progressBar) { const { progress } = progressBar.dataset; progressBar.style.width = `${progress}%`; }
});