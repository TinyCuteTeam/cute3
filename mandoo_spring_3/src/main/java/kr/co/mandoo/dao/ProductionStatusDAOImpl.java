package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.ProductionstatusDTO;

@Repository
public class ProductionStatusDAOImpl implements ProductionStatusDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//	재고 목록 조회 
	@Override
	public List<ProductionstatusDTO> StatusList(){
		
		List<ProductionstatusDTO> list = sqlSession.selectList("mapper.dto.selectProductionstatus");
		System.out.println("DAO에서 list 출력 : " + list);
		
		return list;
		
	}

}
