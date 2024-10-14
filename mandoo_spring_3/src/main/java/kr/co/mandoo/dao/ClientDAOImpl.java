package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.ClientDTO;

@Repository
public class ClientDAOImpl implements ClientDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List selectClient() {
		List list = sqlSession.selectList("mapper.dto.selectClient");
		System.out.println(list);
		return list;
	}

	//거래처 추가
	@Override
	public int insertClient(ClientDTO clientDTO) {
		int result = -1;
		
		result = sqlSession.insert("mapper.dto.insertClient", clientDTO); 
		
		return result;
	}

}
