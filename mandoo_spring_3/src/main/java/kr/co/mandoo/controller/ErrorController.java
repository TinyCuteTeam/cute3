package kr.co.mandoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.dto.ErrorDTO;
import kr.co.mandoo.service.ErrorService;

@Controller
public class ErrorController {

	@Autowired
	ErrorService errorService;
	
	@RequestMapping("/error")
	public String listError(Model model) {
		
		
		List<ErrorDTO> list = errorService.listError();
		System.out.println("list: "+ list);
		model.addAttribute("list",list);
		
		System.out.println("list.size: "+ list.size());
		
		return "error";
	}
	
}
