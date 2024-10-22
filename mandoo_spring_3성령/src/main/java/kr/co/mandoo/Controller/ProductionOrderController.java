package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.mandoo.Service.ProductionOrderService;
import kr.co.mandoo.dto.ProductionOrderDTO;

@Controller
public class ProductionOrderController {

    @Autowired
    private ProductionOrderService productionOrderService;

    @GetMapping("/productionOrder/monthly")
    public String getMonthlyProduction(Model model) throws Exception {
            List<ProductionOrderDTO> monthlyProductionData = productionOrderService.getMonthlyProductionData();
            model.addAttribute("monthlyProductionData", monthlyProductionData);
            return "monthlyProduction"; // JSP 페이지 이름 (실적마감.jsp)
        
    }
}
