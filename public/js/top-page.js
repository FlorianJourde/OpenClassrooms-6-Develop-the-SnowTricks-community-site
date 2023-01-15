let windowHeight;
let scrollToTopButton = document.querySelector('#top-page-button');

windowHeight = window.innerHeight / 2;

if (scrollToTopButton !== null) {
    window.onscroll = function() {
        topPageAppear();
    };

    scrollToTopButton.addEventListener('click', function () {
        scrollToTop();
    })
}

function topPageAppear() {
    if (document.body.scrollTop > windowHeight || document.documentElement.scrollTop > windowHeight) {
        scrollToTopButton.classList.add('appear');
    } else {
        scrollToTopButton.classList.remove('appear');
    }
}

function scrollToTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
