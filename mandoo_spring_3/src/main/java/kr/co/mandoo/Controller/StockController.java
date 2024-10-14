package kr.co.mandoo.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.StockService;
import kr.co.mandoo.dto.StockDTO;
import kr.co.mandoo.dto.StockOrderDTO;

@Controller
public class StockController {
	
	@Autowired
	StockService stockService;

    // 페이징 처리된 재고 목록 조회
    @RequestMapping("/Stock")
    public String stock(
            Model model,
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            @RequestParam(value = "itemsPerPage", defaultValue = "4") int itemsPerPage) {

        List<StockDTO> list = stockService.stockList();
        
        int totalItems = list.size();
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
        
        // 현재 페이지의 데이터만 서브리스트로 추출
        int startItem = (currentPage - 1) * itemsPerPage;
        int endItem = Math.min(startItem + itemsPerPage, totalItems);
        List<StockDTO> paginatedList = list.subList(startItem, endItem);

        // 모델에 데이터 추가
        model.addAttribute("list", paginatedList);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("itemsPerPage", itemsPerPage);

        return "Stock";
    }

	
	// sub controller
	@RequestMapping("/Stocksub")
	public String substock(Model model) {
		
		List list = stockService.stocksubList();
		System.out.println("/substock : " + list);
		model.addAttribute("list", list);
		
		return "Stock(sub)";
		
	}
	
	// og controller
	@RequestMapping("/Stockog")
	public String ogstock(Model model) {
		
		List list = stockService.stockogList();
		System.out.println("/ogstock : " + list);
		model.addAttribute("list", list);
		
		return "Stock(og)";
		
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
	
	// sub search controller
	@RequestMapping("/StocksubSelect")
	public String subselectOne( Model model , @RequestParam("search") String stock) {
		
		System.out.println("Searching for stock: " + stock);
		List list = stockService.substockListOne(stock);
		System.out.println("Search result: " + list);
		model.addAttribute("list", list);
		model.addAttribute("searchKeyword", stock); // 추가
		
		return "Stock(sub)";
		
	}
	
	// og search controller
	@RequestMapping("/StockogSelect")
	public String ogselectOne( Model model , @RequestParam("search") String stock) {
		
		System.out.println("Searching for ogstock: " + stock);
		List list = stockService.ogstockListOne(stock);
		System.out.println("Search result: " + list);
		model.addAttribute("list", list);
		model.addAttribute("searchKeyword", stock); // 추가
		
		return "Stock(og)";
		
	}
	
	@RequestMapping(value = "/updateOne", method = RequestMethod.POST)
	public String updateOne(HttpServletRequest request, @ModelAttribute StockDTO stockDTO, @ModelAttribute StockOrderDTO dto, Model model) {
	    // UTF-8 인코딩 설정
	    try {
	        request.setCharacterEncoding("UTF-8");
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace(); // 로깅 추가
	    }
	    
	    // StockOrderDTO의 내용 확인
	    System.out.println("StockOrderDTO: " + dto); // DTO의 필드 값 확인

	    
	    // 재고 업데이트
	    int result = stockService.updateCountStock(stockDTO);
	    // 발주 정보 삽입
	    int result1 = stockService.insertStockOrder(dto);
	    
	    // 결과 메시지 설정
	    String message;
	    if (result > 0 && result1 > 0) {
	        message = "재고와 발주가 성공적으로 수정되었습니다.";
	    } else if (result > 0) {
	        message = "재고 수정 성공, 발주 수정 실패.";
	    } else if (result1 > 0) {
	        message = "발주 수정 성공, 재고 수정 실패.";
	    } else {
	        message = "재고와 발주 수정 모두 실패.";
	    }
	    System.out.println("업데이트 one : " + result);
	    System.out.println("발주 : " + result1);
	    
	    model.addAttribute("message", message);
	    
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
	 public String deleteEmp(@RequestParam("item_Code") String item_Code) {
	     StockDTO stockDTO = new StockDTO();
	     stockDTO.setItem_Code(item_Code);

	     System.out.println(" item_Code: " + item_Code);

	     int result = stockService.deleteStock(stockDTO);
	     System.out.println("delete 실행 : " + result);

	     return "redirect:/Stock";
	 }

	 
	 
	 
	 
	 
	
}
