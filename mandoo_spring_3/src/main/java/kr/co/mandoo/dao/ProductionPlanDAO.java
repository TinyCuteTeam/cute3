package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.ProductionPlanDTO;

public interface ProductionPlanDAO {

	List selectProductionPlan();

	int insertProductionPlan(ProductionPlanDTO dto);
}
