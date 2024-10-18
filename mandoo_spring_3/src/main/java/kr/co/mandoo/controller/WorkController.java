package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.WorkService;
import kr.co.mandoo.dto.WorkDTO;

@Controller
public class WorkController {

    @Autowired
    private WorkService workService;

    @GetMapping("/Work")
    public String listWork(Model model, 
                           @RequestParam(value = "page", defaultValue = "1") int currentPage) {
        List<WorkDTO> list = workService.listWork(); // 검색어 없이 모든 작업 목록 조회

        // 페이징 처리 로직
        int pageSize = 4; // 페이지당 작업 수
        int totalItems = list.size(); // 전체 작업 수
        int totalPages = (totalItems + pageSize - 1) / pageSize; // 전체 페이지 수

        // 현재 페이지에 해당하는 작업만 가져오기
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);
        List<WorkDTO> paginatedList = list.subList(startIndex, endIndex);

        model.addAttribute("list", paginatedList);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);

        return "Work"; // JSP 페이지로 이동
    }

    @PostMapping("/insertWork")
    public String insertProductionPlan(Model model, WorkDTO dto) {
        int result = workService.insertWork(dto);
        model.addAttribute("result", result);
        return "redirect:/Work"; // 등록 후 목록으로 리다이렉트
    }
}
