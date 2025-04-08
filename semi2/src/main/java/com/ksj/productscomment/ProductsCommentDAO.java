package com.ksj.productscomment;
import java.util.*;
import java.sql.*;
import java.sql.Date;

public class ProductsCommentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**판매자 댓글목록보기*/
	public ArrayList<ProductsCommentDTO> productsSellerCommentList(int products_id){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products_comment where products_id = ? order by ref asc, sunbun asc,lev asc ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, products_id);
			rs = ps.executeQuery();
			ArrayList<ProductsCommentDTO> arr = new ArrayList<ProductsCommentDTO>();
			while(rs.next()) {
				int productsCommentIdx = rs.getInt("products_comment_idx");
				int productsId = rs.getInt("products_id");
				String buyerId = rs.getString("buyer_id");
				String sellerId = rs.getString("seller_id");
				String commentContent = rs.getString("comment_content");
				java.sql.Date create_date = rs.getDate("create_date");				
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				int commentDiv = rs.getInt("comment_div");
				ProductsCommentDTO dto = new ProductsCommentDTO(productsCommentIdx, productsId, buyerId,sellerId, commentContent,create_date, ref, lev, sunbun,commentDiv);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();																
			} catch (Exception e2) {}
		}
	}
	
	/**댓글작성자 댓글목록보기*/
	public ArrayList<ProductsCommentDTO> buyerProductsCommentList(String buyerId,int products_id){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products_comment where buyer_id=? and products_id = ? order by ref asc,sunbun asc, lev asc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, buyerId);
			ps.setInt(2, products_id);
			rs = ps.executeQuery();
			ArrayList<ProductsCommentDTO> arr = new ArrayList<ProductsCommentDTO>();
			while(rs.next()) {
				int productsCommentIdx = rs.getInt("products_comment_idx");
				int productsId = rs.getInt("products_id");
				String sellerId = rs.getString("seller_id");
				String commentContent = rs.getString("comment_content");
				java.sql.Date create_date = rs.getDate("create_date");				
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				int commentDiv = rs.getInt("comment_div");
				ProductsCommentDTO dto = new ProductsCommentDTO(productsCommentIdx, productsId,buyerId, sellerId, commentContent,create_date, ref, lev, sunbun,commentDiv);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();																
			} catch (Exception e2) {}
		}
	}
	/**products_comment_idx 이용해 답글할 댓글 가져오기*/
	public ProductsCommentDTO productsCommentList(int products_comment_idx){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products_comment where products_comment_idx= ? order by ref asc,sunbun asc,lev asc ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, products_comment_idx);
			rs = ps.executeQuery();
			ProductsCommentDTO dto = null;
			if(rs.next()) {
				int productsId = rs.getInt("products_id");
				String buyerId = rs.getString("buyer_id");
				String sellerId = rs.getString("seller_id");
				String commentContent = rs.getString("comment_content");
				java.sql.Date create_date = rs.getDate("create_date");				
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				int commentDiv = rs.getInt("comment_div");
				dto = new ProductsCommentDTO(products_comment_idx, productsId, buyerId, sellerId, commentContent,create_date, ref, lev, sunbun,commentDiv);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();																
			} catch (Exception e2) {}
		}
	}
	/**products_id 이용해 답글할 댓글 가져오기*/
	public ProductsCommentDTO productsIdCommentList(int products_id){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products_comment where products_id= ? order by ref asc,sunbun asc,lev asc ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, products_id);
			rs = ps.executeQuery();
			ProductsCommentDTO dto = null;
			if(rs.next()) {
				int products_comment_idx = rs.getInt("products_comment_idx");
				String buyerId = rs.getString("buyer_id");
				String sellerId = rs.getString("seller_id");
				String commentContent = rs.getString("comment_content");
				java.sql.Date create_date = rs.getDate("create_date");								
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				int commentDiv = rs.getInt("comment_div");
				dto = new ProductsCommentDTO(products_comment_idx, products_id, buyerId, sellerId, commentContent,create_date, ref, lev, sunbun,commentDiv);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();																
			} catch (Exception e2) {}
		}
	}
	/**마지막 ref 구하기 관련 메서드*/
	public int getMaxRef() {
		try {
			String sql = "select max(ref) from products_comment";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int ref = 0;
			if(rs.next()) {
				ref = rs.getInt(1);
			}
			return ref;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {}
		}
	}
	/**작성자 글쓰기 관련 메서드*/
	public int productsCommentWrite(ProductsCommentDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			int ref = getMaxRef();
			String sql = "insert into products_comment values(products_comment_idx.nextval,?,?,?,?,sysdate,?,0,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getProducts_id());
			ps.setString(2, dto.getBuyer_id());
			ps.setString(3, dto.getSeller_id());
			ps.setString(4, dto.getComment_content());
			ps.setInt(5, ref+1);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	/**답변시 sunbun업데이트 관련 메서드*/
	public void setSunUpdate(int ref,int sun) {
		try {
			String sql = "update products_comment set sunbun= sunbun + 1 where ref = ? and sunbun >= ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sun);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) {}
		}
	}
	/**sunbun 최대값 가져오기*/
	public int getLastSunbun(int ref) {
	    try {
	        String sql = "SELECT MAX(sunbun) FROM products_comment WHERE ref = ? ";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, ref);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            return rs.getInt(1);
	        } else {
	            return 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return 0;
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	        } catch (Exception e2) {}
	    }
	}
	/**sunbun 최솟값 가져오기*/
	public int getFristSunbun(int ref, int lev, int sunbun) {
	    try {
	        String sql = "SELECT min(sunbun) FROM products_comment WHERE ref = ? AND sunbun > ? AND lev <= ?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, ref);
	        ps.setInt(2, sunbun);
	        ps.setInt(3, lev);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            int result = rs.getInt(1);
	            return result == 0 ? -1 : result;
	        } else {
	            return -1;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	        } catch (Exception e2) {}
	    }
	}
	/**답변글쓰기 관련 메서드*/
	public int productsCommentReWrite(ProductsCommentDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			int insertSunbun = getFristSunbun(dto.getRef(), dto.getLev(), dto.getSunbun());
			if(insertSunbun != -1) {
				setSunUpdate(dto.getRef(), insertSunbun);
			}else {
				insertSunbun = getLastSunbun(dto.getRef()) +1;
			}
			String sql = "insert into products_comment values(products_comment_idx.nextval,?,?,?,?,sysdate,?,?,?,0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getProducts_id());
			ps.setString(2, dto.getBuyer_id());
			ps.setString(3, dto.getSeller_id());
			ps.setString(4, dto.getComment_content());
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getLev()+1);
			ps.setInt(7, insertSunbun);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	/**삭제하기하면 coment div가 1로 바뀌면서 삭제되었습니다라고 표현하기 만듬*/
	public int updateProductsComment(int products_comment_idx) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update products_comment set comment_div = ? where products_comment_idx=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, 1);
			ps.setInt(2, products_comment_idx);
			int result = ps.executeUpdate();
			return result;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();				
			} catch (Exception e2) {}
		}
	}
	/**답글내용 수정을 위해 만듬*/
	public int updateProductsComment(int products_comment_idx,String comment_content) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update products_comment set comment_content = ? where products_comment_idx=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, comment_content);
			ps.setInt(2, products_comment_idx);
			int result = ps.executeUpdate();
			return result;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();				
			} catch (Exception e2) {}
		}
	}
	/**댓글삭제를 위해서 만듬*/
	public int deleteProductsComment(int products_id) {
		try {
			conn= com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from products_comment where products_id = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, products_id);
			int result = ps.executeUpdate();
			return result;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();								
			} catch (Exception e2) {}
		}
	}
}
