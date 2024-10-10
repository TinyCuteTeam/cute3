package kr.co.mandoo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.StockDTO;

@Repository
public interface StockDAO {
	
	public List<StockDTO> getStockList();
	public List getStockOneList(String stock);
	public int getTotalStockCount();
	public int updateCountStock(StockDTO stockDTO);
	public int deleteStock(StockDTO stockDTO);
	public int updateStock(StockDTO stockDTO);
	
	

}
