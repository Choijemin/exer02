package beans;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 * mybatis 를 통해서 DB 처리를 할 때는, Connection 제어를 직접 안 한다.
 * mybatis 제어 객체만 만들어서 사용하면 된다.
 */
public class BoardDao {
	SqlSessionFactory factory;
	
	// throws 그 메서드에서 발생하는 exception 처리 안하겠다.
	public BoardDao() throws IOException {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factory = builder.build(is);
	}
	
	
	public int addBoard(Map param) {
		SqlSession sql = factory.openSession(); // JDBC의 Connect과정
		try {
			int r = sql.insert("board.addDataUsingMap", param);
			if(r==1) 
				sql.commit();
			return r;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Map> getAllDatas() {
		SqlSession sql =factory.openSession();	// JDBC 의 Connect과정
		try {
			List<Map> p = sql.selectList("board.getAllDataUsingMap");
			return p;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Map getOneByNo(int no) {
		SqlSession session = factory.openSession();
		try {
			/*
			 * List<Map> some = session.selectList("board.getOneDataUsingMapByNo", no);
			 * if(some.size()==1) {
			 * 	return some.get(0);
			 * }else {
			 * 	return null;
			 * }
			 */
			return session.selectOne("board.getOneDataUsingMapByNo", no);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}