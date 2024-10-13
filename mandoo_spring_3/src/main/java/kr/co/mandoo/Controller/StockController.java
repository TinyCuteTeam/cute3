package kr.co.mandoo.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mandoo.Service.StockService;
import kr.co.mandoo.dto.StockDTO;

@Controller
public class StockController {

	@Autowired
	StockService stockService;

	@RequestMapping("/Stock")
	public String stock(Model model, @RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(value = "search", required = false) String searchKeyword) {

		int pageSize = 4; // 페이지당 항목 수
		List<StockDTO> list;

		// 검색어가 있는 경우
		if (searchKeyword != null && !searchKeyword.isEmpty()) {
			list = stockService.stockListOne(searchKeyword); // 검색어가 있을 때
		} else {
			list = stockService.stockList(); // 전체 재고 리스트
		}

		int totalItems = list.size(); // 전체 항목 수
		int totalPages = (totalItems + pageSize - 1) / pageSize; // 총 페이지 수

		// 페이징 처리를 위한 인덱스 계산
		int startIndex = (currentPage - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalItems);

		// 시작 인덱스가 전체 아이템 수를 초과하지 않도록 처리
		if (startIndex >= totalItems) {
			startIndex = totalItems;
		}

		// 현재 페이지에 해당하는 데이터만 가져오기
		List<StockDTO> pagedList = list.subList(startIndex, endIndex); // 서브리스트 호출
		System.out.println("Paged List: " + pagedList); // 여기에 추가

		model.addAttribute("list", pagedList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalItems", totalItems); // totalItems를 모델에 추가
		model.addAttribute("searchKeyword", searchKeyword); // 검색어를 모델에 추가

		return "Stock"; // JSP 파일 이름
	}

	@RequestMapping("/StockSelect")
	public String selectOne(Model model, @RequestParam("search") String stock) {
		System.out.println("Searching for stock: " + stock);
		List<StockDTO> list = stockService.stockListOne(stock);
		System.out.println("Search result: " + list);
		model.addAttribute("list", list);
		model.addAttribute("searchKeyword", stock); // 검색어 추가

		return "Stock"; // JSP 파일 이름
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

	@RequestMapping(value = "/deleteStock", method = RequestMethod.POST)
	public String deleteEmp(@RequestParam("stock_Id") String stock_Id) {
		StockDTO stockDTO = new StockDTO();
		stockDTO.setStock_Id(stock_Id); // stock_Id를 StockDTO에 설정

		int result = stockService.deleteStock(stockDTO);
		System.out.println("delete 실행 : " + result);

		return "redirect:/Stock"; // 삭제 후 재고 목록 페이지로 리다이렉트
	}
}
