package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.ErrorDTO;

public interface ErrorDAO {

	
	List selectError(); // select 조회  
	 
	public int deleteError(ErrorDTO errorDTO); // delete 삭제
	
	public int insertError(ErrorDTO errorDTO); // insert 추가
	
	int updateError(ErrorDTO errorDTO); // update 수정
}
