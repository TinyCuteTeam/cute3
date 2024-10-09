package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.StockService;
import kr.co.mandoo.dto.StockDTO;

@Controller
public class StockController {
	
	@Autowired
	StockService stockService;

	@RequestMapping("/Stock")
	public String stock(Model model) {
		
		List list = stockService.stockList();
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "Stock";
		
	}
	
	@RequestMapping("/StockSelect")
	public String selectOne( Model model , @RequestParam("search") String stock) {
		
		System.out.println("Searching for stock: " + stock);
		StockDTO list = stockService.stockListOne(stock);
		System.out.println("Search result: " + list);
		model.addAttribute("list", list);
		
		return "Stock";
		
	}
	
}
