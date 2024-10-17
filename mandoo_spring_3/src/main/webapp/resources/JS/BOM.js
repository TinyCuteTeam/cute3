document.addEventListener('DOMContentLoaded', function() {
 	const bomForm = document.getElementById('bomForm');
    const bomIdField = document.getElementById('bomId');
    const table = document.getElementById('table');
        
            // 행 추가 버튼 클릭 시 빈 행 추가
        document.getElementById('addRowBtn').addEventListener('click', function() {
            const newRow = table.insertRow();
            
                 //여기 한번 더 확인 질문 
            newRow.innerHTML = `
                <td>
                    <select name="itemCode">
                        <c:forEach var="item" items="${itemList}">
                            <option value="${item.itemCode}" data-itemname="${item.itemName}">${item.itemName}</option>
                        </c:forEach>
                    </select>
                </td>
                <td><input type="text" name="bomName"></td>
                <td><input type="number" name="bomCount"></td>
                <td><input type="text" name="bomUnit"></td>
                <td><button type="button" class="editBtn">수정</button></td>
                <td><button type="button" class="delBtn editBtn">삭제</button></td>
            `;

            // 새로 추가된 행에 이벤트 리스너 추가
            newRow.querySelector('.editBtn').addEventListener('click', function() {
                // 수정 버튼 클릭 시 로직 추가
            });

            newRow.querySelector('.delBtn').addEventListener('click', function() {
                newRow.remove();
            });
        });
            
            
            
    //모달 
    const modal = document.getElementById('addEditModal');
    const closeBtn = document.querySelector('.close');
    

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
