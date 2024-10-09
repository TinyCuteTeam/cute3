package kr.co.mandoo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.MyPageDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public MyPageDTO myPageRead() {

		MyPageDTO list = sqlSession.selectOne("mapper.dto.selectMyPage");
		System.out.println("dao list : " + list);
		return list;

	}
}
