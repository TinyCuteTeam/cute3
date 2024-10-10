package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.ErrorDTO;

public interface ErrorDAO {

	
	List selectError(); // select 조회  
	 
	public int deleteError(ErrorDTO errorDTO); // delete 삭제
}
