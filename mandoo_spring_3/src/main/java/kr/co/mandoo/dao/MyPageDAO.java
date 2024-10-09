package kr.co.mandoo.dao;

import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.MyPageDTO;

@Repository
public interface MyPageDAO {

	public MyPageDTO myPageRead();
}
