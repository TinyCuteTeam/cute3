package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.TodoDTO;

@Repository
public class TodoDAOImpl implements TodoDAO {
    
	@Autowired
	SqlSession sqlSession;


    @Override
    public List<TodoDTO> getTodosByUserId(String userId) {
        return sqlSession.selectList("TodoMapper.getTodosByUserId", userId);
    }

    @Override
    public void addTodo(TodoDTO todo) {
        sqlSession.insert("TodoMapper.addTodo", todo);
    }

    @Override
    public void updateTodo(TodoDTO todo) {
        sqlSession.update("TodoMapper.updateTodo", todo);
    }

    @Override
    public void deleteTodo(int todoId) {
        sqlSession.delete("TodoMapper.deleteTodo", todoId);
    }
}
