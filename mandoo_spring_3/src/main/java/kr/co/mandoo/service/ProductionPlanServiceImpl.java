package kr.co.mandoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.ProductionPlanDAO;
import kr.co.mandoo.dto.ProductionPlanDTO;

@Service
public class ProductionPlanServiceImpl implements ProductionPlanService {

	@Autowired
	ProductionPlanDAO ProductionPlanDAO;

	@Override
	public List listProductionPlan() {

		List<ProductionPlanDTO> list = ProductionPlanDAO.selectProductionPlan();

		return list;
	}

	@Override
	public int insertProductionPlan(ProductionPlanDTO dto) {
		int result = -1;
		result = ProductionPlanDAO.insertProductionPlan(dto);
		return result;
	}

}
