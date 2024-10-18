package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.StockDAO;
import kr.co.mandoo.dto.StockDTO;
import kr.co.mandoo.dto.StockOrderDTO;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	StockDAO stockDAO;
	StockDTO stockDTO;
	
	@Override
	public List stockList(){
		
		List list = stockDAO.getStockList();
		
		return list;
	}
	
	// sub 
	@Override
	public List stocksubList(){
		
		List list = stockDAO.getsubStockList();
		
		return list;
	}
	
	// og 
	@Override
	public List stockogList(){
		
		List list = stockDAO.getogStockList();
		
		return list;
	}
	
	@Override
	public List stockListOne(String stock){
		
		List list = stockDAO.getStockOneList(stock);
		System.out.println("Service : " + list);
		return list;
	}
	
	// sub 검색
	@Override
	public List substockListOne(String stock){
		
		List list = stockDAO.getsubStockOneList(stock);
		System.out.println("Service : " + list);
		return list;
	}
	
	// og 검색
	@Override
	public List ogstockListOne(String stock){
		
		List list = stockDAO.getogStockOneList(stock);
		System.out.println("Service : " + list);
		return list;
	}
	
	@Override
	public int updateCountStock(StockDTO stockDTO) {
		int result = -1;
		result = stockDAO.updateCountStock(stockDTO);
		
		return result;
	}
	
	@Override
	public int deleteStock(StockDTO stockDTO) {
		int result = -1;
		result = stockDAO.deleteStock(stockDTO);
		
		return result;
	}
	
	
	
	@Override
	public int updateStock(StockDTO stockDTO) {
		int result = -1;
		result = stockDAO.updateStock(stockDTO);
		
		return result;
	}
	
	@Override
	public int insertStockOrder(StockOrderDTO dto) {
		int result = -1;
		result = stockDAO.stockorderInsert(dto);
		
		return result;
	}
	
//	// stockorder change
//	@Override
//	public int stockOrderListOne(StockOrderDTO dto) {
//		
//		int list = stockDAO.stockOrderListOne(dto);
//		System.out.println("Service : " + list);
//		return list;
//	}
	
	// selectStockSort input 정렬 눌러서 조회하는 메소드
	@Override
	public List selectSortService(String stock){
		
		List list = stockDAO.sortSelectList(stock);
		System.out.println("Service : " + list);
		return list;
	}
	
	@Override
	public List stockSortService(String stock_name) {
		
		List list = stockDAO.stockSort(stock_name);
		System.out.println("stockSort로 보낼 service " + list);
		
		return list;
	}
	
	
}
