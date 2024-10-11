document.addEventListener('DOMContentLoaded', function () {
    // 모달창 열기와 닫기
    const modal = document.getElementById('addModal');
    const closeModal = document.querySelector('#addModal .close');
    const saveButton = document.getElementById('saveItem');
    const modalTitle = document.getElementById('modalTitle');
    let isEditing = false;
    let currentEditingRow = null;

    // 등록 모달 열기
    document.querySelector('.addBtn').addEventListener('click', function () {
        isEditing = false;
        modalTitle.textContent = '품목 추가';
        document.getElementById('itemForm').reset(); // 폼 리셋
        modal.style.display = 'block';
    });

    // 모달 닫기
    closeModal.addEventListener('click', function () {
        modal.style.display = 'none';
    });

    window.addEventListener('click', function (event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    });

    // 저장 버튼 클릭 시
    saveButton.addEventListener('click', function () {
        const itemCode = document.getElementById('itemCode').value.trim();
        const itemName = document.getElementById('itemName').value.trim();
        const itemImageInput = document.getElementById('itemImage');
        let itemImageUrl = '';

        if (itemImageInput.files && itemImageInput.files[0]) {
            const file = itemImageInput.files[0];
            itemImageUrl = URL.createObjectURL(file);
        }

        if (isEditing && currentEditingRow) {
            updateRow(currentEditingRow, itemCode, itemName, itemImageUrl);
        } else {
            addItem(itemCode, itemName, itemImageUrl);
        }

        modal.style.display = 'none';
    });

    // 테이블에 항목 추가
    function addItem(code, name, imageUrl) {
        let table = document.querySelector('#table');
        let newRow = table.insertRow();

        newRow.insertCell(0).textContent = code;
        newRow.insertCell(1).textContent = name;
        newRow.insertCell(2).innerHTML = imageUrl ? `<img src="${imageUrl}" style="width:50px; height:50px;">` : '이미지 없음';
        newRow.insertCell(3).innerHTML = `<img class="pen editButton" src="/image/edit.png" title="수정">`;
        newRow.insertCell(4).innerHTML = `<img class="bin delButton" src="/image/delete.png" title="삭제">`;

        setupRowEvents(newRow);
    }

    // 테이블 행 수정
    function updateRow(row, code, name, imageUrl) {
        row.cells[0].textContent = code;
        row.cells[1].textContent = name;
        row.cells[2].innerHTML = imageUrl ? `<img src="${imageUrl}" style="width:50px; height:50px;">` : '이미지 없음';
    }

    // 초기 이벤트 설정
    function setupRowEvents(row) {
        row.querySelector('.editButton').addEventListener('click', function (event) {
            isEditing = true;
            currentEditingRow = event.currentTarget.parentNode.parentNode;
            modalTitle.textContent = '품목 수정';

            const code = currentEditingRow.cells[0].textContent.trim();
            const name = currentEditingRow.cells[1].textContent.trim();
            const image = currentEditingRow.cells[2].querySelector('img');

            document.getElementById('itemCode').value = code;
            document.getElementById('itemName').value = name;

            modal.style.display = 'block';
        });

        row.querySelector('.delButton').addEventListener('click', function (event) {
            event.currentTarget.parentNode.parentNode.remove();
        });
    }

    // 기존 행에 대해 이벤트 설정
    document.querySelectorAll('#table tr').forEach(function (row, index) {
        if (index > 0) { // 헤더를 제외한 행들만
            setupRowEvents(row);
        }
    });
});
