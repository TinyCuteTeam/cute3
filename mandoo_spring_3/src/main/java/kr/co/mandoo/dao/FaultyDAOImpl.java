package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.FaultyDTO;

@Repository
public class FaultyDAOImpl implements FaultyDAO {
	
	@Autowired
	SqlSession sqlSession;

	
	@Override
	public List<FaultyDTO> faultyselect(){
		
		List<FaultyDTO> list = sqlSession.selectList("mapper.dto.selectFaulty");
		System.out.println("DAO에서 list 출력 : " + list);
		
		
		return list;
		
	}


}
