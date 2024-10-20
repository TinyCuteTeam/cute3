package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.ErrorService;
import kr.co.mandoo.dto.ErrorDTO;

@Controller
public class ErrorController {

	@Autowired
	ErrorService errorService;

	@RequestMapping("/error")
	public String listError(Model model, 
                            @RequestParam(defaultValue = "1") int page,  // 현재 페이지 번호
                            @RequestParam(defaultValue = "5") int pageSize) {  // 페이지 당 항목 수

		List<ErrorDTO> list = errorService.listError();
		System.out.println("list: " + list);
		
		// 전체 항목 수 계산
		int totalItems = list.size();
		int totalPages = (totalItems + pageSize - 1) / pageSize; // 전체 페이지 수 계산

		// 페이지에 해당하는 데이터만 잘라서 전달
		int startIndex = (page - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalItems);
		List<ErrorDTO> paginatedList = list.subList(startIndex, endIndex);
		
		model.addAttribute("list", paginatedList);  // 현재 페이지에 맞는 리스트만 전달
		model.addAttribute("currentPage", page);  // 현재 페이지 번호 전달
		model.addAttribute("totalPages", totalPages);  // 전체 페이지 수 전달

		System.out.println("list.size: " + list.size());

		return "error";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteError(Model model, ErrorDTO errorDTO) {
		
		int result = errorService.deleteError(errorDTO);
		System.out.println("delete 실행 " + result);
		
		return "redirect:/error";
	}

	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insertError(Model model, ErrorDTO errorDTO) {
		
		System.out.println("insert 실행");
		
		int list = -1;
		list = errorService.insertError(errorDTO);
		
		model.addAttribute("list",list);
		
		System.out.println("insert result 실행: "+list);
		
		return "redirect:/error";
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updateError(Model model, ErrorDTO errorDTO) {
		
		System.out.println("update 실행");
		
		int list = -1;
		list = errorService.updateError(errorDTO);
		
		model.addAttribute("list",list);
		
		System.out.println("update result 실행: "+list);
		
		return "redirect:/error";
	}

	
}
