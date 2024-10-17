package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mandoo.Service.ItemService;
import kr.co.mandoo.dto.ItemDTO;

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
	
	@RequestMapping(value="/itemDelete", method=RequestMethod.POST)
	public String deleteItem(Model model, ItemDTO itemDTO) {
		
		int result = itemService.deleteItem(itemDTO);
		System.out.println("item delete 실행");
		
		return "redirect:/item";
	}
	
	@RequestMapping(value="/itemInsert", method=RequestMethod.POST)
	public String insertItem(Model model, ItemDTO itemDTO) {
		
		int result = itemService.insertItem(itemDTO);
		System.out.println("item insert 실행");
		
		return "redirect:/item";
	}
	
	@RequestMapping(value="/itemUpdate", method=RequestMethod.POST)
	public String updateItem(Model model, ItemDTO itemDTO) {
		
		int result = itemService.updateItem(itemDTO);
		System.out.println("item update 실행");
		
		return "redirect:/item";
	}
	
}
