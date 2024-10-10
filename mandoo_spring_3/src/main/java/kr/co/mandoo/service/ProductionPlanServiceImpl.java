package kr.co.mandoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.ProductionPlanDAO;
import kr.co.mandoo.dto.ProductionPlanDTO;

@Service
public class ProductionPlanServiceImpl implements ProductionPlanService {

	@Autowired
	ProductionPlanDAO productionPlanDAO;

	@Override
	public List listProductionPlan() {

		List<ProductionPlanDTO> list = productionPlanDAO.selectProductionPlan();

		return list;
	}

	@Override
	public int insertProductionPlan(ProductionPlanDTO dto) {
		int result = -1;
		result = productionPlanDAO.insertProductionPlan(dto);
		return result;
	}

	@Override
	public int deleteProductionPlan(ProductionPlanDTO dto) {
		return productionPlanDAO.deleteProductionPlan(dto);
	}
}
