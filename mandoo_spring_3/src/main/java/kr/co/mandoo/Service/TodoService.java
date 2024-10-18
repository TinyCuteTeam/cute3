package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.TodoDAO;
import kr.co.mandoo.dto.TodoDTO;

@Service
public class TodoService {

	@Autowired
	TodoDAO todoDao;

	public List<TodoDTO> getTodosByUserId(String userId) {
		return todoDao.getTodosByUserId(userId);
	}

	public void addTodo(TodoDTO todo) {
		todoDao.addTodo(todo);
	}

	public void updateTodo(TodoDTO todo) {
		todoDao.updateTodo(todo);
	}

	public void deleteTodo(int todoId) {
		todoDao.deleteTodo(todoId);
	}
}
