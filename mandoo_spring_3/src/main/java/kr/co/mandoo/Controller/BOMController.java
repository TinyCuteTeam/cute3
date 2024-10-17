package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.BOMService;
import kr.co.mandoo.dto.BOMDTO;

@Controller
public class BOMController {

	@Autowired
	BOMService bomService;
	
	@RequestMapping("/bom")
	public String listBOM(Model model, @RequestParam(required = false) String bom_Id) {
		List<BOMDTO> bomList;
	
		// bom_Id가 선택된 경우 해당 BOM 목록을 가져옴
	    if (bom_Id != null) {
	        bomList = bomService.getBOMById(bom_Id); // 이 메서드는 DB에서 특정 bom_Id에 대한 리스트를 반환해야 함
	    } else {
	        bomList = bomService.listBOM(); // 모든 BOM 목록 가져오기
	    }

	    model.addAttribute("list", bomList);
	    return "BOM";
	}
	
//	@RequestMapping("/bom")
//	public String listBOM(Model model) {
//		
//		List<BOMDTO> bomList = bomService.listBOM();
//		
//		System.out.println("BOM list: "+bomList);
//		model.addAttribute("list",bomList);
//		
//		System.out.println("BOM list.size: "+bomList.size());
//		
//		return "BOM";
//	}
}
