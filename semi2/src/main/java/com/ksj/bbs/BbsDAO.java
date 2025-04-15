package com.ksj.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import com.oreilly.servlet.MultipartRequest;

public class BbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ArrayList<BbsDTO> bbsList() {
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "select * from bbs order by create_date desc";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			
			while(rs.next()) {
				int idx = rs.getInt("bbs_idx");
				String id = rs.getString("bbs_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int view_cnt = rs.getInt("view_cnt");
				Date create_date = rs.getDate("create_date");
				Date update_date = rs.getDate("update_date");
				int bbs_div = rs.getInt("bbs_div");
				String image = rs.getString("bbs_image");
				
				BbsDTO dto = new BbsDTO(idx, id, title, content, view_cnt, create_date, update_date, bbs_div,image);
				arr.add(dto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
	public int bbsUpload(String id, MultipartRequest mr) {
		
		if(id==null) {
			return 0;
		}
		
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "insert into bbs values(bbs_comment_idx.nextval,?,?,?,0,sysdate,sysdate,?,?)";
			ps= conn.prepareStatement(sql);
			
			String image = mr.getFilesystemName("file");
			String div = mr.getParameter("select");
			
			if(div.equals("notice")) {
				div = "0";
			}else if(div.equals("bbs")) {
				div = "1";
			}else if(div.equals("buy")) {
				div="2";
			}
			
			ps.setString(1, id);
			ps.setString(2, mr.getParameter("title"));
			ps.setString(3, mr.getParameter("content"));
			
			ps.setInt(4, Integer.parseInt(div));
			ps.setString(5, image);
			
			int result = ps.executeUpdate();
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public ArrayList<BbsDTO> findBbs(String select, String input) {
		try {
			conn = com.ksj.db.DB.getConn();
			String sql = "";
			int cate = Integer.parseInt(select);
			
			if(cate==0) {
				sql = "select * from bbs order by create_date desc";
				ps = conn.prepareStatement(sql);
			}else if(cate==1) {
				sql = "select * from bbs where bbs_id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, input);
			}else if(cate==2) {
				sql = "select * from bbs where title like ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, "%"+input+"%");
			}
			
			
			rs = ps.executeQuery();
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while(rs.next()) {
				int idx = rs.getInt("bbs_idx");
				String id = rs.getString("bbs_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int view_cnt = rs.getInt("view_cnt");
				Date create_date = rs.getDate("create_date");
				Date update_date = rs.getDate("update_date");
				int bbs_div = rs.getInt("bbs_div");
				String image = rs.getString("bbs_image");
				
				BbsDTO dto = new BbsDTO(idx, id, title, content, view_cnt, create_date, update_date, bbs_div,image);
				arr.add(dto);
			}
			
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	public ArrayList<BbsDTO> showContent(int idx) {
		try {
			conn = com.ksj.db.DB.getConn();
			
			String sql = "select * from bbs where bbs_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			rs = ps.executeQuery();
			
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			
			if(rs.next()) {
			String title = rs.getString("title");
			String id = rs.getString("bbs_id");
			String content = rs.getString("content");
			int view = rs.getInt("view_cnt");
			Date create_date = rs.getDate("create_date");
			Date update_date = rs.getDate("update_date");
			int div = rs.getInt("bbs_div");
			String image = rs.getString("bbs_image");
			
			BbsDTO dto = new BbsDTO(idx, id, title, content, view, create_date, update_date, div,image);
			arr.add(dto);
			}
			
			return arr;
			} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	/*총 게시물 수*/
	public int getTotalCnt(int bbsdiv) {
		try {
			conn = com.ksj.db.DB.getConn();
			String sql = "select count(*) from bbs where bbs_div = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1,bbsdiv);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	/*목록관련 메서드*/
	 public ArrayList<BbsDTO> bbsList(int cp, int listSize) {
	      try {
	         conn = com.ksj.db.ConnectionDB.getConn();
	         //String sql = "select * from jsp_bbs order by idx desc";
	         
	         int start=(cp-1)*listSize+1;
	         int end=cp*listSize;
	         //ref desc,sunbun asc) 250325 변경 및 추가 번호가 각자 다 각기각기 되지만 이렇게 바꿔줌으로써 답변은 답변에 본문밑에 답변 바로 되도록 순서대로
	         String sql= "select * from(select rownum as rnum, a.* from(select * from bbs order by create_date desc)a where bbs_div = 1)b where rnum >= ? and rnum <= ?";	


	         
	                  //결과식 삭제하고 인 파라미터로 작성해줌
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, start);
	         ps.setInt(2, end);
	         rs = ps.executeQuery();
	         ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
	         while (rs.next()) {
	            int bbs_idx = rs.getInt("bbs_idx");
	            String bbs_id = rs.getString("bbs_id");
	            String title = rs.getString("title");
	            String content = rs.getString("content");
	            int view_cnt = rs.getInt("view_cnt");
	            Date create_date = rs.getDate("create_date");
	            Date update_date = rs.getDate("update_date");
	            int bbs_div = rs.getInt("bbs_div");
	            String bbs_image = rs.getString("bbs_image");
	            
	            BbsDTO dto = new BbsDTO(bbs_idx, bbs_id, title, content, view_cnt, create_date, update_date, bbs_div, bbs_image);
	            		
	            arr.add(dto);
	         }
	         return arr;

	      } catch (Exception e) {
	         e.printStackTrace();
	         return null;
	      } finally {
	         try {
	            if (ps != null)
	               ps.close();
	            if (conn != null)
	               conn.close();
	         } catch (Exception e2) {
	         }
	      }
	   }
	
	public void viewCnt(int idx) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			
			String sql = "update bbs set view_cnt = view_cnt+1 where bbs_idx = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			int count = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	   /** 마지막 ref 구하기 관련 메서드 */ //ref는 int이므로 int로 반환값 줌
	   public int getMaxRef() {
	      try { //conn을 셋팅 안하는 이유는 글쓰기에서 이미 셋팅된 후 ref를 수행실 것 이므로 마지막에도 conn을 close안함 하게되면 이 메서드 수행 못함 
	         String sql="select max(ref) from bbs_comment";
	         ps=conn.prepareStatement(sql);
	         rs=ps.executeQuery();
	         int ref=0; //변수 만들어서 0으로 초기화
	         if(rs.next()) { //ref가 데이터가 있다면 1을 반환?
	            ref=rs.getInt(1);
	         }
	         return ref;
	      } catch (Exception e) {
	         e.printStackTrace();
	         return 0;
	      }finally {
	         try {
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close(); // conn을 close하면 ref가 conn을 받고 못하므로 순서대로 할려면 0이였던 것을 파라미터 받게 해서 셋팅
	         }catch (Exception e2) {}
	      }
	   }
	   
	/**댓글 업로드*/
	public int cmtUpload(int idx,String comm,String nickname) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			
			int ref = getMaxRef();
			
			String sql = "insert into bbs_comment values(bbs_comment_idx.nextval,?,?,?,sysdate,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, idx);
			ps.setString(3,nickname);
			ps.setInt(4,ref+1);
			ps.setInt(5, 0);
			ps.setInt(6, 0);
			
			
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
				
			}
		}
	}
	/**댓글 보여주는 메서드*/
	public ArrayList<CommentDTO> showCmt(int idx) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			
			String sql = "select * from bbs_comment where bbs_idx = ? order by ref asc";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			ArrayList<CommentDTO> arr = new ArrayList<CommentDTO>();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				
				dto.setBbs_comment_idx(rs.getInt("bbs_comment_idx")); 
				dto.setComment_content(rs.getString("comment_content"));
				dto.setBbs_idx(rs.getInt("bbs_idx"));
				dto.setNickname(rs.getString("nickname"));
				dto.setUpload_date(rs.getDate("upload_date"));
				dto.setRef(rs.getInt("ref"));
				dto.setLev(rs.getInt("lev"));
				dto.setSunbun(rs.getInt("sunbun"));
				
				arr.add(dto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	   /**총 게시물 수 관련 메서드*/
	   public int getTotalCnt() {
	      try {
	         conn = com.ksj.db.ConnectionDB.getConn();
	         String sql = "select count(*) from bbs where bbs_div = 1";
	         ps=conn.prepareStatement(sql);
	         rs=ps.executeQuery(); //없으면 0이라는 숫자 
	         rs.next();
	         int count=rs.getInt(1); //카운트 돌려줄 수 있또록= 결과값 돌렺ㄹ 수 있도록
	         return count==0?1:count;
	      }catch (Exception e) {
	         e.printStackTrace();
	         return 1;
	      }finally {
	         try {
	            if (rs != null)
	               rs.close();
	            if (ps != null)
	               ps.close();
	            if (conn != null)
	               conn.close();
	         }catch (Exception e2) {
	            
	         }
	      }
	   }
	   
	/**페이징하는데 쓰는거*/
	public ArrayList<BbsDTO> findBbsWithPaging(String select, String input, int startIndex, int pageSize) {
        ArrayList<BbsDTO> list = new ArrayList<>();

        try {
            // SQL 쿼리 작성
            String sql = "";
            int startRow = startIndex + 1;   // Oracle은 1-based
            int endRow = startIndex + pageSize + 1;
            // 검색 조건 설정
            if ("title".equals(select)) {
                sql = "SELECT * FROM (SELECT b.*, ROW_NUMBER() OVER (ORDER BY create_date DESC) AS rn FROM bbs b WHERE title LIKE ?) WHERE rn BETWEEN ? AND ?";
            } else if ("writer".equals(select)) {
                sql = "SELECT * FROM (SELECT b.*, ROW_NUMBER() OVER (ORDER BY create_date DESC) AS rn FROM bbs b WHERE bbs_id LIKE ?) WHERE rn BETWEEN ? AND ?";
            } else {
                sql = "SELECT * FROM (SELECT b.*, ROW_NUMBER() OVER (ORDER BY create_date DESC) AS rn FROM bbs b) WHERE rn BETWEEN ? AND ?"; // 조건이 없으면 전체 검색
            }
            // PreparedStatement 생성
            ps = conn.prepareStatement(sql);

            // 매개변수 설정
            if ("title".equals(select)) {
                ps.setString(1, "%" + input + "%");
                ps.setInt(2, startRow);
                ps.setInt(3, endRow);
            } else if("writer".equals(select)){
            	ps.setString(1, "%" + input + "%");
                ps.setInt(2, startRow);
                ps.setInt(3, endRow);
            } else {
            	ps.setInt(1, startRow);
                ps.setInt(2, endRow);
            }

            // 쿼리 실행 및 결과 저장
            rs = ps.executeQuery();

            // ResultSet 처리 및 리스트에 추가
            while (rs.next()) {
                BbsDTO dto = new BbsDTO();
                dto.setBbs_idx(rs.getInt("bbs_idx"));
                dto.setTitle(rs.getString("title"));
                dto.setBbs_id(rs.getString("bbs_id"));
                dto.setCreate_date(rs.getDate("create_date"));
                dto.setView_cnt(rs.getInt("view_cnt"));
                dto.setBbs_div(rs.getInt("bbs_div"));
                
                list.add(dto);
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        
    }
}

