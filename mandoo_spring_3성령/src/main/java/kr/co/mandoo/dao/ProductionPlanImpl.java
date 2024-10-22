package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.ProductionPlanDTO;

@Repository
public class ProductionPlanImpl implements ProductionPlanDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List selectProductionPlan() {
		List list = sqlSession.selectList("mapper.dto.selectProductionPlan");
		System.out.println(list);
		return list;
	}

	@Override
	public int insertProductionPlan(ProductionPlanDTO dto) {
		int result = -1;
		result = sqlSession.insert("mapper.dto.insertProductionPlan", dto);
		return result;
	}

	@Override
	public int deleteProductionPlan(ProductionPlanDTO dto) {
		int result = -1;

		try {
			result = sqlSession.delete("mapper.dto.deleteProductionPlan", dto);
		} catch (Exception e) {
			sqlSession.rollback();
		}

		return result;
	}

}
