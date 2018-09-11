package beans;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GoodLogDao {
	SqlSessionFactory factory;
	
	// throws 그 메서드에서 발생하는 exception 처리 안하겠다.
	public GoodLogDao() throws IOException {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factory = builder.build(is);
	}
	
	public int addGood(Map map) {
		SqlSession sql = factory.openSession(); // JDBC의 Connect과정
		try {
			int r = sql.insert("goodlog.addDataUsingMap", map);
			if(r==1) 
				sql.commit();
			return r;
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	public List<Integer> getLogByActor(String id) {
		SqlSession sql =factory.openSession();	// JDBC 의 Connect과정
		try {
			List<Integer> p = sql.selectList("goodlog.incGoodByNo");
			return p;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
