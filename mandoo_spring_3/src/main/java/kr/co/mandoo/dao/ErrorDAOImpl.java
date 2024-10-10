package kr.co.mandoo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mandoo.dto.ErrorDTO;

@Repository
public class ErrorDAOImpl implements ErrorDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List selectError() {
		List list = sqlSession.selectList("mapper.dto.selectError"); 
//		↑ select * from error 이 SQL문을 가져오는 코드 
		System.out.println(list);
		return list;
	}

	@Override
	public int deleteError(ErrorDTO errorDTO) {

		int result = -1; // 여기서 result -1하는 이유는?? 수업시간에 말해주셨는디....
		/*
		 * 초기값 설정: result의 초기값을 -1로 설정하면,
		 *  메소드가 성공적으로 실행되지 않았을 때(예를 들어 예외가 발생한 경우) 
		 * 호출하는 측에서 이 메소드가 실패했음을 알 수 있습니다. 
		 * 이 값은 성공적으로 삭제되었을 경우와 구분하기 위한 용도로 사용됩니다.
			예외 처리: try 블록 안에서 데이터베이스 작업을 수행하며, 
			만약 예외가 발생하면 catch 블록으로 넘어가게 됩니다. 
			이 경우 result는 여전히 -1로 남아 있게 되어, 
			호출하는 측에서 삭제 작업이 실패했음을 알 수 있습니다.*/
		
		try {
			result = sqlSession.delete("mapper.dto.deleteError", errorDTO);
		} catch (Exception e) {
			sqlSession.rollback(); //롤백은 왜
			/*
			 * 트랜잭션 관리: 데이터베이스 작업은 보통 트랜잭션 내에서 수행되며, 
			 * 중간에 오류가 발생하면 그 작업이 완료되지 않은 상태에서 
			 * 데이터베이스의 상태가 변경되는 것을 방지하기 위해 롤백을 수행합니다.
			   데이터 일관성 유지: 롤백을 통해 오류 발생 이전의 상태로 
			   데이터베이스를 되돌림으로써 데이터의 일관성을 유지할 수 있습니다. 
			   예를 들어, 여러 데이터베이스 작업이 함께 실행되는데 그 중 하나에서 오류가 발생하면, 
			   다른 작업들도 취소되어야 데이터베이스가 일관성을 유지할 수 있습니다.*/
		}
		
		return result;
	}
	

}
