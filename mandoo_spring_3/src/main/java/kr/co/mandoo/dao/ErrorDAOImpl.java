package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.ErrorDTO;

@Repository
public class ErrorDAOImpl implements ErrorDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List selectError() {
		List list = sqlSession.selectList("mapper.dto.selectError"); 
//		↑ select * from error 이 SQL문을 가져오는 코드 
		System.out.println(list);
		return list;
	}
	

}
