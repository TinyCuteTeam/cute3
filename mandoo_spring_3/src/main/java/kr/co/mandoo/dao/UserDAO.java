package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.UserDTO;

@Repository
public class UserDAO {

    private final SqlSession sqlSession;
    private static final String NAMESPACE = "mandoo.mapper.UserMapper.";

    @Autowired
    public UserDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 특정 사용자 조회
    public UserDTO selectUserById(String userId) {
        return sqlSession.selectOne(NAMESPACE + "selectUserById", userId);
    }

    // 모든 사용자 조회
    public List<UserDTO> selectAllUsers() {
        return sqlSession.selectList(NAMESPACE + "selectUser");
    }

    // 사용자 추가
    public void insertUser(UserDTO user) {
        sqlSession.insert(NAMESPACE + "insertUser", user);
    }

    // 사용자 수정
    public void updateUser(UserDTO user) {
        sqlSession.update(NAMESPACE + "updateUser", user);
    }

    // 사용자 삭제
    public void deleteUser(String userId) {
        sqlSession.delete(NAMESPACE + "deleteUser", userId);
    }
}
