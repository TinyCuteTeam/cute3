package kr.co.mandoo.dao;

import kr.co.mandoo.dto.ShipmentDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ShipmentDAOImpl implements ShipmentDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<ShipmentDTO> getShipments(int page, int pageSize) {
        int startRow = (page - 1) * pageSize;
        return sqlSession.selectList("ShipmentMapper.getShipments", startRow);
    }

    @Override
    public int getTotalShipmentCount() {
        return sqlSession.selectOne("ShipmentMapper.getTotalShipmentCount");
    }

    @Override
    public void deleteShipment(String shipmentId) {
        sqlSession.delete("ShipmentMapper.deleteShipment", shipmentId);
    }

    @Override
    public void deleteShipments(String[] shipmentIds) {
        for (String shipmentId : shipmentIds) {
            sqlSession.delete("ShipmentMapper.deleteShipment", shipmentId);
        }
    }
}
