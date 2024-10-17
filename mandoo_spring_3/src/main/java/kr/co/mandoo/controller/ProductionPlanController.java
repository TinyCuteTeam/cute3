package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.Service.ProductionPlanService;
import kr.co.mandoo.dto.ProductionPlanDTO;

@Controller
public class ProductionPlanController {

    @Autowired
    ProductionPlanService productionPlanService;

    @RequestMapping("/ProductionPlan")
    public String listProductionPlan(Model model, 
                                      @RequestParam(value = "page", defaultValue = "1") int currentPage) {
        List<ProductionPlanDTO> list = productionPlanService.listProductionPlan(); // 전체 생산 계획 목록 조회

        // 페이징 처리 로직
        int pageSize = 4; // 페이지당 생산 계획 수
        int totalItems = list.size(); // 전체 생산 계획 수
        int totalPages = (totalItems + pageSize - 1) / pageSize; // 전체 페이지 수

        // 현재 페이지에 해당하는 생산 계획만 가져오기
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);
        List<ProductionPlanDTO> paginatedList = list.subList(startIndex, endIndex);

        // 모델에 데이터 추가
        model.addAttribute("list", paginatedList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);

        return "ProductionPlan"; // JSP 페이지로 이동
    }

    @RequestMapping(value = "/insertProductionPlan", method = RequestMethod.POST)
    public String insertProductionPlan(Model model, ProductionPlanDTO dto) {
        System.out.println("Controller 실행");
        System.out.println(dto);
        int result = -1;
        result = productionPlanService.insertProductionPlan(dto);

        model.addAttribute("result", result);
        System.out.println("insert 실행 : " + result);

        return "redirect:/ProductionPlan"; // 리다이렉트
    }

    @RequestMapping(value = "/deleteProductionPlan", method = RequestMethod.POST)
    public String delete(@RequestParam("plan_id") String plan_id) {
        System.out.println(plan_id);
        ProductionPlanDTO productionPlanDTO = new ProductionPlanDTO();
        productionPlanDTO.setPlan_id(plan_id);

        int result = productionPlanService.deleteProductionPlan(productionPlanDTO);
        System.out.println("delete 실행 : " + result);

        return "redirect:/ProductionPlan"; // 리다이렉트
    }
}
