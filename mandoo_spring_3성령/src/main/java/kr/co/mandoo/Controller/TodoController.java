package kr.co.mandoo.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.mandoo.Service.TodoService;
import kr.co.mandoo.dto.TodoDTO;

@Controller
public class TodoController {
	@Autowired
    TodoService todoService;



    @GetMapping("/todo")
    public String showTodoList(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user_Id");
        List<TodoDTO> todoList = todoService.getTodosByUserId(userId);
        model.addAttribute("todoList", todoList);
        return "Todo"; // JSP 파일 이름
    }

    @PostMapping("/todo")
    public String addTodo(HttpSession session, TodoDTO todo) {
        String userId = (String) session.getAttribute("user_Id");
        todo.setUser_Id(userId);
        todoService.addTodo(todo);
        return "redirect:/Todo";
    }
}
