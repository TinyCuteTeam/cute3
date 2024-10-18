document.addEventListener("DOMContentLoaded", () => {
    // 글쓰기 버튼 클릭 시 페이지 이동 처리
    document.getElementById('write-button').addEventListener('click', function() {
        window.location.href = '/mandoo/boardAddPage';  // 컨텍스트 패스는 필요시 추가
    });

    const userInfo = JSON.parse(sessionStorage.getItem("userInfo"));
    const id = document.getElementById("id");

    if (userInfo) {
        console.log(`로그인 사용자: ${userInfo.user_Name}`);
        if (id) {
            id.innerText = `${userInfo.user_Name}님`;
        }
    } else {
        console.log("사용자가 로그인하지 않았습니다.");
    }
});
