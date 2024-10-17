package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.ItemDTO;

@Repository
public class ItemDAOImpl implements ItemDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List selectItem() {
		List list = sqlSession.selectList("mapper.dto.selectItem");
		return list;
	}

	@Override
	public int deleteItem(ItemDTO itemDTO) {
		int result = -1;
		result = sqlSession.delete("mapper.dto.deleteItem", itemDTO);
				
		return result;
	}

	@Override
	public int insertItem(ItemDTO itemDTO) {
		int result = -1;
		
		result = sqlSession.delete("mapper.dto.insertItem", itemDTO);
				
		return result;
	}

	@Override
	public int updateItem(ItemDTO itemDTO) {
		int result = -1; 
		result = sqlSession.update("mapper.dto.updateItem", itemDTO);
		return result;
	}
}
