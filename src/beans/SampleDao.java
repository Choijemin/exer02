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
public class SampleDao {
	SqlSessionFactory factory;
	
	// throws �� �޼��忡�� �߻��ϴ� exception ó�� ���ϰڴ�.
	public SampleDao() throws IOException {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factory = builder.build(is);
	}
	
	
	public int addBoardResult(Map param) {
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
}