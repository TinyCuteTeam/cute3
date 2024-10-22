document.addEventListener('DOMContentLoaded', function () {
    const addButton = document.getElementById('add-button');
    const deleteButton = document.getElementById('delete-button');
    const searchButton = document.getElementById('search-button');
    const cancelButton = document.getElementById('cancel-button');
    const popup = document.getElementById('popup');
    const closePopup = document.getElementById('close-popup');
    const registrationForm = document.getElementById('registration-form');
    const searchInput = document.getElementById('search-input');
    const dataContainer = document.getElementById('data-container');

    // 팝업창 열기
    if (addButton && popup) {
        addButton.addEventListener('click', function () {
            popup.style.display = 'flex';
        });
    }

    // 팝업창 닫기
    if (closePopup && popup) {
        closePopup.addEventListener('click', function () {
            popup.style.display = 'none';
        });
    }

    // 검색 버튼
    if (searchButton && dataContainer) {
        searchButton.addEventListener('click', function () {
            const searchQuery = searchInput.value.toLowerCase();
            const planItems = dataContainer.querySelectorAll('.flex.round');

            planItems.forEach(function (row) {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchQuery)) {
                    row.style.display = 'flex';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    }

    // 검색 취소 버튼
    if (cancelButton && dataContainer) {
        cancelButton.addEventListener('click', function () {
            searchInput.value = '';
            const planItems = dataContainer.querySelectorAll('.flex.round');
            planItems.forEach(function (row) {
                row.style.display = 'flex';
            });
        });
    }

    // 삭제 버튼 (폼 제출)
    if (deleteButton) {
        deleteButton.addEventListener('click', function (e) {
            const selectedCheckboxes = dataContainer.querySelectorAll('.item-checkbox:checked');
            if (selectedCheckboxes.length === 0) {
                alert('삭제할 항목을 선택하세요.');
                e.preventDefault();
            } else {
                if (!confirm('선택한 항목을 삭제하시겠습니까?')) {
                    e.preventDefault();
                }
            }
        });
    }
});
