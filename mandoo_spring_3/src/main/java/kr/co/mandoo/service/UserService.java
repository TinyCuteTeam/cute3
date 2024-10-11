package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.UserDAO;
import kr.co.mandoo.dto.UserDTO;

@Service
public class UserService {

    private final UserDAO userDAO;

    @Autowired
    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    // 로그인 인증 메서드
    public UserDTO authenticate(String userId, String userPw) {
        UserDTO user = userDAO.selectUserById(userId);
        if (user != null && user.getUser_Pw().equals(userPw)) { // 비밀번호 비교 수정
            return user; // 인증 성공
        }
        return null; // 인증 실패
    }


    // 사용자 조회 메서드
    public UserDTO getUserById(String userId) {
        return userDAO.selectUserById(userId);
    }

    // 사용자 추가 메서드
    public void insertUser(UserDTO user) {
        userDAO.insertUser(user);
    }

    // 사용자 업데이트 메서드
    public void updateUser(UserDTO user) {
        userDAO.updateUser(user);
    }

    // 사용자 삭제 메서드
    public void deleteUser(String userId) {
        userDAO.deleteUser(userId);
    }

    // 모든 사용자 가져오기
    public List<UserDTO> getAllUsers() {
        return userDAO.selectAllUsers();
    }
}
