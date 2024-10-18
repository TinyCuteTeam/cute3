package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mandoo.Service.ErrorService;
import kr.co.mandoo.dto.ErrorDTO;

@Controller
public class ErrorController {

	@Autowired
	ErrorService errorService;

	@RequestMapping("/error")
	public String listError(Model model) {

		List<ErrorDTO> list = errorService.listError();
		System.out.println("list: " + list);
		model.addAttribute("list", list);

		System.out.println("list.size: " + list.size());

		return "error";
	}

//	// 삭제하기 원래 코드 
//	@RequestMapping(value = "/delete", method = RequestMethod.POST)
//	public String delete(@RequestParam("error_Id") String error_Id) {
//
//		System.out.println(error_Id);
//
//		ErrorDTO errorDTO = new ErrorDTO();
//		errorDTO.setError_Id(error_Id);
//
//		int result = errorService.deleteError(errorDTO);
//
//		System.out.println("delete 실행 " + result);
//
//		return "redirect:/error";
//		// delete로 갔다가 결국 보여지는 건 error.jsp 페이지
//	}
	
	// 삭제하기 다시 해보기 
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deleteError(Model model, ErrorDTO errorDTO) {
		
		int result = errorService.deleteError(errorDTO);
		System.out.println("delete 실행 " + result);
		
		return "redirect:/error";
		// delete로 갔다가 결국 보여지는 건 error.jsp 페이지
	}

	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insertError(Model model, ErrorDTO errorDTO) {
		
		System.out.println("insert 실행");
		
		int list = -1;
		list = errorService.insertError(errorDTO);
		
		model.addAttribute("list",list);
		
		System.out.println("insert result 실행: "+list);
		
		return "redirect:/error";
	}
	
	
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updateError(Model model, ErrorDTO errorDTO) {
		
		System.out.println("update 실행");
		
		int list = -1;
		list = errorService.updateError(errorDTO);
		
		model.addAttribute("list",list);
		
		System.out.println("update result 실행: "+list);
		
		return "redirect:/error";
	}
}
