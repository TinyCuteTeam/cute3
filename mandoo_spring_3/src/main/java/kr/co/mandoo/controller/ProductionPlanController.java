package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.ProductionPlanService;
import kr.co.mandoo.dto.ProductionPlanDTO;

@Controller
public class ProductionPlanController {

	@Autowired
	ProductionPlanService ProductionPlanService;

	@RequestMapping("/ProductionPlan")
	public String listProductionPlan(Model model) {
		List<ProductionPlanDTO> list = ProductionPlanService.listProductionPlan(); // 1번
		System.out.println("list 출력" + list);

		model.addAttribute("list", list);

		return "ProductionPlan";
	}

	@RequestMapping(value = "/insertProductionPlan", method = RequestMethod.POST)
	public String insertProductionPlan(Model model, ProductionPlanDTO dto) {

		System.out.println("Controller 실행");
		System.out.println(dto);
		int result = -1;
		result = ProductionPlanService.insertProductionPlan(dto);

		model.addAttribute("result", result);

		System.out.println("insert 실행 : " + result);

		return "redirect:/ProductionPlan";
	}

	@RequestMapping(value = "/deleteProductionPlan", method = RequestMethod.POST)
	public String delete(@RequestParam("plan_id") String plan_id) {

		System.out.println(plan_id);
		ProductionPlanDTO productionPlanDTO = new ProductionPlanDTO();
		productionPlanDTO.setPlan_id(plan_id);

		int result = ProductionPlanService.deleteProductionPlan(productionPlanDTO);

		System.out.println("delete 실행 : " + result);

		return "redirect:/ProductionPlan";
	}

}
