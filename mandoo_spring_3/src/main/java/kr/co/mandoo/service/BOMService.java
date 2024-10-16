package kr.co.mandoo.service;

import java.util.List;

import kr.co.mandoo.dto.BOMDTO;

public interface BOMService {

	List listBOM();
	List<BOMDTO> getBOMById(String bom_Id); 
}
