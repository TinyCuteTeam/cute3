package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mandoo.Service.WorkService;
import kr.co.mandoo.dto.ProductionPlanDTO;
import kr.co.mandoo.dto.WorkDTO;

@Controller
public class WorkController {

	@Autowired
	WorkService workService;

	@RequestMapping("/Work")
	public String listWork(Model model) {
		List<WorkDTO> list = workService.listWork();
		System.out.println("list 출력" + list);

		model.addAttribute("list", list);

		return "Work";
	}
	
	@RequestMapping(value = "/insertWork", method = RequestMethod.POST)
	public String insertProductionPlan(Model model, WorkDTO dto) {

		System.out.println("Controller 실행");
		System.out.println(dto);
		int result = -1;
		result = workService.insertWork(dto);

		model.addAttribute("result", result);

		System.out.println("insert 실행 : " + result);

		return "redirect:/Work";
	}
	
	
}
