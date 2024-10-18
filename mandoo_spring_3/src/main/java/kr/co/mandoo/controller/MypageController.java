package kr.co.mandoo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.Service.MyPageService;
import kr.co.mandoo.dto.MyPageDTO;
import kr.co.mandoo.dto.UserDTO;

@Controller
public class MypageController {

    @Autowired
    MyPageService myPageService;

    @RequestMapping("/mypage")
    public String home(HttpSession session, Model model) {
        // 세션에서 UserDTO 가져오기
        UserDTO user = (UserDTO) session.getAttribute("user");

        // user가 null인지 확인
        if (user == null) {
            // 적절한 에러 처리 또는 리다이렉트
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        // user_id를 가져와서 myPageService 호출
        MyPageDTO mypage = myPageService.myPageRead(user.getUser_Id());
        System.out.println(mypage);
        model.addAttribute("mypage", mypage);

        return "mypage"; // JSP 파일 경로
    }
}
