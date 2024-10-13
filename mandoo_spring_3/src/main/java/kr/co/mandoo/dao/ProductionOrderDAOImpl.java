package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.ProductionOrderDTO;

@Repository
public class ProductionOrderDAOImpl {

    @Autowired
    private SqlSession sqlSession;

    public List<ProductionOrderDTO> getMonthlyProductionData() {
        return sqlSession.selectList("ProductionOrderMapper.getMonthlyProductionData");
    }
}
