loadMoreComments();

function loadMoreComments() {
    let everyComments = document.querySelectorAll('.comment[data-page]');

    if (!everyComments.length) return false;

    let totalPages = parseInt(document.querySelector('#comments-pagination').getAttribute('data-total-pages'));
    let nextPageButton = document.querySelector('#load-next-comments');
    let previousPageButton = document.querySelector('#load-previous-comments');
    let currentPage = parseInt(document.querySelector('#comments-pagination').getAttribute('data-current-page'));
    let currentPageNumber = document.querySelector('#current-page-number');

    nextPageButton.addEventListener('click', function (e) {
        e.preventDefault();
        currentPage++;
        currentPageNumber.textContent = String(currentPage);
        updatePage();
    })

    previousPageButton.addEventListener('click', function (e) {
        e.preventDefault();
        currentPage--;
        currentPageNumber.textContent = String(currentPage);
        updatePage();
    })

    function updatePage() {
        everyComments.forEach(function (comment) {
            if (parseInt(comment.getAttribute('data-page')) !== currentPage) {
                comment.classList.add('hide');
            } else {
                comment.classList.remove('hide');
            }
        })

        if (currentPage >= totalPages) {
            nextPageButton.classList.add('hide');
        } else {
            nextPageButton.classList.remove('hide');
        }

        if (currentPage > 1) {
            previousPageButton.classList.remove('hide');
        } else {
            previousPageButton.classList.add('hide');
        }

        document.querySelector('#comments-pagination').setAttribute('data-current-page', String(currentPage));
    }
}
