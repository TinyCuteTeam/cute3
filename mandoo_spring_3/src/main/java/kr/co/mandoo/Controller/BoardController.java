package kr.co.mandoo.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.mandoo.Service.BoardService;
import kr.co.mandoo.dto.BoardDTO;
import kr.co.mandoo.dto.UserDTO;

@Controller
public class BoardController {


    @Autowired
    private BoardService boardService;

    @GetMapping("/boardList")
    public String boardList(HttpSession session, Model model) {
        UserDTO user = (UserDTO) session.getAttribute("user");

        // 로그인 체크
        if (user == null) {
            return "redirect:/login";
        }

        // 모든 게시글 목록 가져오기
        List<BoardDTO> posts = boardService.getAllPosts();
        
        model.addAttribute("posts", posts);

        return "board"; // /WEB-INF/views/board.jsp
    }

}
