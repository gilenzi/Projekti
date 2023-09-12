
const btn = document.querySelector('.btn-notification');
const notificationContainer = document.querySelector('.notification__container');

btn .addEventListener('click',showNotification);

function showNotification(){
    notificationContainer.insertAdjacentHTML('beforeend',createNoticifation());
    setTimeout(removeElements,2000);
}

function createNoticifation(){
    let msgNumber = notificationContainer.querySelectorAll('div').length;
    msgNumber++;
    const html = `
    <div class="notification__text-container">
        <p class="notification__text">Message ${msgNumber}</p>
    </div>
    `;
    return html;
}

function removeElements(){
    const elements = notificationContainer.querySelector('div');
    elements.remove();
}