window.addEventListener("load", (event) => {
    let links = document.querySelectorAll("a[href]");
    let exit_button = document.getElementById('exit_button');
    links.forEach(link => {
        link.addEventListener("click", (event) => {
            const url = event.target.getAttribute("href");
            if (url.substring(0,1) != "#") {
                $('#modal').modal('show');
                event.preventDefault();
                exit_button.addEventListener("click", (event) => {
                    window.location = url;
                });
            };
        })
    })
})
