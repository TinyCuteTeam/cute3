package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.ItemDAO;
import kr.co.mandoo.dto.ItemDTO;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemDAO itemDAO;
	
	@Override
	public List listItem() {
		List<ItemDTO> list = itemDAO.selectItem();
		return list;
	}

	@Override
	public int deleteItem(ItemDTO itemDTO) {
		int result = -1;
		result = itemDAO.deleteItem(itemDTO);
		return result;
	}

	@Override
	public int insertItem(ItemDTO itemDTO) {
		int result = -1;
		result = itemDAO.insertItem(itemDTO);
		return result;
	}

	@Override
	public int updateItem(ItemDTO itemDTO) {
		int result = -1;
		result = itemDAO.updateItem(itemDTO);
		return result;
	}

}
