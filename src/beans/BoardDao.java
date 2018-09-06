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
 * mybatis �� ���ؼ� DB ó���� �� ����, Connection ��� ���� �� �Ѵ�.
 * mybatis ���� ��ü�� ���� ����ϸ� �ȴ�.
 */
public class BoardDao {
	SqlSessionFactory factory;
	
	// throws �� �޼��忡�� �߻��ϴ� exception ó�� ���ϰڴ�.
	public BoardDao() throws IOException {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factory = builder.build(is);
	}
	
	
	public int addBoard(Map param) {
		SqlSession sql = factory.openSession(); // JDBC�� Connect����
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
		SqlSession sql =factory.openSession();	// JDBC �� Connect����
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