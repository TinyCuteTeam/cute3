package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.Service.OrderInfoService;
import kr.co.mandoo.dto.OrderInfoDTO;

@Controller
public class OrderInfoController {

	@Autowired
	OrderInfoService orderInfoService;

	@RequestMapping("/OrderInfo")
//	@ResponseBody
	public String listOrderInfo(Model model) {
		List<OrderInfoDTO> list = orderInfoService.listOrderInfo(); // 1번
		System.out.println("list 출력" + list);
		model.addAttribute("list", list); // 2번, jsp는 3번

		System.out.println("list.size() :" + list.size());

		return "orderInfo";
	}
	
	
//	@RequestMapping("/OrderInfo2")
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		resp.setContentType("text/html; charset=UTF-8");
//
//		String pageParam = req.getParameter("page");
//		int page = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
//		int pageSize = 5;
//
//		try {
//			int totalOrders = orderInfoService.getTotalOrders();
//			int totalPages = (int) Math.ceil((double) totalOrders / pageSize);
//
//			List<OrderInfoDTO> orders = orderInfoService.getOrdersByPage(page, pageSize);
//
//			req.setAttribute("orders", orders);
//			req.setAttribute("currentPage", page);
//			req.setAttribute("totalPages", totalPages);
//
//			req.getRequestDispatcher("/WEB-INF/발주확인.jsp").forward(req, resp);
//		} catch (Exception e) {
//			throw new ServletException(e);
//		}
//	}

}
