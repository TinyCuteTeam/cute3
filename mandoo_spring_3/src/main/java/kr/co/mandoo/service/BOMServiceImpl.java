package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.BOMDAO;
import kr.co.mandoo.dto.BOMDTO;

@Service
public class BOMServiceImpl implements BOMService {

	@Autowired
	BOMDAO bomDAO;
	
	@Override
	public List listBOM() {
		List<BOMDTO> list = bomDAO.selectBOM();
		
		return list;
	}

	@Override
	public List<BOMDTO> getBOMById(String bom_Id) {
		return bomDAO.selectBOMById(bom_Id);
	}

	@Override
	public int deleteBOM(BOMDTO bomDTO) {
		int result = -1;
		result = bomDAO.deleteBOM(bomDTO);
		return result;
	}

	@Override
	public int insertBOM(BOMDTO bomDTO) {
		int result = -1;
		result = bomDAO.insertBOM(bomDTO);
		return result;
	}

	@Override
	public int updateBOM(BOMDTO bomDTO) {
		int result = -1;
		result = bomDAO.updateBOM(bomDTO);
		return result;
	}
}
