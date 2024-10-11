document.addEventListener("DOMContentLoaded", function () {
    const approveButton = document.querySelector(".btn");
    const cancelButton = document.querySelector(".btn1");
    
    approveButton.addEventListener("click", function () {
        if (handleApprovalOrCancellation()) {
            alert("승인되었습니다");
        } else {
            alert("계정을 선택하세요");
            return false; // 폼 제출을 막음
        }
    });

    cancelButton.addEventListener("click", function () {
        if (handleApprovalOrCancellation()) {
            alert("취소되었습니다");
        } else {
            alert("계정을 선택하세요");
            return false; // 폼 제출을 막음
        }
    });

    function handleApprovalOrCancellation() {
        const checkboxes = document.querySelectorAll(".chk");
        let isAnyChecked = false;

        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                isAnyChecked = true;
            }
        });

        return isAnyChecked;
    }
});
