document.addEventListener("DOMContentLoaded", function() {
    const addButton = document.getElementById('addButton');
    const popup = document.getElementById('popup');
    const closePopup = document.getElementById('close-popup');
    const errorForm = document.getElementById('errorForm');

    // 모달창 열기 (추가)
    addButton.addEventListener('click', function () {
        popup.style.display = 'flex';
        document.getElementById('action').value = 'add';
        document.getElementById('errorId').value = '';
        document.getElementById('errorName').value = '';
        document.getElementById('errorContents').value = '';
        errorForm.action = '/mandoo/Error';  // 명확하게 action 설정
    });

    // 모달창 닫기
    closePopup.addEventListener('click', function () {
        popup.style.display = 'none';
    });

    window.addEventListener('click', function (event) {
        if (event.target == popup) {
            popup.style.display = 'none';
        }
    });

    // 수정 버튼 클릭 시
    document.querySelectorAll('.erroreditButton').forEach(button => {
        button.addEventListener('click', function() {
            const errorId = this.dataset.errorId;
            const errorName = this.dataset.errorName;
            const errorContents = this.dataset.errorContents;

            popup.style.display = 'flex';
            document.getElementById('action').value = 'update';
            document.getElementById('errorId').value = errorId;
            document.getElementById('errorName').value = errorName;
            document.getElementById('errorContents').value = errorContents;
            errorForm.action = '/mandoo/Error';  // 명확하게 action 설정
        });
    });

    // 삭제 버튼 클릭 시
    document.querySelectorAll('.errordelButton').forEach(button => {
        button.addEventListener('click', function() {
            const errorId = this.dataset.errorId;
            if (confirm('정말로 이 에러 코드를 삭제하시겠습니까?')) {
                document.getElementById('action').value = 'delete';
                document.getElementById('errorId').value = errorId;
                errorForm.action = '/mandoo/Error';  // 명확하게 action 설정
                errorForm.submit();
            }
        });
    });
});
