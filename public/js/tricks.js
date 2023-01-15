window.onload = () => {
    let tricksContainer = document.querySelector('#tricks-container');
    let loadMoreTricks = document.querySelector('#load-more-tricks');
    let currentPage = parseInt(document.querySelector('#load-more-tricks').getAttribute('data-page'));

    loadMoreTricks.addEventListener('click', function(e) {
        e.preventDefault();

        currentPage++;
        loadMoreTricks.setAttribute('data-page', String(currentPage));

        // console.log(this.getAttribute('href'));

        fetch(this.getAttribute('href'), {
            method: 'POST',
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Content-Type': 'application/json'
            },
        }).then(
            response => response.json()
        ).then(data => {
            if (data.success) {
                console.log(data)
                // console.log(JSON.parse(data));

                // this.innerHTML('TEST');
                // this.parentElement.parentElement.remove();
            } else {
                console.log(data);
                // console.log(JSON.stringify(data));
                // console.log(JSON.parse(data));

                // console.log(JSON.parse(this));
                // console.log(data)
                // alert(data.error);
            }
        }).catch(e => console.log(e))
    })

    // let links = document.querySelectorAll('[data-delete]');
    //
    // for (link of links) {
    //     link.addEventListener('click', function(e) {
    //         e.preventDefault();
    //
    //         if (confirm('Voulez-vous supprimer cette image ?')) {
    //             fetch(this.getAttribute('href'), {
    //                 method: 'DELETE',
    //                 headers: {
    //                     'X-Requested-With': 'XMLHttpRequest',
    //                     'Content-Type': 'application/json'
    //                 },
    //                 body: JSON.stringify({"_token": this.dataset.token})
    //             }).then(
    //                 response => response.json()
    //             ).then(data => {
    //                 if (data.success) {
    //                     this.parentElement.parentElement.remove();
    //                 } else {
    //                     alert(data.error);
    //                 }
    //             }).catch(e => alert(e))
    //         }
    //     })
    // }
}
