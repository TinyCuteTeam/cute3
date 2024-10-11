package kr.co.mandoo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.Service.MyPageService;
import kr.co.mandoo.dto.MyPageDTO;

@Controller
public class MypageController {

    @Autowired
    MyPageService myPageService;
    
    @RequestMapping("/mypage")
    public String home(Model model) {
        MyPageDTO mypage = myPageService.myPageRead(); // 단일 DTO 객체로 변경
        System.out.println(mypage);
        model.addAttribute("mypage", mypage); // DTO 객체를 모델에 추가
        
        return "mypage"; // JSP 파일 경로
    }
}
