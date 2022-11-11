package dao;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User1VO;
public class User5DAO  extends DBHelper {
	
	private static User5DAO instance = new User5DAO();
	public static User5DAO getInstance() {
		return instance;
	}
	
	private User5DAO()  {}
	
	public void inserUser1 (User1VO vo) {
		
		try {
			conn = getConnection();
			conn.prepareStatement("insert into `user1` values(?,?,?,?)");
			psmt.setString(1,vo.getUid());
			psmt.setString(2,vo.getName());
			psmt.setString(3,vo.getHp());
			psmt.setInt(4,vo.getAge());
			psmt.executeUpdate();
			
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public User1VO selectUser1(String uid) {
		
		User1VO vo =null;
		try {
			conn=getConnection();
			psmt = conn.prepareStatement("select*from `user1` where `uid`=?");
			psmt.setString(1, uid);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				vo = new User1VO();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getString(4));
			}
			close();
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return vo;
	}
	public List<User1VO> selectUser1s() {
		
		List<User1VO> users =new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs=stmt.executeQuery("select * from `user1`");
			
			while(rs.next()) {
				User1VO vo = new User1VO();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getString(4));
				users.add(vo);
				
				
			}
			close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	public void updateUser1(User1VO vo) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement("update `user1` set `name`=?, `hp`=?, `age`=? where `uid`=?");
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getUid());
			psmt.executeQuery();
			close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser1(String uid) {
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement("delete from `user1` where `uid`=?");
			psmt.setString(1, uid);
			psmt.executeQuery();
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
}
