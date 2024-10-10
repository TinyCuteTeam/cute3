package kr.co.mandoo.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


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
		List list = stockService.stockListOne(stock);
		System.out.println("Search result: " + list);
		model.addAttribute("list", list);
		model.addAttribute("searchKeyword", stock); // 추가
		
		return "Stock";
		
	}
	
	 @RequestMapping(value = "/updateOne", method = RequestMethod.POST)
	    public String updateOne(HttpServletRequest request, @ModelAttribute StockDTO stockDTO, Model model) {
	        int result = stockService.updateCountStock(stockDTO);
	        try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
	        
	        if (result > 0) {
	            model.addAttribute("message", "재고가 성공적으로 수정되었습니다.");
	        } else {
	            model.addAttribute("message", "재고 수정 실패.");
	        }

	        return "redirect:/Stock"; // 수정 후 재고 목록 페이지로 리다이렉트
	    }
	 
	 @RequestMapping(value = "/updateAll", method = RequestMethod.POST)
	    public String updateAll(HttpServletRequest request, @ModelAttribute StockDTO stockDTO, Model model) {
	        int result = stockService.updateStock(stockDTO);
	        try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
	        
	        if (result > 0) {
	            model.addAttribute("message", "재고가 성공적으로 수정되었습니다.");
	        } else {
	            model.addAttribute("message", "재고 수정 실패.");
	        }

	        return "redirect:/Stock"; // 수정 후 재고 목록 페이지로 리다이렉트
	    }
	 
	 
	 
//	 @RequestMapping(value = "/updateOne" , method=RequestMethod.POST)
//		public String updateOne(StockDTO stockDTO) {
//			int result = -1;
//			System.out.println(stockDTO);
//			result = stockService.updateCountStock(stockDTO);
//			System.out.println("update 실행 : " + result);
//			
//			
//			return "redirect:Stock";
//			
//		}
	 
	 
	 @RequestMapping(value="/deleteStock", method=RequestMethod.POST)
	 public String deleteEmp(@RequestParam("stock_Id") String stock_Id) {
	     StockDTO stockDTO = new StockDTO();
	     stockDTO.setStock_Id(stock_Id); // stock_Id를 StockDTO에 설정

	     int result = stockService.deleteStock(stockDTO);
	     System.out.println("delete 실행 : " + result);

	     return "redirect:/Stock"; // 삭제 후 재고 목록 페이지로 리다이렉트
	 }

	 
	 
	 
	 
	 
	
}
