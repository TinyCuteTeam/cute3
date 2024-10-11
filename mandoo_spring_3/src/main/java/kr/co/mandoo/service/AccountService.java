package kr.co.mandoo.Service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.AccountDAO;
import kr.co.mandoo.dto.AccountDTO;

@Service
public class AccountService {

    private final AccountDAO accountDAO;

    @Autowired
    public AccountService(AccountDAO accountDAO) {
        this.accountDAO = accountDAO;
    }

    public List<AccountDTO> getAllAccounts() {
        return accountDAO.selectAccount();
    }

    public void addAccount(AccountDTO account) {
        accountDAO.insertAccount(account);
    }

    public void updateAccount(AccountDTO account) {
        accountDAO.updateAccount(account);
    }

    public void deleteAccount(String accountId) {
        accountDAO.deleteAccount(accountId);
    }
}

