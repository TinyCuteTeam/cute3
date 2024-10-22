package kr.co.mandoo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.AccountDTO;

@Repository
public class AccountDAOImpl implements AccountDAO {

    private final SqlSessionTemplate sqlSession;

    @Autowired
    public AccountDAOImpl(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public AccountDTO getAccountById(String accountId) throws Exception {
        return sqlSession.selectOne("mandoo.DAO.AccountDAO.getAccountById", accountId);
    }

    @Override
    public void createAccount(AccountDTO account) throws Exception {
        sqlSession.insert("mandoo.DAO.AccountDAO.createAccount", account);
    }

    @Override
    public List<AccountDTO> getAllAccounts() throws Exception {
        return sqlSession.selectList("mandoo.DAO.AccountDAO.getAllAccounts");
    }

    @Override
    public void deleteAccount(String accountId) throws Exception {
        sqlSession.delete("mandoo.DAO.AccountDAO.deleteAccount", accountId);
    }

    @Override
    public void addAccount(AccountDTO account) throws Exception {
        sqlSession.insert("mandoo.DAO.AccountDAO.addAccount", account);
    }
}
