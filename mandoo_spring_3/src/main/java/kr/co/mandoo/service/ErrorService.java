package kr.co.mandoo.service;

import java.util.List;

import kr.co.mandoo.dto.ErrorDTO;

public interface ErrorService {

	List listError(); // select
	
	public int deleteError(ErrorDTO errorDTO);
}
