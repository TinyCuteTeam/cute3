package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.ProductionPlanDTO;

public interface ProductionPlanService {

	List listProductionPlan();

	int insertProductionPlan(ProductionPlanDTO dto);

	int deleteProductionPlan(ProductionPlanDTO dto);

}
