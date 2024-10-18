package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mandoo.Service.AccountService;
import kr.co.mandoo.dto.AccountDTO;

@Controller
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private AccountService accountService;

    // GET 요청 처리: 계정 목록 표시
    @RequestMapping(method = RequestMethod.GET)
    public String listAccounts(Model model,
                               @RequestParam(value = "page", defaultValue = "1") int currentPage) throws Exception {
        int pageSize = 4; // 페이지당 계정 수
        List<AccountDTO> allAccounts = accountService.getAllAccounts(); // 모든 계정 목록 가져오기

        int totalItems = allAccounts.size(); // 전체 계정 수
        int totalPages = (totalItems + pageSize - 1) / pageSize; // 전체 페이지 수

        // 현재 페이지에 해당하는 계정만 가져오기
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);
        List<AccountDTO> accounts = allAccounts.subList(startIndex, endIndex);

        model.addAttribute("accounts", accounts);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);

        return "account";
    }

	@PostMapping("/approve")
	public String approveAccount(@RequestParam("account_Id") String accountId, RedirectAttributes redirectAttributes) {
		try {
			accountService.approveAccount(accountId);
			redirectAttributes.addFlashAttribute("successMessage", "계정이 승인되었습니다.");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "계정 승인 중 오류가 발생했습니다.");
		}
		return "redirect:/account";
	}

	@PostMapping("/reject")
	public String rejectAccount(@RequestParam("account_Id") String accountId, RedirectAttributes redirectAttributes) {
		try {
			accountService.rejectAccount(accountId);
			redirectAttributes.addFlashAttribute("successMessage", "계정이 거절되었습니다.");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "계정 거절 중 오류가 발생했습니다.");
		}
		return "redirect:/account";
	}

	// POST 요청 처리: 회원가입
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") AccountDTO user,
			@RequestParam("user_pw_check") String userPwCheck, RedirectAttributes redirectAttributes) {

		// 비밀번호 일치 여부 확인
		if (!user.getAccount_Pw().equals(userPwCheck)) {
			redirectAttributes.addFlashAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
			return "redirect:/login"; // 모든 경우에 로그인 페이지로 리다이렉트
		}

		try {
			// 계정 추가
			boolean success = accountService.registerAccount(user);
			if (success) {
				redirectAttributes.addFlashAttribute("successMessage", "회원가입이 완료되었습니다. 로그인해주세요.");
			} else {
				redirectAttributes.addFlashAttribute("errorMessage", "이미 존재하는 계정입니다.");
			}
			return "redirect:/login"; // 모든 경우에 로그인 페이지로 리다이렉트
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "회원가입 중 오류가 발생했습니다.");
			return "redirect:/login"; // 모든 경우에 로그인 페이지로 리다이렉트
		}
	}
}
