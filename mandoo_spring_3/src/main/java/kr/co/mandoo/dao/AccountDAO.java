package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.AccountDTO;

@Repository
public class AccountDAO {

    private final SqlSession sqlSession;
    private static final String NAMESPACE = "mapper.dto.";

    @Autowired
    public AccountDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    public List<AccountDTO> selectAccount() {
        return sqlSession.selectList(NAMESPACE + "selectAccount");
    }

    public void insertAccount(AccountDTO account) {
        sqlSession.insert(NAMESPACE + "insertAccount", account);
    }

    public void updateAccount(AccountDTO account) {
        sqlSession.update(NAMESPACE + "updateAccount", account);
    }

    public void deleteAccount(String accountId) {
        sqlSession.delete(NAMESPACE + "deleteAccount", accountId);
    }
}
