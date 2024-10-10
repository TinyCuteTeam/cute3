package kr.co.mandoo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.mandoo.Service.BoardService;
import kr.co.mandoo.dto.BoardDTO;


@Controller
public class HomeController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Model model) {
        List<BoardDTO> posts = boardService.getAllPosts();
        
        model.addAttribute("posts", posts);
		
		return "index";
	}
	
}
