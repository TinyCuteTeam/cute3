package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.StockDTO;

public interface StockService {
	
	public List stockList();
	public StockDTO stockListOne(String stock);
	public int deleteStock(StockDTO stockDTO);
	public int insertStock(StockDTO stockDTO);
	public int updateStock(StockDTO stockDTO);
	
	

}
