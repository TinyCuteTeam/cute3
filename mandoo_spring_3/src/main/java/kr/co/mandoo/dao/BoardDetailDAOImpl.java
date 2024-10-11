package kr.co.mandoo.dao;


import kr.co.mandoo.dto.BoardDetailDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDetailDAOImpl implements BoardDetailDAO {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public BoardDetailDTO getPostDetail(String boardId) {
        return sqlSession.selectOne("kr.co.mandoo.dao.BoardDetailDAO.getPostDetail", boardId);
    }
}
