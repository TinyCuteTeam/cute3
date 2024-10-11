package kr.co.mandoo.dao;

import kr.co.mandoo.dto.BoardDetailDTO;
import org.apache.ibatis.annotations.Param;

public interface BoardDetailDAO {
    BoardDetailDTO getPostDetail(@Param("boardId") String boardId);
}
