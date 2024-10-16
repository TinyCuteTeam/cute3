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

	@Override
	public List<BOMDTO> selectBOMById(String bom_Id) {
		return sqlSession.selectList("mapper.dto.selectBOMById", bom_Id);
	}
	
	
}
