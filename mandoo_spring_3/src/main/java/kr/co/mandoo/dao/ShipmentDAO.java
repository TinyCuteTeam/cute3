package kr.co.mandoo.dao;

import kr.co.mandoo.dto.ProductionOrderDTO;

import java.util.List;

public interface ProductionOrderDAO {
    List<ProductionOrderDTO> getShipments(int page, int pageSize);
    int getTotalShipmentCount();
    void deleteShipments(String[] shipmentIds);
}
