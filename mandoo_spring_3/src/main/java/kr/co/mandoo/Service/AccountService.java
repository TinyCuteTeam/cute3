package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.AccountDAO;
import kr.co.mandoo.dto.AccountDTO;
import kr.co.mandoo.dto.UserDTO;

@Service
public class AccountService {

	@Autowired
   AccountDAO accountDAO;
	@Autowired
   UserService userService;



    public boolean registerAccount(AccountDTO account) throws Exception {
        if (accountDAO.getAccountById(account.getAccount_Id()) != null) {
            return false; 
        }
        accountDAO.createAccount(account);
        return true;
    }

    public void addAccount(AccountDTO account) throws Exception {
        accountDAO.addAccount(account);
    }

    public List<AccountDTO> getAllAccounts() throws Exception {
        return accountDAO.getAllAccounts();
    }

    public void approveAccount(String accountId) throws Exception {
        AccountDTO account = accountDAO.getAccountById(accountId);
        System.out.println(account);
        
            UserDTO user = new UserDTO();
            user.setUser_Id(account.getAccount_Id());
            user.setUser_Pw(account.getAccount_Pw());
            user.setUser_Access(1);
            user.setUser_Name(account.getAccount_Name());
            user.setUser_Email(account.getAccount_Email());
            System.out.println("유저 삽입되는지 확인"+user);
            userService.insertUser(user);
           
            System.out.println("서비스 인서트 완료");
            accountDAO.deleteAccount(accountId);
    }

    public void rejectAccount(String accountId) throws Exception {
        accountDAO.deleteAccount(accountId);
    }

}
