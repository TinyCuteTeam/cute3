package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.StockDTO;

public interface StockService {
	
	public List stockList();
	public List stockListOne(String stock);
	public int updateCountStock(StockDTO stockDTO);
	public int deleteStock(StockDTO stockDTO);
	public int updateStock(StockDTO stockDTO);
	
	

}
