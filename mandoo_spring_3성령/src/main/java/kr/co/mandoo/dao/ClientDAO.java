package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.ClientDTO;

public interface ClientDAO {

	List selectClient();
	public int insertClient(ClientDTO clientDTO);
	
}
