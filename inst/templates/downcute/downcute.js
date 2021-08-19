
function set_light_style() {
    const style = document.documentElement.style;
    style.setProperty('--accent-color', '#175d96');
    style.setProperty('--page-background', '#f7f7f7');
    style.setProperty('--header-background', '#fff');
    style.setProperty('--header-text-color', 'var(--text-color)');
    style.setProperty('--text-color', '#000');
    style.setProperty('--link-color', 'var(--accent-color)');
    style.setProperty('--sidebar-width', '280px');
    style.setProperty('--sidebar-background', 'var(--page-background)');
    style.setProperty('--sidebar-link-color', '#444');
    style.setProperty('--sidebar-link-active-color', 'var(--accent-color)');
    style.setProperty('--sidebar-link-arrow-color', '#999');
    style.setProperty('--main-background', 'var(--page-background)');
    style.setProperty('--border-color', '#eaeaea');
    style.setProperty('--header-height', '0px');
    style.setProperty('--code-font', 'SFMono-Regular, Consolas, Liberation Mono, Menlo, Courier, monospace');
    style.setProperty('--tip-color', 'rgb(6, 125, 247)');
    style.setProperty('--success-color', '#42b983');
    style.setProperty('--warning-color', '#ff9800');
    style.setProperty('--danger-color', 'rgb(255, 0, 31)');
    style.setProperty('--nav-link-color', '#2c3e50');
    style.setProperty('--nav-link-border-color', 'var(--accent-color)');
    style.setProperty('--code-block-background', '#011627');
    style.setProperty('--code-block-text-color', 'white');
    style.setProperty('--code-block-shadow-color', '#333');
    style.setProperty('--code-block-shadow-width', '0px');
    style.setProperty('--highlighted-line-background', '#022a4b');
    style.setProperty('--highlighted-line-border-color', '#ffa7c4');
    style.setProperty('--inline-code-color', 'rgb(116, 66, 16)');
    style.setProperty('--inline-code-background', 'rgb(254, 252, 191)');
    style.setProperty('--loader-primary-color', '#f3f3f3');
    style.setProperty('--loader-secondary-color', '#ecebeb');
    style.setProperty('--table-header-background', '#fafafa');
    style.setProperty('--table-header-color', '#555');
    style.setProperty('--docute-select-height', '38px');
    style.setProperty('--search-icon-color', '#999');
    style.setProperty('--search-focus-border-color', '#ccc');
    style.setProperty('--search-focus-icon-color', '#333');
    style.setProperty('--search-result-hover-background', '#f9f9f9');
    style.setProperty('--blockquote-background-color', '#f1f1f1');
    style.setProperty('--blockquote-text-color', '#6a737d');
    style.setProperty('--blockquote-border-color', '#ccc');
    style.setProperty('--datatable-odd-background', '#f9f9f9');
    style.setProperty('--datatable-even-background', '#ffffff');
    style.setProperty('--datatable-hover-background', '#f6f6f6');
    style.setProperty('--anchor-color', '#bbbbbb');
    style.setProperty('--toc-border-color', '#aaaaaa');
}

function set_dark_style() {
    const style = document.documentElement.style;
    style.setProperty('--accent-color', 'rgb(92, 162, 219)');
    style.setProperty('--page-background', '#2f3136');
    style.setProperty('--header-background', 'var(--page-background)');
    style.setProperty('--header-text-color', 'var(--text-color)');
    style.setProperty('--text-color', 'hsla(0,0%,100%,0.88)');
    style.setProperty('--link-color', 'var(--accent-color)');
    style.setProperty('--sidebar-width', '280px');
    style.setProperty('--sidebar-background', 'var(--page-background)');
    style.setProperty('--sidebar-link-color', 'var(--text-color)');
    style.setProperty('--sidebar-link-active-color', 'var(--accent-color)');
    style.setProperty('--sidebar-link-arrow-color', '#999');
    style.setProperty('--main-background', 'var(--page-background)');
    style.setProperty('--border-color', '#3e4147');
    style.setProperty('--header-height', '0px');
    style.setProperty('--code-font', 'SFMono-Regular, Consolas, Liberation Mono, Menlo, Courier, monospace');
    style.setProperty('--tip-color', 'rgb(6, 125, 247)');
    style.setProperty('--success-color', '#42b983');
    style.setProperty('--warning-color', '#ff9800');
    style.setProperty('--danger-color', 'rgb(255, 0, 31)');
    style.setProperty('--nav-link-color', 'var(--text-color)');
    style.setProperty('--nav-link-border-color', 'var(--accent-color)');
    style.setProperty('--code-block-background', '#011627');
    style.setProperty('--code-block-text-color', 'white');
    style.setProperty('--code-block-shadow-color', '#333');
    style.setProperty('--code-block-shadow-width', '0px');
    style.setProperty('--highlighted-line-background', '#022a4b');
    style.setProperty('--highlighted-line-border-color', '#ffa7c4');
    style.setProperty('--inline-code-color', '#e6e6e6');
    style.setProperty('--inline-code-background', '#373c49');
    style.setProperty('--loader-primary-color', 'hsla(0, 0%, 100%, 0.08)');
    style.setProperty('--loader-secondary-color', 'hsla(0, 0%, 100%, 0.18)');
    style.setProperty('--table-header-background', 'var(--border-color)');
    style.setProperty('--table-header-color', '#C6C6C6');
    style.setProperty('--docute-select-height', '38px');
    style.setProperty('--search-icon-color', '#999');
    style.setProperty('--search-focus-border-color', '#999');
    style.setProperty('--search-focus-icon-color', '#ccc');
    style.setProperty('--search-result-background', '#27292f');
    style.setProperty('--search-result-hover-background', '#1e2025');
    style.setProperty('--content-link-border', '2px solid hsla(0, 0%, 100%, 0.28)');
    style.setProperty('--content-link-hover-border-color', 'current-color');
    style.setProperty('--blockquote-background-color', '#35363A');
    style.setProperty('--blockquote-text-color', '#a5a6aa');
    style.setProperty('--blockquote-border-color', '#a5a6aa');
    style.setProperty('--datatable-odd-background', '#2f3136');
    style.setProperty('--datatable-even-background', '#333539');
    style.setProperty('--datatable-hover-background', '#35374B');
    style.setProperty('--anchor-color', '#666666');
    style.setProperty('--toc-border-color', '#888888');
}


// CSS variables
set_light_style();

window.addEventListener("load", (event) => {

    // Dark mode 
    const toggler = document.querySelector(".dark-theme-toggler .toggle");
    toggler.addEventListener("click", (event) => {
        toggler.classList.toggle("checked");
        if (toggler.classList.contains("checked")) {
            set_dark_style();
        } else {
            set_light_style();
        }

    })

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

