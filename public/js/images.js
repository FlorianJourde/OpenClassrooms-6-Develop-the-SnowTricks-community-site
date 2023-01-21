ajaxImages();
enlargeImages();

function ajaxImages() {
    let links = document.querySelectorAll('[data-delete]');

    if (!links.length) return false;

    for (link of links) {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            if (confirm('Voulez-vous supprimer cette image ?')) {
                fetch(this.getAttribute('href'), {
                    method: 'DELETE',
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest',
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({"_token": this.dataset.token})
                }).then(
                    response => response.json()
                ).then(data => {
                    if (data.success) {
                        this.parentElement.parentElement.remove();
                    } else {
                        alert(data.error);
                    }
                }).catch(e => alert(e))
            }
        })
    }
}

function enlargeImages() {
    let images = document.querySelectorAll('.images-section .images .image');

    if (!images.length) return false;

    let modalImageContainer = document.querySelector('#modal-image-container');

    images.forEach(function(item) {
        let imageUrl = item.getAttribute('data-image');

        item.addEventListener('click', function() {
            let img = document.createElement('img');
            img.src = imageUrl;
            img.classList.add('modal-image');
            modalImageContainer.appendChild(img);
            setTimeout(function () {
                modalImageContainer.classList.add('active');
            }, 0);
        })
    })

    modalImageContainer.addEventListener('click', function() {
        closeModalImage();
    })

    document.addEventListener('keydown', function() {
        if (modalImageContainer.querySelector('img')) closeModalImage();
    });

    function closeModalImage() {
        modalImageContainer.classList.remove('active');
        setTimeout(function () {
            modalImageContainer.removeChild(modalImageContainer.querySelector('img'));
        }, 200);
    }
}