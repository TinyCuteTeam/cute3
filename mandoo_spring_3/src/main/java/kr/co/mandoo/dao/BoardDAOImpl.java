package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

    private final SqlSession sqlSession;

    @Autowired
    public BoardDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public List<BoardDTO> getAllPosts() {
        return sqlSession.selectList("kr.co.mandoo.dao.BoardDAO.getAllPosts");
    }

    @Override
    public int getTotalPostsCount() {
        return sqlSession.selectOne("kr.co.mandoo.dao.BoardDAO.getTotalPostsCount");
    }

    @Override
    public void insertPost(BoardDTO boardDTO) {
        sqlSession.insert("kr.co.mandoo.dao.BoardDetailDAO.insertPost", boardDTO);
    }


}
