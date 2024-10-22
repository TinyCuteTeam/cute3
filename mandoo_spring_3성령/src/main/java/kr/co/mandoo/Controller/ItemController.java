package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.ItemService;
import kr.co.mandoo.dto.ItemDTO;

@Controller
public class ItemController {
	
	@Autowired
	ItemService itemService;
	
    @RequestMapping("/item")
    public String listItem(Model model, 
                           @RequestParam(defaultValue = "1") int page, 
                           @RequestParam(defaultValue = "8") int itemsPerPage) {
        // 전체 리스트를 가져옴 (페이징 적용 X)
        List<ItemDTO> allItems = itemService.listItem();

        // 전체 아이템 수 계산
        int totalItems = allItems.size();

        // 총 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

        // 페이지 범위에 맞는 데이터를 잘라서 가져옴
        int start = (page - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, totalItems); // 끝 범위는 리스트 크기 이상을 넘지 않도록 설정
        List<ItemDTO> pagedItems = allItems.subList(start, end); // 서브리스트로 페이징

        // 모델에 필요한 데이터 추가
        model.addAttribute("list", pagedItems);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

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
