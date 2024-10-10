package kr.co.mandoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.dto.ItemDTO;
import kr.co.mandoo.service.ItemService;

@Controller
public class ItemController {
	
	@Autowired
	ItemService itemService;
	
	@RequestMapping("/item")
	public String listItem(Model model) {
		
		List<ItemDTO> list = itemService.listItem();
		model.addAttribute("list",list);
		
		return "item";
	}
}
