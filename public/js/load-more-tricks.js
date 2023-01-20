loadMoreTricks();

function loadMoreTricks() {
    let everyTricks = document.querySelectorAll("[data-page]");
    let totalPages = parseInt(document.querySelector('#load-more-tricks').getAttribute('data-total-pages'));
    let loadMoreButton = document.querySelector('#load-more-tricks');
    let nextPage = parseInt(document.querySelector('#load-more-tricks').getAttribute('data-next-page'));
    let nextTricks = document.querySelectorAll("[data-page='" + nextPage + "']");

    if (!everyTricks.length) {
        return false;
    }

    loadMoreButton.addEventListener('click', function(e) {
        e.preventDefault();

        nextTricks.forEach(function(trick) {
            trick.classList.remove('hide');
        })

        if (nextPage >= totalPages) {
            loadMoreButton.remove();
        }

        nextPage++;
        nextTricks = document.querySelectorAll("[data-page='" + nextPage + "']");
        loadMoreButton.setAttribute("data-next-page", String(nextPage));
    })
}
