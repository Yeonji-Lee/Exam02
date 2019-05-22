package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<MemberDTO> SelectAll() throws Exception{
		String sql = "select * from msgtest";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				ResultSet rs = pstat.executeQuery();
				List<MemberDTO> result = new ArrayList<MemberDTO>();
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setName(rs.getString(1));
					dto.setMsg(rs.getString(2));
					result.add(dto);
				}
				return result;
		}
	}
	
}
