package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.StockDAO;
import kr.co.mandoo.dto.StockDTO;

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
	
	@Override
	public StockDTO stockListOne(String stock){
		
		StockDTO list = stockDAO.getStockOneList(stock);
		System.out.println("Service : " + list);
		return list;
	}
	
	@Override
	public int deleteStock(StockDTO stockDTO) {
		int result = -1;
		result = stockDAO.deleteStock(stockDTO);
		
		return result;
	}
	
	@Override
	public int insertStock(StockDTO stockDTO) {
		int result = -1;
		result = stockDAO.insertStock(stockDTO);
		
		return result;
	}
	
	@Override
	public int updateStock(StockDTO stockDTO) {
		int result = -1;
		result = stockDAO.updateStock(stockDTO);
		
		return result;
	}
	
	
}
