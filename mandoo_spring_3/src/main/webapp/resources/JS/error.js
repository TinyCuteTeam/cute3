document.addEventListener("DOMContentLoaded", function() {
    const addButton = document.getElementById('addButton'); // 에러 추가 버튼
    const popup = document.getElementById('popup'); // 에러 추가 모달 창
    const errorForm = document.getElementById('errorForm');
    const closePopup = document.getElementById('close-popup'); // 에러 추가 모달 창 닫기

    // 모달 창 열기 (에러 코드 추가)
    addButton.addEventListener('click', function () {
        popup.style.display = 'flex';
        document.getElementById('action').value = 'add';
        document.getElementById('error_Id').value = '';
        document.getElementById('error_Name').value = '';
        document.getElementById('error_Contents').value = '';
    });

    // 모달 창 닫기
    closePopup.addEventListener('click', function () {
        popup.style.display = 'none';
    });

    window.addEventListener('click', function (event) {
        if (event.target == popup) {
            popup.style.display = 'none';
        }
    });

    // 수정 모달 창 열기 update
    const popup_update = document.getElementById('popup_update'); // 모달 창 - 수정
    const updateClose = document.getElementById('updateClose'); // 수정 모달 창 닫기

    // 수정 버튼 클릭 시
    document.querySelectorAll('.erroreditButton').forEach(button => {
        button.addEventListener('click', function() {
            const error_editId = this.dataset.errorId; // 수정할 오류 ID
            const error_editName = this.dataset.errorName; // 수정할 오류 이름
            const error_editContents = this.dataset.errorContents; // 수정할 오류 내용

            popup_update.style.display = 'flex'; // 수정 모달 열기
            document.getElementById('actionEdit').value = 'update'; // action 값 설정

            // 오류 ID, 이름, 내용을 수정 모달에 세팅
            document.getElementById('error_editId').value = error_editId; // ID 세팅
            document.getElementById('error_editName').value = error_editName; // 이름 세팅
            document.getElementById('error_editContents').value = error_editContents; // 내용 세팅
        });
    });

    // 수정 모달 창 닫기
    updateClose.addEventListener('click', function () {
        popup_update.style.display = 'none'; // 수정 모달을 숨김
    });

    // 삭제 버튼 클릭 시
    document.querySelectorAll('.errordelButton').forEach(button => {
        button.addEventListener('click', function() {
            const form = this.closest('form'); // 버튼과 가장 가까운 form을 찾음
            const errorId = form.querySelector('input[name="error_Id"]').value;

            if (confirm('정말로 이 에러 코드를 삭제하시겠습니까?')) {
                form.submit(); // 폼을 수동으로 제출
            } else {
                // 취소하면 폼 제출을 하지 않음
                return false;
            }
        });
    });
});