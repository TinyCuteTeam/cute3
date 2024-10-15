document.addEventListener("DOMContentLoaded", function() {
    const addButton = document.getElementById('addButton'); //에러추가버튼
    
    const popup = document.getElementById('popup'); 			//에러추가 모달창
    const errorForm = document.getElementById('errorForm');
    const closePopup = document.getElementById('close-popup'); 	//에러추가 모달창닫기
    
    // 모달창 열기 (에러코드 추가)
    addButton.addEventListener('click', function () {
        popup.style.display = 'flex';
        document.getElementById('action').value = 'add';
        document.getElementById('error_Id').value = '';
        document.getElementById('error_Name').value = '';
        document.getElementById('error_Contents').value = '';
        // errorForm.action = '/insert';  // 명확하게 action 설정
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
    

    // 수정 모달창 열기 update  
    const popup_update = document.getElementById('popup_update'); 		//모달창 - 수정
    const error_editForm = document.getElementById('error_editForm'); 	//수정모달  
    const updateClose = document.getElementById('updateClose'); 		//수정 모달창닫기
    
    
    // 수정 버튼 클릭 시 
    document.querySelectorAll('.erroreditButton').forEach(button => {
        button.addEventListener('click', function() {
        	//수정 모달 클릭시 기존에 작성되어 있는 데이터 불러오도록 
            const error_editId = this.dataset.errorId; 					// 수정할 오류 ID
        	const error_editName = this.dataset.errorName; 				// 수정할 오류 이름
       		const error_editContents = this.dataset.errorContents; 		// 수정할 오류 내용

            popup_update.style.display = 'flex'; 						// 수정 모달 열기
            document.getElementById('actionEdit').value = 'update'; 	// action 값 설정
            
        // 오류 ID, 이름, 내용을 수정 모달에 세팅
        document.getElementById('error_editId').value = error_editId;	 	// ID 세팅
        document.getElementById('error_editName').value = error_editName; 	// 이름 세팅
        document.getElementById('error_editContents').value = error_editContents; // 내용 세팅

            //errorForm.action = '/mandoo/update';  // 명확하게 action 설정
        });
    });
    
    // 수정 모달창 저장 버튼 클릭 시
//	const errorEditSubmit = document.querySelector('#errorSubmit');
//	errorEditSubmit.addEventListener('click', function() {
    //error_editForm.submit();
	//});
	
      // 수정 모달창 닫기
	updateClose.addEventListener('click', function () {
    	popup_update.style.display = 'none'; // 수정 모달을 숨김
	});

    // 삭제 버튼 클릭 시
    document.querySelectorAll('.errordelButton').forEach(button => {
        button.addEventListener('click', function() {
            const errorId = this.dataset.errorId;
            if (confirm('정말로 이 에러 코드를 삭제하시겠습니까?')) {
                document.getElementById('action').value = 'delete';
                document.getElementById('errorId').value = errorId;
                console.log(errorId)
                //errorForm.action = '/mandoo/Error';  // 명확하게 action 설정
                errorForm.submit();
            }
        });
    });
});
