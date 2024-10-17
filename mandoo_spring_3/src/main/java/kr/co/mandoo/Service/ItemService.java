package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.ItemDTO;

public interface ItemService {

	List listItem();
	public int deleteItem(ItemDTO itemDTO);
	public int insertItem(ItemDTO itemDTO);
	public int updateItem(ItemDTO itemDTO);
}
