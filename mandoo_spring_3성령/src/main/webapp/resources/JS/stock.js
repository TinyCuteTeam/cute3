document.addEventListener('DOMContentLoaded', function () {
    var updateModal = document.getElementById('update-modal');
    var addItemPopup = document.getElementById('popup-overlay');
    var closeUpdateModal = updateModal.querySelector('.close');
    var closeAddItemPopup = addItemPopup.querySelector('#close-popup');

    // Open Add Item Popup
    document.getElementById('open-popup').addEventListener('click', function () {
        addItemPopup.style.display = 'block';
    });

    // Close Add Item Popup
    closeAddItemPopup.addEventListener('click', function () {
        addItemPopup.style.display = 'none';
    });

    // Close Update Modal
    closeUpdateModal.addEventListener('click', function () {
        updateModal.style.display = 'none';
    });

    // Close modal if clicked outside
    window.onclick = function (event) {
        if (event.target == updateModal) {
            updateModal.style.display = 'none';
        }
        if (event.target == addItemPopup) {
            addItemPopup.style.display = 'none';
        }
    }

    // Open Update Modal
    document.querySelectorAll('.update-button').forEach(function (button) {
        button.addEventListener('click', function () {
            document.getElementById('update-item-id').value = button.getAttribute('data-id');
            document.getElementById('update-item-code').value = button.getAttribute('data-code');
            document.getElementById('update-item-name').value = button.getAttribute('data-name');
            document.getElementById('update-item-stock').value = button.getAttribute('data-count');
            document.getElementById('update-item-location').value = button.getAttribute('data-location');
            document.getElementById('update-item-sort').value = button.getAttribute('data-sort');

            updateModal.style.display = 'block';
        });
    });
});

// Get modals
const addItemPopup = document.getElementById('add-item-popup');
const updatePopup = document.getElementById('update-popup');
const stockUpdatePopup = document.getElementById('stock-update-popup');

// Get buttons that open the modals
const openAddPopup = document.getElementById('open-add-popup');
const stockUpdateButtons = document.querySelectorAll('.stock-update-button');

// Get <span> elements that close the modals
const closeAddItemPopup = document.getElementById('close-add-item-popup');
const closeUpdatePopup = document.getElementById('close-update-popup');
const closeStockUpdatePopup = document.getElementById('close-stock-update-popup');

// Function to open the Add Item modal
openAddPopup.onclick = function() {
    addItemPopup.style.display = 'block';
};

// Function to open the Stock Update modal with specific data
stockUpdateButtons.forEach(button => {
    button.onclick = function() {
        document.getElementById('stock-update-item-id').value = this.getAttribute('data-id');
        document.getElementById('stock-update-item-stock').value = this.getAttribute('data-count');
        stockUpdatePopup.style.display = 'block';
    };
});

// Function to open the Update Item modal with specific data
document.querySelectorAll('.update-button').forEach(button => {
    button.onclick = function() {
        document.getElementById('update-item-id').value = this.getAttribute('data-id');
        document.getElementById('update-item-code').value = this.getAttribute('data-code');
        document.getElementById('update-item-name').value = this.getAttribute('data-name');
        document.getElementById('update-item-stock').value = this.getAttribute('data-count');
        document.getElementById('update-item-location').value = this.getAttribute('data-location');
        document.getElementById('update-item-sort').value = this.getAttribute('data-sort');
        updatePopup.style.display = 'block';
    };
});

// Function to close the modals
closeAddItemPopup.onclick = function() {
    addItemPopup.style.display = 'none';
};

closeUpdatePopup.onclick = function() {
    updatePopup.style.display = 'none';
};

closeStockUpdatePopup.onclick = function() {
    stockUpdatePopup.style.display = 'none';
};

// Click outside of the modal to close it
window.onclick = function(event) {
    if (event.target === addItemPopup) {
        addItemPopup.style.display = 'none';
    }
    if (event.target === updatePopup) {
        updatePopup.style.display = 'none';
    }
    if (event.target === stockUpdatePopup) {
        stockUpdatePopup.style.display = 'none';
    }
};

