package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.StockDTO;


@Repository
public class StockDAOImpl implements StockDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	//	재고 목록 조회 
	@Override
	public List getStockList(){
		
		List list = sqlSession.selectList("mapper.dto.selectStock");
		
		return list;
		
	}
	
	// 재고 검색
	@Override
	public StockDTO getStockOneList(String stock){
		
		StockDTO list = sqlSession.selectOne("mapper.dto.selectStockById" , stock);
		System.out.println("DAO : " + list);
		
		return list;
		
	}
	
	
	// 전체 재고 수 조회
	@Override
	public int getTotalStockCount() {
		int totalCount = 0;
		// selectAll 해서 카운트를 세서 반환 하는 코드 작성해야할듯 
		// list 에 담아서 카운트 하게끔 ? 재고
		
		return totalCount;
	}
	
	// 재고 추가
	@Override
	public int insertStock(StockDTO stockDTO) {
		int result = -1;
		result = sqlSession.insert("mapper.emp.insertStock" , stockDTO);
		
		return 1;
	}
	
	// 제고 삭제
	@Override
	public int deleteStock(StockDTO stockDTO) {
		int result = -1;
		result = sqlSession.delete("mapper.emp.deleteStock" , stockDTO);
		
		return result;
	}
	
	// 재고 수정
	@Override
	public int updateStock(StockDTO stockDTO) {
		int result = -1;
		result = sqlSession.update("mapper.emp.updateStock" , stockDTO);
		
		return result;
	}
	

}
