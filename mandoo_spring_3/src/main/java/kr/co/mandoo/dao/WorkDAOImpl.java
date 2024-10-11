package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.WorkDTO;

@Repository
public class WorkDAOImpl implements WorkDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List selectWork() {
		List list = sqlSession.selectList("mapper.dto.selectWork");
		System.out.println(list);
		return list;
	}

	@Override
	public int insertWork(WorkDTO dto) {
		int result = -1;
		result = sqlSession.insert("mapper.dto.insertWork", dto);
		return result;
	}
	
}
