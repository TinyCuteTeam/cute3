package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.ShipmentDTO;

@Repository
public class ShipmentDAO {

    @Autowired
    private SqlSession sqlSession;

    // 전체 출하 정보 목록 조회
    public List<ShipmentDTO> getAllShipments() throws Exception {
        return sqlSession.selectList("ShipmentMapper.getAllShipments");
    }

    // 여러 출하 정보 삭제
    public void deleteShipments(String[] shipmentIds) throws Exception {
        for (String shipmentId : shipmentIds) {
            sqlSession.delete("ShipmentMapper.deleteShipment", shipmentId);
        }
    }
}
