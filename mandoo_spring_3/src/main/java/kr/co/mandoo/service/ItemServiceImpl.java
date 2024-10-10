package kr.co.mandoo.service;

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

}
