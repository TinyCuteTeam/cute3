package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.ProductionOrderDAOImpl;
import kr.co.mandoo.dto.ProductionOrderDTO;

@Service
public class ProductionOrderService {

    @Autowired
    private ProductionOrderDAOImpl productionOrderDAO;

    // 월별 생산량 데이터를 가져오는 메서드
    public List<ProductionOrderDTO> getMonthlyProductionData() throws Exception {
        return productionOrderDAO.getMonthlyProductionData();
    }
}
