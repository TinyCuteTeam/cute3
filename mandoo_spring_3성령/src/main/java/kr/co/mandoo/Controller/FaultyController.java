package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.FaultyService;
import kr.co.mandoo.dto.FaultyDTO;

@Controller
public class FaultyController {
	
	@Autowired
	FaultyService faultyService;
	
	@RequestMapping("/FaultyRead")
	public String faultySelectController(Model model) {
		
		List list = faultyService.faultySelectService();
		System.out.println( " Controller에서 list 뽑아오기 : " + list);
		model.addAttribute("list", list);
		
		return "Faulty";
		
	}
	
	@RequestMapping("/error/chart")
	public String chartError(Model model,
	                         @RequestParam(value = "page", defaultValue = "1") int page) {

	    int pageSize = 5;  // 한 페이지에 표시할 항목 수
	    List<FaultyDTO> allFaultyList = faultyService.faultySelectServiceChart();  // 모든 데이터를 가져옴

	    // 총 항목 수와 페이지 수 계산
	    int totalItems = allFaultyList.size();
	    int totalPages = (totalItems + pageSize - 1) / pageSize;  // 전체 페이지 수

	    // 현재 페이지에 해당하는 항목만 가져옴
	    int startIndex = (page - 1) * pageSize;
	    int endIndex = Math.min(startIndex + pageSize, totalItems);
	    List<FaultyDTO> list = allFaultyList.subList(startIndex, endIndex);  // 현재 페이지에 해당하는 데이터만 추출

	    model.addAttribute("list", list);  // 현재 페이지에 맞는 리스트 전달
	    model.addAttribute("currentPage", page);  // 현재 페이지 정보
	    model.addAttribute("totalPages", totalPages);  // 총 페이지 수

	    return "chart";
	}


}
