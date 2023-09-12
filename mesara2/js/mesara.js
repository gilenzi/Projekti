'use-strict';

const productContaienr = document.querySelector('.products-container');
const productCategory = document.querySelector('.product-categories');

const menu = [
    // JUNECI PROGRAM
    {
        title: "Juneći but",
        category: "svinjsko meso",
        image: "images/juneci-but.jpg"
    },
    {
        title: "Juneća plećka",
        category: "junece meso",
        image: "images/juneca-plecka.jpg"
    },
    {
        title: "Juneći vrat",
        category: "junece meso",
        image: "images/juneci-vrat.jpg"
    },
    {
        title: "Juneća rebra",
        category: "junece meso",
        image: "images/juneca-rebra.jpg"
    },
    {
        title: "Juneća rozbratna",
        category: "junece meso",
        image: "images/juneca-rozbratna.jpg"
    },
    {
        title: "Juneće grudi",
        category: "junece meso",
        image: "images/junece-grudi.jpg"
    },
    {
        title: "Juneći biftek",
        category: "junece meso",
        image: "images/juneci-biftek.jpg"
    },
    {
        title: "Juneći ramstek",
        category: "junece meso",
        image: "images/juneci-ramstek.jpg"
    },
    {
        title: "Juneće mleveno meso",
        category: "junece meso",
        image: "images/junece-mleveno-meso.jpg"
    },
    // SVINJSKI PROGRAM
    {
        title: "Svinjski but",
        category: "svinjsko meso",
        image: "images/svinjski-but.jpg"
    },
    {
        title: "Svinjska plećka",
        category: "svinjsko meso",
        image: "images/svinjska-plecka.jpg"
    },
    {
        title: "Svinjski vrat",
        category: "svinjsko meso",
        image: "images/svinjski-vrat.jpg"
    },
    {
        title: "Svinjski vrat BK",
        category: "svinjsko meso",
        image: "images/svinjski-vrat-bk.jpg"
    },
    {
        title: "Svinjska krmenadla",
        category: "svinjsko meso",
        image: "images/svinjska-krmenadla.jpg"
    },
    {
        title: "Svinjska rebra",
        category: "svinjsko meso",
        image: "images/svinjska-rebra.jpg"
    },
    {
        title: "Svinjska sveža slanina obradjena",
        category: "svinjsko meso",
        image: "images/svinjska-slanina.jpg"
    },
    {
        title: "Svinjska sveža slanina neobradjena",
        category: "svinjsko meso",
        image: "images/svinjska-slanina.jpg"
    },
    {
        title: "Svinjske polutke",
        category: "svinjsko meso",
        image: "images/svinjska-polutka.jpg"

    },
    {
        title: "Svinjsko mleveno meso",
        category: "svinjsko meso",
        image: "images/svinjsko-mleveno-meso.jpg"
    },
    // PROIZVODI OD MESA
    {
        title: "Svinjska rolovana plećka",
        category: "proizvodi od mesa",
        image: "images/svinjska-rolovana-plecka.jpg"
    },
    {
        title: "Rolovano pile",
        category: "proizvodi od mesa",
        image: "images/rolovano-pile.jpg"
    },
    {
        title: "Rolovani cevapi",
        category: "proizvodi od mesa",
        image: "images/rolovani-cevapi.jpg"
    },
    {
        title: "Ćevapi",
        category: "proizvodi od mesa",
        image: "images/cevapi.jpg"
    },
    {
        title: "Ljuti ćevapi",
        category: "proizvodi od mesa",
        image: "images/cevapi.jpg"
    },
    {
        title: "Šiš ćevap",
        category: "proizvodi od mesa",
        image: "images/sis-cevap.jpg"
    },
    {
        title: "Roštiljska tanka kobasica",
        category: "proizvodi od mesa",
        image: "images/rositljska-tanka-kobasica.jpg"
    },
    {
        title: "Roštiljska debela kobasica",
        category: "proizvodi od mesa",
        image: "images/rositljska-debela-kobasica.jpg"
    },
    {
        title: "Roštiljska dimljena kobasica",
        category: "proizvodi od mesa",
        image: "images/.jpg"
    },
    {
        title: "Kranjska kobasica",
        category: "proizvodi od mesa",
        image: "images/.jpg"
    },
    {
        title: "Pljeskavica",
        category: "proizvodi od mesa",
        image: "images/pljeskavica.jpg"
    },
    {
        title: "Gurmanska pljeskavica",
        category: "proizvodi od mesa",
        image: "images/gurmanska-pljeskavica.png"
    }

]

// LOAD/DISPLAY PRODUCTS
window.addEventListener('DOMContentLoaded',function(){
    displayMenuItems(menu);
});
// FILTER ITEMS
productCategory.addEventListener('click',function(e){
    const category = e.target.dataset.category;

    if(category === 'svi proizvodi'){
        displayMenuItems(menu);
    }
    if(category && category !== 'svi proizvodi'){

        const filteredArr = menu.filter(item => item.category === category);
        displayMenuItems(filteredArr);
    }
});

function displayMenuItems(menuItems){
    let displayMenu = menuItems.map(item => {
        return `            
        <div class="product">
            <img src="${item.image}" alt="${item.title}">
            <div class="about-product">
                <p>${item.title}</p>
            </div>
        </div>`
    });
    return productContaienr.innerHTML = displayMenu.join('');
}