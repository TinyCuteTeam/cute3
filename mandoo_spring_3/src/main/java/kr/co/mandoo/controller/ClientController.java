package kr.co.mandoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mandoo.dto.ClientDTO;
import kr.co.mandoo.service.ClientService;

@Controller
public class ClientController {

	@Autowired
	ClientService clientService;
	
	@RequestMapping("/client")
	public String listClient(Model model) {
		// 들어와서 해야하는 일
		List<ClientDTO> clientList = clientService.listClient();
		System.out.println("client list: "+clientList);
		
		// jsp로 나가기 위해서 준비하는 과정
		model.addAttribute("list",clientService.listClient()); 
		//jsp 로 list라는 글씨에 담아서 
		
		System.out.println("Client list.size: " + clientList.size());
		
		return "client"; // 그 list를 담은 채로 jsp에 보낸다
	}
}
