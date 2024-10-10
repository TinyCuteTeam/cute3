package kr.co.mandoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.dto.ErrorDTO;
import kr.co.mandoo.service.ErrorService;

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

	// 삭제하기
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("error_Id") String error_Id) {

		System.out.println(error_Id);

		ErrorDTO errorDTO = new ErrorDTO();
		errorDTO.setError_Id(error_Id);

		int result = errorService.deleteError(errorDTO);

		System.out.println("delete 실행 " + result);

		return "redirect:/error";
		// delete로 갔다가 결국 보여지는 건 error.jsp 페이지
	}

}
