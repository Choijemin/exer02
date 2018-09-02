package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DummyDao {
	String dburl = "jdbc:oracle:thin:@13.209.41.239:1521:xe";;
	String dbuser =  "dev";
	String dbpassword = "oracle";
	
public int addData(String id, String pass, String name, String gender) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into account values(?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			ps.setString(3, name);
			ps.setString(4, gender);
			int n = ps.executeUpdate(); // send → receive 작업을 함.

			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
public int addData(Map param) {
	try {
		Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
		String sql = "insert into baseresult values(?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, (String)param.get("id"));
		ps.setString(2, (String)param.get("pass"));
		ps.setInt(3, (Integer)param.get("name"));
		ps.setDouble(4, (Double)param.get("gender"));
		int n = ps.executeUpdate(); // send → receive 작업을 함.
		conn.close();
		return n;
} catch (Exception e) {
	e.printStackTrace();
	return -1;
}
}
// 데이터 전체 추출하는메서드
public List<Map<String, Object>> getAllDatas() {
	try {
		Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
		String sql = "select * from account order by tried asc, elapsed asc";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<Map<String, Object>> ret;
		if(rs.next()) {
			ret = new ArrayList<>();
			do {
				Map<String, Object> one = new LinkedHashMap<>();
					one.put("id", rs.getString("id"));
					one.put("pass", rs.getString("pass"));
					one.put("name", rs.getInt("name"));
					one.put("gender", rs.getDouble("gender"));
				ret.add(one);
			} while(rs.next());
		}else {
			ret = null;
		}
		conn.close();
		return ret;
	} catch(Exception e) {
		e.printStackTrace();
		return null;
	}
}
}
