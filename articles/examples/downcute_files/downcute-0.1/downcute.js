const downcute_variables_default = `
:root {
    --accent-color: #175d96;
    --page-background: #f7f7f7;
    --header-background: #fff;
    --header-text-color: var(--text-color);
    --text-color: #000;
    --link-color: var(--accent-color);
    --sidebar-width: 280px;
    --sidebar-background: var(--page-background);
    --sidebar-link-color: #444;
    --sidebar-link-active-color: var(--accent-color);
    --sidebar-link-arrow-color: #999;
    --main-background: var(--page-background);
    --border-color: #eaeaea;
    --header-height: 0px;
    --code-font: SFMono-Regular, Consolas, Liberation Mono, Menlo, Courier, monospace;
    --tip-color: rgb(6, 125, 247);
    --success-color: #42b983;
    --warning-color: #ff9800;
    --danger-color: rgb(255, 0, 31);
    --nav-link-color: #2c3e50;
    --nav-link-border-color: var(--accent-color);
    --code-block-background: #011627;
    --code-block-text-color: white;
    --code-block-shadow-color: #333;
    --code-block-shadow-width: 0px;
    --highlighted-line-background: #022a4b;
    --highlighted-line-border-color: #ffa7c4;
    --inline-code-color: rgb(116, 66, 16);
    --inline-code-background: rgb(254, 252, 191);
    --loader-primary-color: #f3f3f3;
    --loader-secondary-color: #ecebeb;
    --table-header-background: #fafafa;
    --table-header-color: #555;
    --docute-select-height: 38px;
    --search-icon-color: #999;
    --search-focus-border-color: #ccc;
    --search-focus-icon-color: #333;
    --search-result-hover-background: #f9f9f9;
    --blockquote-background-color: #f1f1f1;
    --blockquote-text-color: #6a737d;
    --blockquote-border-color: #ccc;
    --datatable-odd-background: #f9f9f9;
    --datatable-even-background: #ffffff;
    --datatable-hover-background: #f6f6f6;
    --anchor-color: #bbbbbb;
    --toc-border-color: #aaaaaa;
}
`

const downcute_variables_dark = `
:root {
    --accent-color: rgb(92, 162, 219);
    --page-background: #2f3136;
    --header-background: var(--page-background);
    --header-text-color: var(--text-color);
    --text-color: hsla(0,0%,100%,0.88);
    --link-color: var(--accent-color);
    --sidebar-width: 280px;
    --sidebar-background: var(--page-background);
    --sidebar-link-color: var(--text-color);
    --sidebar-link-active-color: var(--accent-color);
    --sidebar-link-arrow-color: #999;
    --main-background: var(--page-background);
    --border-color: #3e4147;
    --header-height: 0px;
    --code-font: SFMono-Regular, Consolas, Liberation Mono, Menlo, Courier, monospace;
    --tip-color: rgb(6, 125, 247);
    --success-color: #42b983;
    --warning-color: #ff9800;
    --danger-color: rgb(255, 0, 31);
    --nav-link-color: var(--text-color);
    --nav-link-border-color: var(--accent-color);
    --code-block-background: #011627;
    --code-block-text-color: white;
    --code-block-shadow-color: #333;
    --code-block-shadow-width: 0px;
    --highlighted-line-background: #022a4b;
    --highlighted-line-border-color: #ffa7c4;
    --inline-code-color: #e6e6e6;
    --inline-code-background: #373c49;
    --loader-primary-color: hsla(0, 0%, 100%, 0.08);
    --loader-secondary-color: hsla(0, 0%, 100%, 0.18);
    --table-header-background: var(--border-color);
    --table-header-color: #C6C6C6;
    --docute-select-height: 38px;
    --search-icon-color: #999;
    --search-focus-border-color: #999;
    --search-focus-icon-color: #ccc;
    --search-result-background: #27292f;
    --search-result-hover-background: #1e2025;
    --content-link-border: 2px solid hsla(0, 0%, 100%, 0.28);
    --content-link-hover-border-color: current-color;
    --blockquote-background-color: #35363A;
    --blockquote-text-color: #a5a6aa;
    --blockquote-border-color: #a5a6aa;
    --datatable-odd-background: #2f3136;
    --datatable-even-background: #333539;
    --datatable-hover-background: #35374B;
    --anchor-color: #666666;
    --toc-border-color: #888888;
}
`

// CSS variables
const head = document.head;
const variables_style = document.createElement("style");
variables_style.id = "downcute-css-variables";
variables_style.innerHTML = downcute_variables_default;
head.appendChild(variables_style);

window.addEventListener("load", (event) => {

    // Prism highlighting
    let code_el = document.querySelectorAll("pre[class] code");
    code_el.forEach(el => {
        const classes = el.parentNode.className.split(" ");
        classes.forEach(classe => {
            if (classe != 'sourceCode') {
                el.classList.add('language-' + classe);
            }
        })
    })
    Prism.highlightAll();

    // Dark mode 
    const toggler = document.querySelector(".dark-theme-toggler .toggle");
    toggler.addEventListener("click", (event) => {
        toggler.classList.toggle("checked");
        if (toggler.classList.contains("checked")) {
            variables_style.innerHTML = downcute_variables_dark;
        } else {
            variables_style.innerHTML = downcute_variables_default;
        }

    })

    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('#toc ul').first().addClass('nav');
    $('body').scrollspy({target: '#toc'});
    
    $("body").removeClass("preload");

})

