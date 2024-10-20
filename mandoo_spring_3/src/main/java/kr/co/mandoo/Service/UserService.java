package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.UserDAO;
import kr.co.mandoo.dto.UserDTO;

@Service
public class UserService {

    private final UserDAO userDAO;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); // BCrypt 인코더 생성

    @Autowired
    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    // 로그인 인증 메서드
    public UserDTO authenticate(String userId, String userPw) {
        UserDTO user = userDAO.selectUserById(userId);

        // 사용자 비밀번호 검증 (BCrypt로 비교)
        if (user != null && passwordEncoder.matches(userPw, user.getUser_Pw())) {
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
        System.out.println("서비스 실행");

        // 사용자 비밀번호를 해싱하여 저장 (BCrypt로 해싱)
        String hashedPassword = passwordEncoder.encode(user.getUser_Pw());
        user.setUser_Pw(hashedPassword);  // 해싱된 비밀번호를 설정

        userDAO.insertUser(user);  // DAO를 통해 사용자 추가
    }

    // 사용자 업데이트 메서드
    public void updateUser(UserDTO user) {
        // 비밀번호를 변경하는 경우, 새 비밀번호를 해싱
        if (user.getUser_Pw() != null) {
            String hashedPassword = passwordEncoder.encode(user.getUser_Pw());
            user.setUser_Pw(hashedPassword);  // 해싱된 비밀번호를 설정
        }
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
