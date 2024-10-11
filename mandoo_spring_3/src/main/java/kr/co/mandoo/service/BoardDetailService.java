package kr.co.mandoo.Service;

import kr.co.mandoo.dao.BoardDetailDAO;
import kr.co.mandoo.dto.BoardDetailDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardDetailService {

    @Autowired
    private BoardDetailDAO boardDetailDAO;

    public BoardDetailDTO getPostDetail(String boardId) throws Exception {
        return boardDetailDAO.getPostDetail(boardId);
    }
}
