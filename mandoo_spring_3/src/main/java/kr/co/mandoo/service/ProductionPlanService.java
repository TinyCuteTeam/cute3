package kr.co.mandoo.service;

import java.util.List;

import kr.co.mandoo.dto.ProductionPlanDTO;

public interface ProductionPlanService {

	List listProductionPlan();

	int insertProductionPlan(ProductionPlanDTO dto);

}
