document.getElementById('back-button').addEventListener('click', function () {
    window.history.back();
});

document.addEventListener("DOMContentLoaded", () => {
    // 서버로부터 받은 데이터가 이미 JSP에서 렌더링되었으므로 클라이언트 측에서 별도로 데이터를 가져올 필요 없음

    // 댓글 관련 부분은 필요에 따라 서버에서 처리하도록 수정 가능
    const commentForm = document.getElementById('comment-form');
    const commentList = document.getElementById('comment-list');

    commentForm.addEventListener('submit', function (event) {
        event.preventDefault();
        const content = document.getElementById('comment-content').value;

        // 서버에 댓글 전송 처리 필요
        const commentItem = document.createElement('div');
        commentItem.classList.add('comment-item');

        commentItem.innerHTML = `
            <strong>작성자 이름</strong>
            <p>${content}</p>
            <button class="reply-button">댓글</button>
            <div class="reply-form" style="display: none;">
                <textarea class="reply-content" placeholder="댓글을 입력하세요." required></textarea>
                <button class="submit-reply">답글 달기</button>
            </div>
            <div class="reply-list"></div>
        `;

        commentList.appendChild(commentItem);
        commentForm.reset();

        // 대댓글 버튼 클릭 시 대댓글 폼 표시
        const replyButton = commentItem.querySelector('.reply-button');
        const replyForm = commentItem.querySelector('.reply-form');
        replyButton.addEventListener('click', () => {
            replyForm.style.display = replyForm.style.display === 'none' ? 'block' : 'none';
        });

        // 대댓글 추가
        const submitReplyButton = commentItem.querySelector('.submit-reply');
        submitReplyButton.addEventListener('click', function () {
            const replyContent = commentItem.querySelector('.reply-content').value;

            const replyItem = document.createElement('div');
            replyItem.classList.add('reply-item');
            replyItem.innerHTML = `<strong>작성자 이름</strong><p>${replyContent}</p>`;
            commentItem.querySelector('.reply-list').appendChild(replyItem);

            replyForm.style.display = 'none'; // 대댓글 폼 숨기기
        });
    });
});
