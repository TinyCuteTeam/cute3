package kr.co.mandoo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mandoo.Service.ClientService;
import kr.co.mandoo.dto.ClientDTO;

@Controller
public class ClientController {

	@Autowired
	ClientService clientService;
	
    @RequestMapping("/client")
    public String listClient(Model model, 
                             @RequestParam(defaultValue = "1") int page, 
                             @RequestParam(defaultValue = "5") int itemsPerPage) {
        // 전체 데이터 가져오기
        List<ClientDTO> clientList = clientService.listClient();
        
        // 전체 아이템 수
        int totalItems = clientList.size();
        
        // 총 페이지 수
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
        
        // 페이지 범위에 맞는 데이터를 잘라서 가져옴
        int start = (page - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, totalItems);
        List<ClientDTO> pagedClients = clientList.subList(start, end);

        // 모델에 데이터와 페이징 정보 전달
        model.addAttribute("list", pagedClients);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "client";
    }
	
	@RequestMapping(value="/insertClient", method= RequestMethod.POST)
	public String insertClient(Model model, ClientDTO clientDTO) {
		
		System.out.println("insert 실행");
		
		int list = -1;
		list = clientService.insertClient(clientDTO);
		
		// jsp로 나가기 위해서 준비하는 과정
		model.addAttribute("list",list); 
		//jsp 로 list라는 글씨에 담아서 
		
		return "redirect:/client"; // 그 list를 담은 채로 jsp에 보낸다
	}
}
