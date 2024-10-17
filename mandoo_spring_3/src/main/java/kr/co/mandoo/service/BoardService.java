package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.BoardDAO;
import kr.co.mandoo.dto.BoardDTO;

@Service
public class BoardService {

    private final BoardDAO boardDAO;

    @Autowired
    public BoardService(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    public List<BoardDTO> getAllPosts() {
        return boardDAO.getAllPosts();
    }


    public int getTotalPostsCount() {
        try {
            return boardDAO.getTotalPostsCount();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void createPost(BoardDTO boardDTO) {
    	boardDAO.insertPost(boardDTO);
    }
}
