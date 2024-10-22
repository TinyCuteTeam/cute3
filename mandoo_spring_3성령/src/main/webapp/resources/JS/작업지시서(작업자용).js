document.addEventListener("DOMContentLoaded", function() {
    // 검색 기능
    const searchInput = document.getElementById('search-input');
    const searchButton = document.getElementById('search-button');
    const resetButton = document.getElementById('reset-button');

    searchButton.addEventListener('click', function() {
        const query = searchInput.value.toLowerCase();
        const pageItems = document.querySelectorAll('.page-item');

        pageItems.forEach(item => {
            const text = item.textContent.toLowerCase();
            if (text.includes(query)) {
                item.style.display = 'flex';
            } else {
                item.style.display = 'none';
            }
        });
    });

    resetButton.addEventListener('click', function() {
        const pageItems = document.querySelectorAll('.page-item');
        pageItems.forEach(item => {
            item.style.display = 'flex';
        });
        searchInput.value = '';
    });

    // 모달 관련
    const addButton = document.getElementById('add-button');
    const popup = document.getElementById('popup');
    const closePopup = document.getElementById('close-popup');

    addButton.addEventListener('click', function () {
        popup.style.display = 'flex';
    });

    closePopup.addEventListener('click', function () {
        popup.style.display = 'none';
    });

    window.addEventListener('click', function (event) {
        if (event.target == popup) {
            popup.style.display = 'none';
        }
    });
});
