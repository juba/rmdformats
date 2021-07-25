const downcute_chaos_variables_default = `
:root {
    --accent-color: #175d96;
    --page-background: #f7f7f7;
    --page-content-code-background: #8ec6dc;
    --header-background: #fff;
    --header-text-color: #615c55;
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
    --inline-code-color: #000000;
    --inline-code-background: #00AEEF;
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

const downcute_chaos_variables_dark = `
:root {
    --accent-color: #00ffea;
    --page-background: rgb(20,20,21);
    --page-content-code-background: #0c2b29;
    --header-background: var(--page-background);
    --header-text-color: #BFB29E;
    --text-color: hsla(0,0%,100%,0.88);
    --link-color: var(--accent-color);
    --sidebar-width: 280px;
    --sidebar-background: var(--page-background);
    --sidebar-link-color: var(--text-color);
    --sidebar-link-active-color: var(--accent-color);
    --sidebar-link-arrow-color: #999;
    --main-background: var(--page-background);
    --border-color: #777777;
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
    --inline-code-color: var(--text-color);
    --inline-code-background: var(--header-text-color);
    --loader-primary-color: hsla(0, 0%, 100%, 0.08);
    --loader-secondary-color: hsla(0, 0%, 100%, 0.18);
    --table-header-background: #1f3937;
    --table-header-color: #ffffff;
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
    --datatable-odd-background: rgb(10,10,9);
    --datatable-even-background: #1d1c1c;
    --datatable-hover-background: #35374B;
    --anchor-color: #666666;
    --toc-border-color: #888888;
}
`

// CSS variables
const head = document.head;
const variables_style = document.createElement("style");
variables_style.id = "downcute_chaos-css-variables";
variables_style.innerHTML = downcute_chaos_variables_default;
head.appendChild(variables_style);

window.addEventListener("load", (event) => {



    // Dark mode
    const toggler = document.querySelector(".dark-theme-toggler .toggle");
    toggler.addEventListener("click", (event) => {
        toggler.classList.toggle("checked");
        if (toggler.classList.contains("checked")) {
            variables_style.innerHTML = downcute_chaos_variables_dark;
        } else {
            variables_style.innerHTML = downcute_chaos_variables_default;
        }

    })

    //dark by default
    $(".dark-theme-toggler .toggle").trigger("click");

    // Make tables responsive
    $(".page-content table").wrap("<div class='table-wrapper'></div>");

    // Fix for dots in level 1 and level 2 titles
    $('body .section.level1').each(function () {
        $(this).attr("id", $(this).attr("id").replace(/\./g, "-"));
    });
    $('body .section.level2').each(function () {
        $(this).attr("id", $(this).attr("id").replace(/\./g, "-"));
    });
    $('#toc ul li a').each(function () {
        $(this).attr("href", $(this).attr("href").replace(/\./g, "-"));
    });

    // ScrollSpy also requires that we use a Bootstrap nav component.
    $('#toc ul').first().addClass('nav');
    $('body').scrollspy({ target: '#toc' });

    $("body").removeClass("preload");

    // Prism highlighting
    const prism_highlight = new Event('prism_highlight');
    document.addEventListener('prism_highlight', (e) => Prism.highlightAll())

    let code_el = document.querySelectorAll("pre[class] code");
    code_el.forEach(el => {
        const classes = el.parentNode.className.split(" ");
        classes.forEach(classe => {
            if (classe != 'sourceCode') {
                el.classList.add('language-' + classe);
            }
        })
    })
    document.dispatchEvent(prism_highlight);




})

