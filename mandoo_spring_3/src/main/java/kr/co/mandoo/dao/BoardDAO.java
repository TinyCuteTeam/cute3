package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.BoardDTO;

public interface BoardDAO {

    List<BoardDTO> getAllPosts();

    int getTotalPostsCount();

    void insertPost(BoardDTO boardDTO);

}
