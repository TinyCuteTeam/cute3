package kr.co.mandoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.dto.BOMDTO;
import kr.co.mandoo.service.BOMService;

@Controller
public class BOMController {

	@Autowired
	BOMService bomService;
	
	@RequestMapping("/bom")
	public String listBOM(Model model) {
		
		List<BOMDTO> bomList = bomService.listBOM();
	
		System.out.println("BOM list: "+bomList);
		model.addAttribute("list",bomList);
		
		System.out.println("BOM list.size: "+bomList.size());
		
		return "BOM";
	}
}
