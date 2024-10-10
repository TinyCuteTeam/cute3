package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderInfoDAOImpl implements OrderInfoDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List selectorderInfo() {
		List list = sqlSession.selectList("mapper.dto.selectOrderInfo");
		System.out.println(list);
		return list;
	}

//	public int selectorderCount() {
//        String sql = "SELECT COUNT(*) FROM order_info";
//       
//        return 0;
//    }
}
