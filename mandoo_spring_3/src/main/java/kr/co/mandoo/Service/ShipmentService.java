package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.ShipmentDAO;
import kr.co.mandoo.dto.ShipmentDTO;

@Service
public class ShipmentService {
    
    @Autowired
    private ShipmentDAO shipmentDAO;

    // 전체 출하 목록 조회
    public List<ShipmentDTO> getAllShipments() throws Exception {
        return shipmentDAO.getAllShipments();
    }

    // 여러 출하 정보 삭제
    public void deleteShipments(String[] shipmentIds) throws Exception {
        shipmentDAO.deleteShipments(shipmentIds);
    }
}
