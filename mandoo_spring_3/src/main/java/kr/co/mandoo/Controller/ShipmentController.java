package kr.co.mandoo.Controller;
package mandoo.controller;

import mandoo.dto.ShipmentDTO;
import mandoo.service.ShipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ShipmentController {

    @Autowired
    private ShipmentService shipmentService;

    @GetMapping("/shipment")
    public String getShipments(@RequestParam(defaultValue = "1") int page, Model model) {
        try {
            List<ShipmentDTO> shipments = shipmentService.getShipmentsByPage(page, 4);
            int totalShipments = shipmentService.getTotalShipmentCount();
            int totalPages = (int) Math.ceil(totalShipments / 4.0);

            model.addAttribute("shipments", shipments);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리 로깅
            return "error"; // 에러 페이지로 리턴
        }
        return "출하확인"; // JSP 파일 이름
    }

    @PostMapping("/shipment")
    public String deleteShipments(@RequestParam(value = "shipmentIds") String[] shipmentIds) {
        try {
            if (shipmentIds != null) {
                shipmentService.deleteShipments(shipmentIds);
            }
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리 로깅
            return "error"; // 에러 페이지로 리턴
        }
        return "redirect:/shipment"; // 삭제 후 다시 목록으로 리다이렉트
    }
}
