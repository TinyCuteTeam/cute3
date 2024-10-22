document.addEventListener("DOMContentLoaded", function() {
    const addButton = document.getElementById('addButton'); //품목추가버튼
    const popup = document.getElementById('popup'); //모달창
    const closePopup = document.getElementById('close-popup'); //모달창닫기
    const updateClose = document.getElementById('updateClose'); //수정 모달창닫기
    const itemForm = document.getElementById('itemForm');
    
    //모달 가려뒀다가 품목추가 클릭시 모달 오픈 
    window.addEventListener('click', function (event) {
        if (event.target == popup) {
            popup.style.display = 'none';
        }
    });

    // 모달창 열기 (품목 추가)
    addButton.addEventListener('click', function () {
        popup.style.display = 'flex';
        document.getElementById('action').value = 'add';
        document.getElementById('itemCode').value = '';
        document.getElementById('itemName').value = '';
        document.getElementById('itemType').value = '';
       // document.getElementById('itemImage').value = ''; 
    });
    
    // 모달창 닫기
    closePopup.addEventListener('click', function () {
        popup.style.display = 'none';
    });

 
    

    //update  
    const popup_update = document.getElementById('popup_update'); //모달창 - 수정
    const item_editForm = document.getElementById('item_editForm'); //수정모달  
    
    // 수정 버튼 클릭 시 
    document.querySelectorAll('.editButton').forEach(button => {
        button.addEventListener('click', function() {
        
            const edit_itemCode = this.dataset.itemCode; // 수정할 품목 ID
        	const edit_itemName = this.dataset.itemName; // 수정할 품목 이름
       	 	const edit_itemType = this.dataset.itemType; // 원재료, 완제품

            popup_update.style.display = 'flex'; // 수정 모달 열기
            //document.getElementById('actionEdit').value = 'update'; // action 값 설정
            
            // 오류 ID, 이름, 내용을 수정 모달에 세팅
        document.getElementById('edit_itemCode').value = edit_itemCode; // 품목코드 세팅
        document.getElementById('edit_itemName').value = edit_itemName; // 이름 세팅
        document.getElementById('edit_itemType').value = edit_itemType; // 내용 세팅

            //item_editForm.action = 'itemUpdate';  // 명확하게 action 설정
        });
    });
     // 수정 모달창 닫기
	updateClose.addEventListener('click', function () {
    	popup_update.style.display = 'none'; // 수정 모달을 숨김
	});


 
});
