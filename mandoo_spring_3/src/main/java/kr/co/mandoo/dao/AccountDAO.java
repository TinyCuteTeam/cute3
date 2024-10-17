package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.AccountDTO;

public interface AccountDAO {
    AccountDTO getAccountById(String accountId) throws Exception;
    void createAccount(AccountDTO account) throws Exception;
    List<AccountDTO> getAllAccounts() throws Exception;
    void deleteAccount(String accountId) throws Exception;
    void addAccount(AccountDTO account) throws Exception; // 추가된 메서드
}
