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
				int recommend_like = rs.getInt("recommend_like");
				int recommend_dislike = rs.getInt("recommend_dislike");
				
				BbsDTO dto = new BbsDTO(idx, id, title, content, view_cnt, create_date, update_date, bbs_div,image,recommend_like,recommend_dislike);
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
	
	public int bbschange(int id, MultipartRequest mr) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			
			String sql = "update bbs set title = ?, content = ?, update_date = sysdate, bbs_image = ? where bbs_idx = ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("title"));
			ps.setString(2, mr.getParameter("content"));
			ps.setString(3, mr.getFilesystemName("file"));
			ps.setInt(4, id);
			
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
				// TODO: handle exception
			}
		}
		
	}
	
	public int bbsDelete(String idx) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			
			String sql = "delete from bbs where bbs_idx = ?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, idx);
			
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
			
			String sql = "insert into bbs values(bbs_idx.nextval,?,?,?,0,sysdate,sysdate,?,?,0,0)";
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
				int recommend_like = rs.getInt("recommend_like");
				int recommend_dislike = rs.getInt("recommend_dislike");
				
				BbsDTO dto = new BbsDTO(idx, id, title, content, view_cnt, create_date, update_date, bbs_div,image,recommend_like,recommend_dislike);
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
			int recommend_like = rs.getInt("recommend_like");
			int recommend_dislike = rs.getInt("recommend_dislike");
			
			BbsDTO dto = new BbsDTO(idx, id, title, content, view, create_date, update_date, div,image,recommend_like,recommend_dislike);
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
	   /*목록관련 메서드222*/
	   public ArrayList<BbsDTO> bbsList2(int bbsdiv, int cp, int ls) {
	      try {
	         conn = com.ksj.db.DB.getConn();
	         
	         int start = (cp-1)*ls+1;
	         int end = cp*ls;
	         
	         String sql = "select * from (select rownum as rnum, a.* from (select * from bbs where bbs_div = ?)a)b where rnum >= ? and rnum<= ?";
	         
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, bbsdiv);
	         ps.setInt(2, start);
	         ps.setInt(3, end);
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
	            int recommend_like = rs.getInt("recommend_like");
				int recommend_dislike = rs.getInt("recommend_dislike");
				
				BbsDTO dto = new BbsDTO(idx, id, title, content, view_cnt, create_date, update_date, bbs_div,image,recommend_like,recommend_dislike);
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
	
	/*목록관련 메서드*/
	 public ArrayList<BbsDTO> bbsList(int cp, int listSize) {
	      try {
	         conn = com.ksj.db.ConnectionDB.getConn();
	         //String sql = "select * from jsp_bbs order by idx desc";
	         
	         int start=(cp-1)*listSize+1;
	         int end=cp*listSize;
	         
	         String sql= "select * from(select rownum as rnum, a.* from(select * from bbs order by create_date desc)a where bbs_div = 1)b where rnum >= ? and rnum <= ?";	


	         
	                  
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
	            int recommend_like = rs.getInt("recommend_like");
				int recommend_dislike = rs.getInt("recommend_dislike");
				
				BbsDTO dto = new BbsDTO(bbs_idx, bbs_id, title, content, view_cnt, create_date, update_date, bbs_div,bbs_image,recommend_like,recommend_dislike);
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
	
	   /** 마지막 ref 구하기 관련 메서드 */ 
	   public int getMaxRef() {
	      try { 
	         String sql="select max(ref) from bbs_comment";
	         ps=conn.prepareStatement(sql);
	         rs=ps.executeQuery();
	         int ref=0; 
	         if(rs.next()) { 
	            ref=rs.getInt(1);
	         }
	         return ref;
	      } catch (Exception e) {
	         e.printStackTrace();
	         return 0;
	      }finally {
	         try {
	            if(rs!=null)rs.close();
	            if(ps!=null)ps.close();
	         }catch (Exception e2) {}
	      }
	   }
	   
	   /**답변 글쓰기 관련 메서드*/ //250325 답변 2규칙 - 카트 bbsdto받음
	   public int replyComment(CommentDTO dto) {
	      try {
	         conn = com.ksj.db.ConnectionDB.getConn();
	         
	         ///이 getsunbun은 본문글에 대한 순번이므로 +1로 해야지 ~
	         setSunUpdate(dto.getRef(), dto.getSunbun()+1);
	         
	         String sql = "insert into bbs_comment values(bbs_comment_idx.nextval,?,?,?,sysdate,?,?,?)";
	         ps=conn.prepareStatement(sql);
	         //getMaxRef는 ref를 그룹화하기 위해서 쓰였으므로 여기서는 쓰지 않음
	         ps.setString(1, dto.getComment_content());
	         ps.setInt(2, dto.getBbs_idx());
	         ps.setString(3, dto.getNickname());
	         ps.setInt(4, dto.getRef()); //동일하므로 그대로 가져옴
	         ps.setInt(5, dto.getLev()+1); //LEV,sunbun은 1씩 증가하므로 1식 추가해줌 = 조건 충족해줌
	         ps.setInt(6, dto.getSunbun()+1);
	         int count=ps.executeUpdate();
	         return count;
	      }catch (Exception e) {
	         e.printStackTrace();
	         return -1;
	      }finally {
	         try {
	            if (ps != null)
	               ps.close();
	            if (conn != null)
	               conn.close();
	            
	         }catch (Exception e2) {
	            
	         }
	      }
	   }
	   
	   
	   /** 답변 시 sunbun 업데이트 관련 메서드*/  
	   public void setSunUpdate(int ref, int sun) {   
	      try {
	         String sql="update bbs_comment "
	               + "set sunbun=sunbun+1 "
	               + "where ref=? and sunbun>=?" ;
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, ref);
	         ps.setInt(2, sun);
	         ps.executeUpdate();
	      }catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(ps!=null)ps.close();
	         }catch (Exception e2) {
	         
	         }
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
			
			String sql = "select * from bbs_comment where bbs_idx = ? order by ref asc, lev asc,sunbun desc";
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

