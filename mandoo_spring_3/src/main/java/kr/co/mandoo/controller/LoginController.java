package kr.co.mandoo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mandoo.Service.AccountService;
import kr.co.mandoo.Service.UserService;
import kr.co.mandoo.dto.AccountDTO;
import kr.co.mandoo.dto.UserDTO;

@Controller
public class LoginController {

	
	

    @Autowired
    UserService userService;
    AccountService accountService;
    
    @Autowired
    public LoginController(UserService userService, AccountService accountService) {
        this.userService = userService;
        this.accountService = accountService;
    }



    // GET 요청 시 로그인 페이지로 이동
    @GetMapping("/login")
    public String showLoginPage(@RequestParam(value = "error", required = false) String error,
                                @RequestParam(value = "success", required = false) String success,
                                Model model) {
        if ("invalid".equals(error)) {
            model.addAttribute("errorMessage", "아이디 또는 비밀번호가 잘못되었습니다.");
        } else if ("exception".equals(error)) {
            model.addAttribute("errorMessage", "로그인 중 오류가 발생했습니다.");
        }

        if ("true".equals(success)) {
            model.addAttribute("successMessage", "회원가입에 성공했습니다. 로그인 해주세요.");
        }

        return "login"; // /WEB-INF/views/login.jsp
    }

    // POST 요청 시 로그인 처리
    @PostMapping("/login")
    public String login(@RequestParam("user_id") String userId,
                        @RequestParam("user_pw") String userPw,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {
        try {
            UserDTO user = userService.authenticate(userId, userPw);
            if (user != null) {
                session.setAttribute("user", user);
                session.setAttribute("user_access", user.getUser_Access());
                session.setMaxInactiveInterval(60 * 30); // 30분

                return "redirect:/index";
            } else {
                redirectAttributes.addAttribute("error", "invalid");
                return "redirect:/login";
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("error", "exception");
            return "redirect:/login";
        }
    }



   

	/*
	 * @PostMapping("/register") public String register(@ModelAttribute AccountDTO
	 * user,
	 * 
	 * @RequestParam("user_pw_check") String userPwCheck, RedirectAttributes
	 * redirectAttributes) { // 비밀번호 일치 여부 확인 if
	 * (!user.getAccount_Pw().equals(userPwCheck)) {
	 * redirectAttributes.addFlashAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
	 * return "redirect:/login"; // 오류 시 회원가입 페이지로 리다이렉트 }
	 * 
	 * try { // 계정 추가 accountService.addAccount(user);
	 * redirectAttributes.addAttribute("success", "true"); return "redirect:/login";
	 * // 성공 시 로그인 페이지로 리다이렉트 } catch (Exception e) { e.printStackTrace();
	 * redirectAttributes.addFlashAttribute("errorMessage", "회원가입 중 오류가 발생했습니다.");
	 * return "redirect:/login"; // 오류 발생 시 회원가입 페이지로 리다이렉트 } }
	 */

}
