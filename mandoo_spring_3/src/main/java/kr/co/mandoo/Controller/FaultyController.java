package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.Service.FaultyService;

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

}
