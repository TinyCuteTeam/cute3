package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.Service.OrderInfoService;
import kr.co.mandoo.dto.OrderInfoDTO;

@Controller
public class OrderInfoController {

    @Autowired
    OrderInfoService orderInfoService;

    @RequestMapping("/OrderInfo")
    public String listOrderInfo(Model model, 
                                 @RequestParam(value = "page", defaultValue = "1") int currentPage) {
        List<OrderInfoDTO> list = orderInfoService.listOrderInfo(); // 전체 주문 목록 조회

        // 페이징 처리 로직
        int pageSize = 5; // 페이지당 주문 수
        int totalItems = list.size(); // 전체 주문 수
        int totalPages = (totalItems + pageSize - 1) / pageSize; // 전체 페이지 수

        // 현재 페이지에 해당하는 주문만 가져오기
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);
        List<OrderInfoDTO> paginatedList = list.subList(startIndex, endIndex);

        model.addAttribute("list", paginatedList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);

        return "orderInfo"; // JSP 페이지로 이동
    }
}
