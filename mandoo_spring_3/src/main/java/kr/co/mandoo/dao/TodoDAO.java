package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.TodoDTO;

public interface TodoDAO {
    List<TodoDTO> getTodosByUserId(String userId);
    void addTodo(TodoDTO todo);
    void updateTodo(TodoDTO todo);
    void deleteTodo(int todoId);
}
