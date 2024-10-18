package kr.co.mandoo.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.BoardDetailService;
import kr.co.mandoo.Service.BoardService;
import kr.co.mandoo.dto.BoardDTO;
import kr.co.mandoo.dto.BoardDetailDTO;
import kr.co.mandoo.dto.UserDTO;

@Controller
public class BoardController {


    @Autowired
    private BoardService boardService;

    @GetMapping("/boardList")
    public String boardList(HttpSession session, Model model,
                            @RequestParam(value = "page", defaultValue = "1") int currentPage) {
        UserDTO user = (UserDTO) session.getAttribute("user");

        // 로그인 체크
        if (user == null) {
            return "redirect:/login";
        }

        int pageSize = 8; // 페이지당 게시글 수
        List<BoardDTO> allPosts = boardService.getAllPosts(); // 모든 게시글 목록 가져오기

        int totalItems = allPosts.size(); // 전체 게시글 수
        int totalPages = (totalItems + pageSize - 1) / pageSize; // 전체 페이지 수

        // 현재 페이지에 해당하는 게시글만 가져오기
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);
        List<BoardDTO> posts = allPosts.subList(startIndex, endIndex);

        model.addAttribute("posts", posts);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);

        return "board"; 
    }
    
    @Autowired
    private BoardDetailService boardDetailService;

    @GetMapping("/board/detail")
    public String getPostDetail(@RequestParam("bord_id") String bordId, Model model) {
        try {
            BoardDetailDTO post = boardDetailService.getPostDetail(bordId);
            model.addAttribute("post", post);
        } catch (Exception e) {
            e.printStackTrace();
            return "error"; // 실제 에러 페이지로 변경
        }
        return "board_detail"; // 상세 페이지로 이동
    }
    
    @GetMapping("/board/add")
    public String addGo(Model model) {


    	return "board_add";
    }
    
    @PostMapping("/addPost")
    public String addPost(Model model, BoardDTO boardDTO, HttpSession session) {
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user == null) {
            return "redirect:login"; // 로그인 페이지로 리다이렉트
        }

        boardDTO.setUser_Id(user.getUser_Id());
        boardService.createPost(boardDTO);

        return "redirect:/boardList"; // 게시글 목록 페이지로 리다이렉트
    }


}
