topPage();

function topPage() {
    let windowHeight;
    let scrollToTopButton = document.querySelector('#top-page-button');

    if (!scrollToTopButton) return false;

    windowHeight = window.innerHeight / 2;

    window.addEventListener('scroll', function () {
        topPageAppear(windowHeight, scrollToTopButton);
    });

    scrollToTopButton.addEventListener('click', function () {
        scrollToTop();
    })
}

function topPageAppear(windowHeight, scrollToTopButton) {
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
