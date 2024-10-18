package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.StockDTO;
import kr.co.mandoo.dto.StockOrderDTO;

public interface StockService {
	
	public List stockList();
	public List stockListOne(String stock);
	public int updateCountStock(StockDTO stockDTO);
	public int deleteStock(StockDTO stockDTO);
	public int updateStock(StockDTO stockDTO);
	
	// sub
	public List stocksubList();
	public List substockListOne(String stock);
	
	// og
	public List stockogList();
	public List ogstockListOne(String stock);
	
	// stockorder
	public int insertStockOrder(StockOrderDTO dto);


}
