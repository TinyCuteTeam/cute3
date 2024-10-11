package kr.co.mandoo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.BoardDetailService;
import kr.co.mandoo.dto.BoardDetailDTO;

@Controller
public class BoardDetailController {

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
}
