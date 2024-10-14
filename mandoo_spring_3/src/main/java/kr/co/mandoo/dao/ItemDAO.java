package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.ItemDTO;

public interface ItemDAO {

	List selectItem();
	
	public int deleteItem(ItemDTO itemDTO);
	public int insertItem(ItemDTO itemDTO);
	public int updateItem(ItemDTO itemDTO);
}
