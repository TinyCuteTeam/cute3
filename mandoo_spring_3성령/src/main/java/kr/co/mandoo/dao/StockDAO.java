package kr.co.mandoo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.StockDTO;
import kr.co.mandoo.dto.StockOrderDTO;

@Repository
public interface StockDAO {
	
	public List<StockDTO> getStockList();
	public List getStockOneList(String stock);
	public int getTotalStockCount();
	public int updateCountStock(StockDTO stockDTO);
	public int deleteStock(StockDTO stockDTO);
	public int updateStock(StockDTO stockDTO);
	
	// sub
	public List getsubStockList();
	public List getsubStockOneList(String stock);
	
	// og
	public List getogStockList();
	public List getogStockOneList(String stock);
	
	// stockorder
	public int stockorderInsert(StockOrderDTO dto);
//	public int stockOrderListOne(StockOrderDTO dto);
	public List sortSelectList(String stock);
	public List<StockOrderDTO> stockSort(String stock_name);

	

}
