package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.MemberDTO;

public class MemberDAO {
	
	public Connection getConnection()throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.60.9:1521:xe";
		String user = "kh";
		String pw = "kh";
		return DriverManager.getConnection(url, user, pw);
	}
	public int insert(MemberDTO dto)throws Exception {
		String sql = "insert into msgtest values(?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,dto.getName());
			pstat.setString(2,dto.getMsg());
			ResultSet rs = pstat.executeQuery();
			if(rs.next()) {
				return 1;
			}else {
				return -1;
			}
		}
	}
}
