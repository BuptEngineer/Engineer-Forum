package com.qust.engineer.dao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;



import com.qust.engineer.entity.Answer;
import com.qust.engineer.entity.Question;
import com.qust.engineer.entity.User;

import cn.itcast.jdbc.TxQueryRunner;
public class AnswerDao {

	private QueryRunner qr = new TxQueryRunner();
	
	
	//宸茬粡娣诲姞杩囧洖澶嶇殑鐢ㄦ埛涓嶈兘鍐嶆坊鍔犱簡
	
	
	/**
	 * 娣诲姞鍥炵瓟
	 * @param answer
	 * @throws SQLException
	 */
	public void add(Answer answer) throws SQLException{
		String sql = "INSERT INTO tbl_answer (q_id,a_content,u_id,a_time) VALUES (?,?,?,?)";
		answer.toString();
		Object[] params = {answer.getQuestion().getQ_id(),answer.getA_content(),answer.getUser().getU_id(),answer.getA_time()};
		qr.update(sql, params);
	}
	
	/**
	 * 
	 * 妫�鏌ョ敤鎴锋槸鍚﹀凡缁忔坊鍔犺繃鍥炲
	 * 
	 * @param answer
	 * @return
	 * @throws SQLException 
	 */
	public boolean IsAnswered(Answer answer) throws SQLException{
		
		String sql="SELECT COUNT(*) FROM tbl_answer WHERE u_id = ? AND q_id = ?";
		Number n=(Number) qr.query(sql, new ScalarHandler(),answer.getQuestion().getQ_id(),answer.getUser().getU_id());
		return n.intValue()==0;
	}
	
	
	/**
	 * 鏍规嵁闂id鏉ユ煡鎵惧洖澶�
	 * @param q_id
	 * @return
	 * @throws SQLException 
	 */
	public List<Answer> findAByQid(int q_id) throws SQLException{
		String sql = "select * from tbl_answer  where  q_id = ?";
		
		List<Answer> answer = new ArrayList<Answer>();
		answer = qr.query(sql, new BeanListHandler<Answer>(Answer.class),q_id);
		
		for (Answer answer2 : answer) {
			answer2.setUser(this.findUByAid(answer2.getA_id()));
			answer2.setQuestion(this.findQByAid(answer2.getA_id()));
		}
		return answer;
	}
	
	
	/**
	 * 鏍规嵁鐢ㄦ埛鍥炵瓟鏉ユ煡鎵剧敤鎴�
	 * @param a_id
	 * @return
	 * @throws SQLException
	 */
	public User findUByAid(int a_id) throws SQLException {
		String sql = "SELECT u_id,u_name,u_img FROM tbl_user WHERE u_id IN(SELECT u_id FROM tbl_answer WHERE a_id = ?)";
		return qr.query(sql, new BeanHandler<User>(User.class),a_id);
	}
	
	/**
	 * 鏍规嵁鐢ㄦ埛鍥炵瓟鏉ユ煡鎵鹃棶棰�
	 * @param a_id
	 * @return
	 * @throws SQLException
	 */
	public Question findQByAid(int a_id) throws SQLException{
		String sql = "SELECT * FROM tbl_question WHERE q_id IN(SELECT q_id FROM tbl_answer WHERE a_id = ?)";		
		return qr.query(sql, new BeanHandler<Question>(Question.class),a_id);
	}

	
	/**
	 * 鏇存柊鍥炵瓟
	 * @param a_id
	 * @throws SQLException
	 */
	public void update(Answer answer) throws SQLException{
		String sql = "UPDATE  tbl_answer SET a_content=?,a_time=? WHERE a_id = ?";
		qr.update(sql,answer.getA_content(),answer.getA_time(),answer.getA_id());
	}
	
	
	
	/**
	 * 鍒犻櫎鍥炵瓟
	 * @param a_id
	 * @throws SQLException
	 */
	public void delete(int a_id) throws SQLException{
		String sql = "delete from tbl_answer where a_id=?";
		qr.update(sql,a_id);
	}
	
	
}
