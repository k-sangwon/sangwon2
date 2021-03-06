package bbs.board;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



import bbs.board.BoardDataBean;

public class BoardDBBean {

	private static BoardDBBean instance = new BoardDBBean();

	// .jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
	public static BoardDBBean getInstance() {
		return instance;
	}

	private BoardDBBean() {}

	// 커넥션풀로부터 Connection객체를 얻어냄 : DB연동빈의 쿼리문을 수행하는 메소드에서 사용
	 private Connection getConnection() throws Exception {
	      Context initCtx = new InitialContext();
	      Context envCtx = (Context) initCtx.lookup("java:comp/env");
	      DataSource ds = (DataSource)envCtx.lookup("jdbc/jsptesto");
	      return ds.getConnection();
	    }
	    
	    //board테이블에 글을 추가(inset문)<=writePro.jsp에서 사용
	    @SuppressWarnings("resource")
		public int insertArticle(BoardDataBean article){
	        Connection conn = null;
	        PreparedStatement pstmt = null;
			ResultSet rs = null;
			int x = 0;
			int number=0;//board테이블에 들어갈 글번호
	        String sql="";
	        
	        //43~46라인은 댓글이 가진 정보
			int num=article.getNum();//제목글의 글번호
			int ref=article.getRef();//제목글의 그룹화 아이디
			int re_step=article.getRe_step();//그룹내의 글의순서
			int re_level=article.getRe_level();//글제목의 들여쓰기

	        try {
	            conn = getConnection();
	            //51~57라인은 현재 board테이블에 레코드의 유무 판단과 글번호 결정
	            pstmt = conn.prepareStatement("select max(num) from board");
				rs = pstmt.executeQuery();
				
				if (rs.next())//기존에 레코드가 존재
			      number=rs.getInt(1)+1;//다음글 번호는 가장큰 글번호+1
			    else//첫번째 글
			      number=1;
				
			   //60~72라인은 제목글과 댓글간의 순서를 결정
			    if (num!=0){//댓글 - 제목글의 글번호 가짐
			      sql="update board set re_step=re_step+1 where ref= ? and re_step> ?";
	              pstmt = conn.prepareStatement(sql);
	              pstmt.setInt(1, ref);
				  pstmt.setInt(2, re_step);
				  pstmt.executeUpdate();
				  re_step=re_step+1;
				  re_level=re_level+1;
			    }else{//제목글 - 글번호 없음
			  	  ref=number;
				  re_step=0;
				  re_level=0;
			    }	 
	            // 쿼리를 작성 :board테이블에 새로운 레코드 추가
	            sql = "insert into board(num,writer,subject,content,passwd,reg_date,";
			    sql+="ip,ref,re_step,re_level) values(BOARD_SEQ.nextval,?,?,?,?,?,?,?,?,?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, article.getWriter());
	            pstmt.setString(2, article.getSubject());
	            pstmt.setString(3, article.getContent());
	            pstmt.setString(4, article.getPasswd());
				pstmt.setTimestamp(5, article.getReg_date());
				pstmt.setString(6, article.getIp());
	            pstmt.setInt(7, ref);
	            pstmt.setInt(8, re_step);
	            pstmt.setInt(9, re_level);
	            pstmt.executeUpdate();
	            x = 1; //레코드 추가 성공
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
				if (rs != null) try{ rs.close(); }catch(SQLException ex) {}
	            if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
	            if (conn != null) try{ conn.close(); }catch(SQLException ex) {}
	        }
	        return x;
	    }
	    public int getArticleCount() {
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	int x = 0;
	    	
	    	try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select count(*) from board");
				rs=pstmt.executeQuery();
	    			
			   if (rs.next())
		          x= rs.getInt(1);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
	            if (rs != null) try{ rs.close(); }catch(SQLException ex) {}
	            if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
	            if (conn != null) try{ conn.close(); }catch(SQLException ex) {}
	        }
			return x;
	    	
	    }
	    public List<BoardDataBean> getArticles(){
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	List<BoardDataBean> articleList = null;
	  
	    	try {
				conn=getConnection();
				String sql="select * from board order by ref desc, re_step asc";
		    	pstmt = conn.prepareStatement(sql);
		    	
		    	rs=pstmt.executeQuery();
		    
		    	if(rs.next()) {
		    		articleList = new ArrayList<BoardDataBean>();
		    		do {
		    			BoardDataBean article = new BoardDataBean();
		    			
		    			  article.setNum(rs.getInt("num")); 
						  article.setWriter(rs.getString("writer"));
		                  article.setSubject(rs.getString("subject"));
		                  article.setContent(rs.getString("content"));
		                  article.setPasswd(rs.getString("passwd"));
					      article.setReg_date(rs.getTimestamp("reg_date"));
						  article.setReadcount(rs.getInt("readcount"));
		                  article.setRef(rs.getInt("ref"));
		                  article.setRe_step(rs.getInt("re_step"));
						  article.setRe_level(rs.getInt("re_level"));
		                  article.setContent(rs.getString("content"));
		                  
		                  articleList.add(article);
		    	    }while(rs.next());
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return articleList;//List객체의 레퍼런스를 리턴
	    }
	    
	    // 글수정
	    public BoardDataBean updateGetArticle(int num) {
	    	Connection conn= null;
	    	PreparedStatement pstmt= null;
	    	ResultSet rs = null;
	    	BoardDataBean article=null;
	    	
	    	try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"select * from board where num = ?");
				
				pstmt.setInt(1,num);
				rs=pstmt.executeQuery();
				
				  if (rs.next()) {
		                article = new BoardDataBean();
		                article.setNum(rs.getInt("num"));
						article.setWriter(rs.getString("writer"));
		                article.setSubject(rs.getString("subject"));
		                article.setPasswd(rs.getString("passwd"));
					    article.setReg_date(rs.getTimestamp("reg_date"));
						article.setReadcount(rs.getInt("readcount"));
		                article.setRef(rs.getInt("ref"));
		                article.setRe_step(rs.getInt("re_step"));
						article.setRe_level(rs.getInt("re_level"));
		                article.setContent(rs.getString("content"));
					    article.setIp(rs.getString("ip"));  
				  }
				  } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
	            if (rs != null) try{rs.close();}catch(SQLException ex){}
	            if (pstmt != null) try{pstmt.close();}catch(SQLException ex){}
	            if (conn != null) try{conn.close();}catch(SQLException ex){}
	        }
			return article;
	        	
	    }
	    
	    public int updateArticle(BoardDataBean article){
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
			int x=-1;
	        try {
	            conn = getConnection();
	            
				pstmt = conn.prepareStatement(
	            	"select passwd from board where num = ?");
	            pstmt.setInt(1, article.getNum());
	            rs = pstmt.executeQuery();
	            
				if(rs.next()){
				  String dbpasswd= rs.getString("passwd"); 
				  if(dbpasswd.equals(article.getPasswd())){
	                String sql="update board set subject=?, ";
	                sql += "content=? where num=?";
	                pstmt = conn.prepareStatement(sql);
	                pstmt.setString(1, article.getSubject());
	                pstmt.setString(2, article.getContent());
				    pstmt.setInt(3, article.getNum());
	                pstmt.executeUpdate();
					x= 1;
				  }else
					x= 0;
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
				if (rs != null) try{ rs.close(); }catch(SQLException ex) {}
	            if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
	            if (conn != null) try{ conn.close(); }catch(SQLException ex) {}
	        }
			return x;
	    }
	    public int deleteArticle(int num, String passwd){
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
	        int x=-1;
	        try {
				conn = getConnection();

	            pstmt = conn.prepareStatement(
	            	"select passwd from board where num = ?");
	            pstmt.setInt(1, num);
	            rs = pstmt.executeQuery();
	            
				if(rs.next()){
					String dbpasswd= rs.getString("passwd"); 
					if(dbpasswd.equals(passwd)){
						pstmt = conn.prepareStatement(
	            	      "delete from board where num=?");
	                    pstmt.setInt(1, num);
	                    pstmt.executeUpdate();
						x= 1; //글삭제 성공
					}else
						x= 0; //비밀번호 틀림
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try{ rs.close(); }catch(SQLException ex) {}
	            if (pstmt != null) try{ pstmt.close(); }catch(SQLException ex) {}
	            if (conn != null) try{ conn.close(); }catch(SQLException ex) {}
	        }
			return x;
	    }
}
