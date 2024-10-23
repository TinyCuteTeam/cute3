document.addEventListener('DOMContentLoaded', function() {
 	//const bomForm = document.getElementById('bomForm');
    //const bomIdField = document.getElementById('bomId');
    //const table = document.getElementById('table');
    
    const addNewBomBtn = document.getElementById('addNewBomBtn'); // BOM 추가버튼
    
    const popup = document.getElementById('popup'); 			//BOM 추가 모달창
    const bomInsertForm = document.getElementById('bomInsertForm');
    const closePopup = document.getElementById('close-popup'); 	// BOM 추가 모달창닫기
    
     // 모달창 열기 (BOM 추가)
    addNewBomBtn.addEventListener('click', function () {
        popup.style.display = 'flex';
        document.getElementById('action').value = 'add';
        document.getElementById('item_Code').value = '';
        document.getElementById('item_Name').value = '';
        document.getElementById('bom_Count').value = '';
        document.getElementById('bom_Unit').value = '';
        // errorForm.action = '/bomInsert';  // 명확하게 action 설정
    });
    
    // 모달창 닫기
    closePopup.addEventListener('click', function () {
        popup.style.display = 'none';
    });
    
    
    
    
    
    
    
    
    
    
    

    // 수정 모달창 열기 update  
    const popup_update = document.getElementById('popup_update'); 		//모달창 - 수정
    const bom_editForm = document.getElementById('bom_editForm'); 	//수정모달  
    const updateClose = document.getElementById('updateClose'); 		//수정 모달창닫기
    
    
    document.querySelectorAll('.bomEditBtn').forEach(button => {
    button.addEventListener('click', function() {
        // 데이터 속성에서 값 가져오기
        const edit_bom_Id = this.dataset.bomId // BOM ID
        const edit_bom_Count = this.dataset.bomCount; // 수량
        const edit_bom_Unit = this.dataset.bomUnit;   // 단위
        const edit_item_Code = this.dataset.itemCode; // 품목 코드
        const edit_item_Name = this.dataset.itemName; // 품목명
        
        
        // 모달창에 값 설정
        document.getElementById('edit_bom_Id').value = edit_bom_Id;
        document.getElementById('edit_item_Code').value = edit_item_Code; // 품목 코드
        document.getElementById('edit_item_Name').value = edit_item_Name; // 품목명
        document.getElementById('edit_bom_Count').value = edit_bom_Count;  // 수량
        document.getElementById('edit_bom_Unit').value = edit_bom_Unit;    // 단위

        popup_update.style.display = 'flex'; // 수정 모달 열기
        //document.getElementById('actionEdit').value = 'bomUpdate';
    });
});
    
   
    
    // 수정 모달창 저장 버튼 클릭 시
	const bomSubmit = document.querySelector('#bomSubmit');
	bomSubmit.addEventListener('click', function() {
    bom_editForm.submit(); // 폼을 제출
});
	
      // 수정 모달창 닫기
	updateClose.addEventListener('click', function () {
    	popup_update.style.display = 'none'; // 수정 모달을 숨김
	});

    
 
    
    
});
