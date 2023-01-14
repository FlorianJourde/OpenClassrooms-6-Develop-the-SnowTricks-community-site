window.onload = () => {
    let totalPages = parseInt(document.querySelector('#load-more-tricks').getAttribute('data-total-pages'));
    let loadMoreButton = document.querySelector('#load-more-tricks');
    let nextPage = parseInt(document.querySelector('#load-more-tricks').getAttribute('data-next-page'));
    // let everyTricksLength = document.querySelectorAll("[data-page]").length;
    let nextTricks = document.querySelectorAll("[data-page='" + nextPage + "']");

    loadMoreButton.addEventListener('click', function(e) {
        e.preventDefault();

        // console.log(nextTricks);

        nextTricks.forEach(function(trick) {
            // console.log(trick);
            trick.classList.remove('hide');
        })

        if (nextPage >= totalPages) {
            loadMoreButton.remove();
        }

        // console.log(totalPages);
        // console.log(nextPage);

        nextPage++;
        nextTricks = document.querySelectorAll("[data-page='" + nextPage + "']");
        loadMoreButton.setAttribute("data-next-page", String(nextPage));




        // nextTricks = document.querySelectorAll("[data-page='" + nextPage + "']");

        // console.log(this);
        // console.log(currentPage);
        // console.log(nextTricks);
        // console.log(tricksContainer);
    })
}
