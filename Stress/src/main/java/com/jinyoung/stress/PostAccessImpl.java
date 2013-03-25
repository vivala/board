package com.jinyoung.stress;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

@Repository("pa")
public class PostAccessImpl {
	
	Connection con = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	PoolManager pool = PoolManager.getInstance();
	String sql = null;
	
	public void connect() {
		try {
			con = pool.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		try {
			pool.freeConnection(con, st);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//코드를 고칠수있는 방법..?
	public void add (Post post) {
		try {
			connect();
			
			sql = "insert into post (b_id, subj, content, category, writer, wdate, mdate, hit, parent, depth, attach, passwd, ipaddr)" +
					"values (?, ?, ?, ?, ?, now(), now(), ?, ?, ?, ?, ?, ?)";
			st = con.prepareStatement(sql);
			
			st.setInt(1, post.getB_id());
			st.setString(2, post.getSubj());
			st.setString(3, post.getContent());
			st.setInt(4, post.getCategory());
			st.setString(5, post.getWriter());
/*			st.setString(6, "now()");
			st.setString(7, "now()");*/
			st.setInt(6, post.getHit());
			st.setInt(7, post.getParent());
			st.setInt(8, post.getDepth());
			st.setString(9, post.getAttach());
			st.setString(10, post.getPasswd());
			st.setString(11, post.getIpaddr());
			
			st.executeUpdate();
			
			disconnect();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void update (Post post) {
		try {
			connect();
			
			sql = "update post set subj = ?, content = ?, category = ?, writer = ?, mdate = ?, attach = ?, passwd = ?, ipaddr = ? where id = ?";
			st = con.prepareStatement(sql);
			
			st.setString(1, post.getSubj());
			st.setString(2, post.getContent());
			st.setInt(3, post.getCategory());
			st.setString(4, post.getWriter());
			st.setString(5, post.getMdate());
			st.setString(6, post.getAttach());
			st.setString(7, post.getPasswd());
			st.setString(8, post.getIpaddr());
			st.setInt(9, post.getId());
			
			st.executeUpdate();
			
			disconnect();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	public void delete (Post post) {
		
		try {
			connect();
			
			sql = "delete from post where id = ?";
			st = con.prepareStatement(sql);
			
			st.setInt(1, post.getId());
			
			st.executeUpdate();
			
			disconnect();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	//글 보기
	public Post get(int id) {
		
		Post temp = new Post();
		
		try {
			
			connect();
			
			sql = "select * from post where id = ?";
			st = con.prepareStatement(sql);
			
			st.setInt(1, id);
			
			rs = st.executeQuery();
			rs.next();
			
			temp.setB_id(rs.getInt("b_id"));
			temp.setId(rs.getInt("id"));
			temp.setSubj(rs.getString("subj"));
			temp.setAttach(rs.getString("attach"));
			temp.setCategory(rs.getInt("category"));
			temp.setContent(rs.getString("content"));
			temp.setDepth(rs.getInt("depth"));			
			temp.setHit(rs.getInt("hit"));
			temp.setIpaddr(rs.getString("ipaddr"));
			temp.setMdate(rs.getString("mdate"));
			temp.setParent(rs.getInt("parent"));
			temp.setPasswd(rs.getString("passwd"));
			temp.setWdate(rs.getString("wdate"));
			temp.setWriter(rs.getString("writer"));
			
			disconnect();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return temp;
	}
	//게시판 목록에 글 몇개씩 가져온다.
	public ArrayList<Post> list(Page page) {
		
		ArrayList<Post> arr = new ArrayList<Post>();
		
		try {
			connect();
			
			sql = "select id, subj, writer, wdate, mdate from post order by id desc limit " + ((page.getCurrentpage() - 1) * page.getPage()) + ", " + page.getPage();
			
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				Post temp = new Post();
				
				temp.setId(rs.getInt("id"));
				temp.setSubj(rs.getString("subj"));
				temp.setWriter(rs.getString("writer"));
				temp.setWdate(rs.getString("wdate"));
				temp.setMdate(rs.getString("mdate"));
				
				arr.add(temp);

			}
			
			disconnect();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return arr;
	}
	
	public int getNum () {
		
		int rowCount = 0;
		
		try {
			connect();
			
			sql = "select count(*) from post";
			st = con.prepareStatement(sql);
			rs = st.executeQuery();
			
			if(rs.next()) rowCount = rs.getInt(1); 
			
			disconnect();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return rowCount;
	}
	
	
	
}

