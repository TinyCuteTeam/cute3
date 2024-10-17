package kr.co.mandoo.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.MyPageDAO;
import kr.co.mandoo.dto.MyPageDTO;

@Service
public class MypageServiceImpl implements MyPageService {

    @Autowired
    MyPageDAO mypageDAO;

    @Override
    public MyPageDTO myPageRead(String userId) {
        MyPageDTO mypageDTO = mypageDAO.myPageRead(userId);
        return mypageDTO;
    }
}
