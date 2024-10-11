document.addEventListener("DOMContentLoaded", () => {
    const boardForm = document.getElementById("board-form");

    boardForm.addEventListener("submit", (event) => {
        // 서버로 데이터를 보내므로 기본 폼 동작을 유지
        // event.preventDefault(); // 이 부분을 제거

        // 폼 데이터를 자동으로 수집하고 서버로 전송함
        // 폼 태그에 action과 method 속성으로 경로와 POST 방식을 설정했으므로 JS에서 따로 처리할 필요 없음
    });
});
