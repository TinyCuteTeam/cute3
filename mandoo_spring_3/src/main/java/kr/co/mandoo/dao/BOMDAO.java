package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.BOMDTO;

public interface BOMDAO {
	
	//조회
		List<BOMDTO> selectBOM();
		List<BOMDTO> selectBOMById(String bom_Id);
		
		// BOM ID를 그룹화하여 가져오기
	    List<String> selectGroupbyBOMId();
		
		public int deleteBOM(BOMDTO bomDTO);
		public int insertBOM(BOMDTO bomDTO);
		public int updateBOM(BOMDTO bomDTO);
}
