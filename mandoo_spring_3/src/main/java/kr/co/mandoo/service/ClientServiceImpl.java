package kr.co.mandoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.ClientDAO;
import kr.co.mandoo.dto.ClientDTO;

@Service
public class ClientServiceImpl implements ClientService {
	
	@Autowired // new ClientDAOImpl(); 
	ClientDAO clientDAO;
	
	@Override
	public List listClient() {
		List<ClientDTO> list = clientDAO.selectClient();
//		<ClientDTO>제네릭 : 들어갈 수 있는 거 제한 거는 것
//		clientDAO 클래스에 있는 selectClient메소드를 실행한 결과를 list에 넣는다
		return list;
	}

}
