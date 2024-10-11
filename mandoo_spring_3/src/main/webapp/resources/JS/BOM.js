document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById('addEditModal');
    const closeBtn = document.querySelector('.close');
    const bomForm = document.getElementById('bomForm');

    closeBtn.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    }

    document.querySelectorAll('.editBtn').forEach(button => {
        button.addEventListener('click', function() {
            const bomId = this.getAttribute('data-bomid');
            const itemCode = this.getAttribute('data-itemcode');
            const bomCount = this.getAttribute('data-bomcount');
            const bomUnit = this.getAttribute('data-bomunit');
            const bomEtc = this.getAttribute('data-bometc');

            document.getElementById('bomId').value = bomId;
            document.getElementById('itemCode').value = itemCode;
            document.getElementById('bomCount').value = bomCount;
            document.getElementById('bomUnit').value = bomUnit;
            document.getElementById('bomEtc').value = bomEtc;
            document.getElementById('actionType').value = 'update';
            document.getElementById('modalTitle').innerText = 'BOM 수정';

            // 선택된 itemCode를 select 태그에서 선택 상태로 설정
            const optionToSelect = document.querySelector(`#itemCode option[value="${itemCode}"]`);
            if (optionToSelect) {
                optionToSelect.selected = true;
            }

            modal.style.display = 'block';
        });
    });

    document.getElementById('addBtn').addEventListener('click', function() {
        bomForm.reset();
        document.getElementById('actionType').value = 'add';
        document.getElementById('modalTitle').innerText = 'BOM 추가';

        modal.style.display = 'block';
    });
});
