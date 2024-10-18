package kr.co.mandoo.dao;

import java.util.List;
import kr.co.mandoo.dto.ProductionOrderDTO;

public interface ProductionOrderDAO {
    List<ProductionOrderDTO> getMonthlyProductionData();
}
