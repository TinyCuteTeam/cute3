package kr.co.mandoo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

	private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); // BCrypt 인코더 생성

	@Autowired
	UserService userService;
	@Autowired
	AccountService accountService;

	@Autowired
	public LoginController(UserService userService, AccountService accountService) {
		this.userService = userService;
		this.accountService = accountService;
	}

	// GET 요청 시 로그인 페이지로 이동
	@GetMapping("/login")
	public String showLoginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "success", required = false) String success, Model model) {
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
	public String login(@RequestParam("user_id") String userId, @RequestParam("user_pw") String userPw,
			HttpSession session, RedirectAttributes redirectAttributes) {
		try {
			// 사용자 조회
			UserDTO user = userService.authenticate(userId, userPw);

			// 사용자 존재 확인 및 비밀번호 검증
			if (user != null && passwordEncoder.matches(userPw, user.getUser_Pw())) {
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

	// 회원가입 처리
	@PostMapping("/register")
	public String register(@ModelAttribute AccountDTO user, @RequestParam("user_pw_check") String userPwCheck,
			RedirectAttributes redirectAttributes) {
		
		System.out.println("회원가입 실행");
		// 비밀번호 확인
		if (!user.getAccount_Pw().equals(userPwCheck)) {
			redirectAttributes.addFlashAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "redirect:/login";
		}

		try {
			// 비밀번호를 BCrypt로 해싱하여 저장
			String hashedPassword = passwordEncoder.encode(user.getAccount_Pw()); // BCrypt로 해싱
			user.setAccount_Pw(hashedPassword); // 해싱된 비밀번호를 설정

			// 데이터베이스에 저장 전에 암호화된 비밀번호 확인
			System.out.println("Hashed Password: " + hashedPassword);

			accountService.addAccount(user); // 사용자 저장
			redirectAttributes.addAttribute("success", "true");
			return "redirect:/login";
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "회원가입 중 오류가 발생했습니다.");
			return "redirect:/login";
		}
	}
}
