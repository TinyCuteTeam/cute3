package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.BOMDTO;

@Repository
public class BOMDAOImpl implements BOMDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<BOMDTO> selectBOM() {
		List list = sqlSession.selectList("mapper.dto.selectBOM");
		System.out.println(list);
		return list;
	}

	//select로 선택한 bom_Id와 동일한 db만 출력
	@Override
	public List<BOMDTO> selectBOMById(String bom_Id) {
		return sqlSession.selectList("mapper.dto.selectBOMById", bom_Id);
	}

	@Override
	public int deleteBOM(BOMDTO bomDTO) {
		int result = -1;
		result = sqlSession.delete("mapper.dto.deleteBOM", bomDTO);
				
		return result;
	}

	@Override
	public int insertBOM(BOMDTO bomDTO) {
		int result = -1;
		result = sqlSession.delete("mapper.dto.insertBOM", bomDTO);
				
		return result;
	}

	@Override
	public int updateBOM(BOMDTO bomDTO) {
		int result = -1;
		result = sqlSession.delete("mapper.dto.updateBOM", bomDTO);
				
		return result;
	}

	
	
	
}
