package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.MyPageDAO;
import kr.co.mandoo.dto.MyPageDTO;

@Service
public class MypageServiceImpl implements MyPageService {

	@Autowired
	MyPageDAO mypageDAO;
	MyPageDTO mypageDTO;
	
	
	@Override
	public MyPageDTO myPageRead() {
		
		MyPageDTO list = mypageDAO.myPageRead();
		
		return list;
	}
}
