package kr.co.mandoo.service;

import java.util.List;

import kr.co.mandoo.dto.ClientDTO;

public interface ClientService {
	
	List listClient();
	public int insertClient(ClientDTO clientDTO);
}
