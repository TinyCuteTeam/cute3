package kr.co.mandoo.Controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.ShipmentService;
import kr.co.mandoo.dto.ShipmentDTO;

@Controller
public class ShipmentController {

    @Autowired
    private ShipmentService shipmentService;

    @GetMapping("/shipment")
    public String getShipments(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "5") int size, 
            Model model) throws Exception {
        // 전체 출하 목록을 가져옵니다.
        List<ShipmentDTO> shipments = shipmentService.getAllShipments();
        
        // 총 페이지 수 계산
        int totalShipments = shipments.size();
        int totalPages = (int) Math.ceil((double) totalShipments / size);
        
        // 요청된 페이지에 맞는 데이터 추출
        int start = (page - 1) * size;
        int end = Math.min(start + size, totalShipments);
        List<ShipmentDTO> pagedShipments = shipments.subList(start, end);
        
        model.addAttribute("pagedShipments", pagedShipments);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        
        return "shipment"; // JSP 파일 이름 (shipment.jsp)
    }

    @PostMapping("/shipment")
    public String deleteShipments(@RequestParam(value = "shipmentIds", required = false) String[] shipmentIds) {
        if (shipmentIds != null) {
            try {
                shipmentService.deleteShipments(shipmentIds);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/shipment"; // 삭제 후 목록으로 리다이렉트
    }
}
