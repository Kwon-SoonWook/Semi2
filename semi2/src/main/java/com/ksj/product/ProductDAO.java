package com.ksj.product;

import java.util.*;
import java.sql.*;
import java.sql.Date;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int ERROR=-1;
	/*전체물품 찾기*/
	public ArrayList<ProductDTO> AllProductList() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products order by create_date desc";
			ps = conn.prepareStatement(sql);
			ProductDTO dto = null;
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
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
	/*보이기 전체물품 찾기*/
	public ArrayList<ProductDTO> stateProductList() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products where bbs_state = 0 order by create_date desc";
			ps = conn.prepareStatement(sql);
			ProductDTO dto = null;
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
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
	/*검색물품 찾기*/
	public ArrayList<ProductDTO> SearchProductList(String keyword, String sort) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products where title like ? and bbs_state = 0";
			
			switch(sort) {
			case "oldest" :
				sql += " order by create_date asc";
				break;
			case "lowprice" :
				sql += " order by price asc";
				break;
			case "highprice" :
				sql += " order by price desc";
				break;
			default:
				sql += " order by create_date desc";
				break;
			}
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				ProductDTO dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
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
	/**물품등록*/
	public int productInsert(ProductDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "insert into products values(products_idx.nextval,?,?,?,?,?,?,?,?,?,?,?,sysdate,sysdate,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getCategory_id());
			ps.setString(2, dto.getBuyer_id());
			ps.setString(3, dto.getSeller_id());
			ps.setInt(4, dto.getPrice());
			ps.setString(5, dto.getTitle());
			ps.setString(6, dto.getContent());
			ps.setString(7, dto.getLocation());
			ps.setInt(8, dto.getTrade_state());
			ps.setInt(9, dto.getBbs_state());
			ps.setString(10, dto.getThumb_image());
			ps.setInt(11, dto.getView_cnt());
			ps.setString(12, dto.getImage_uri());
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	/**가장 마지막에 등록된 물품 id 찾기*/
	public int searchProductIdx() {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select max(products_id) from products";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int productsId=0;
			if(rs.next()) {
				productsId= rs.getInt(1);
			}
			return productsId;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();				
			} catch (Exception e2) {}
		}
	}
	/**특정 물품id 리스트 가져오기*/
	public ProductDTO ProductList(int productId) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products where products_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			ProductDTO dto = null;
			rs = ps.executeQuery();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
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
	/**물품거래수정*/
	public int updateTradeProduct(ProductDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update products set trade_state=? where products_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getTrade_state());
			ps.setInt(2, dto.getProducts_id());
			int result = ps.executeUpdate();
			return result;
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
	/**물품숨기기수정 0이면 보이고 1이면 안보이게*/
	public int updateBbsProduct(ProductDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update products set bbs_state=? where products_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getBbs_state());
			ps.setInt(2, dto.getProducts_id());
			int result = ps.executeUpdate();
			return result;
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
	/**물품거래상태수정 0 1 2 로 나뉨 각각 판매중 거래중 거래완료*/
	public int updateProductTrade(ProductDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "update products set trade_state=? where products_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getTrade_state());
			ps.setInt(2, dto.getProducts_id());
			int result = ps.executeUpdate();
			return result;
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
	/**물품수정*/
	public int upadteProduct(ProductDTO dto) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "UPDATE products SET category_id = ?, price= ?,title= ?,content= ?,location = ?,thumb_image=?, update_date = sysdate where products_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getCategory_id());
			ps.setInt(2, dto.getPrice());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setString(5, dto.getLocation());
			ps.setString(6, dto.getThumb_image());
			ps.setInt(7, dto.getProducts_id());
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	/**판매가 완료가 되고 후기가 작성이면 되면 구매자가 갱신됨*/
	public int upadteProductBuyerId(String buyer_id, int products_id) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "UPDATE products SET buyer_id = ? where products_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, buyer_id);
			ps.setInt(2, products_id);
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	//mypage-saleList
	public ArrayList<ProductDTO> saleList(String sellerid){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select * from products where seller_id = ? order by create_date desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sellerid);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				ProductDTO dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
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
	
	public ArrayList<ProductDTO> favoriteList(String userid){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select distinct * from products pd, favorite_products fp where pd.products_id = fp.products_id and is_valid = 1 and user_id = ? and bbs_state = 0";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				ProductDTO dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
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
	public ArrayList<ProductDTO> recentList(String userid){
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "select distinct * from products pd, favorite_products fp where pd.products_id = fp.products_id and user_id = ? and bbs_state = 0";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				int products_id = rs.getInt("products_id");
				int category_id = rs.getInt("category_id");
				String buyer_id = rs.getString("buyer_id");
				String seller_id = rs.getString("seller_id");
				int price = rs.getInt("price");
				String title = rs.getString("title");
				String content =rs.getString("content");
				String location = rs.getString("location");
				int trade_state = rs.getInt("trade_state");
				int bbs_state =rs.getInt("bbs_state");
				String thumb_image = rs.getString("thumb_image");
				int view_cnt = rs.getInt("view_cnt");
				java.sql.Date create_date = rs.getDate("create_date");
				java.sql.Date update_date = rs.getDate("update_date");
				String image_uri = rs.getString("image_uri");
				ProductDTO dto = new ProductDTO(products_id, category_id, buyer_id, seller_id, price, title, content, location, trade_state, bbs_state, thumb_image, view_cnt, create_date, update_date, image_uri);
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
	/**해당 등록된 물품 삭제 메서드*/
	public int deleteProduct(int productId) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
			String sql = "delete from products where products_id=? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			int result = ps.executeUpdate();
			return result;
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
	
	/**총 작성게시물수 관련 메서드*/
	public int getProductCnt(String sid) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
	        String sql = "select distinct count(*) from products where seller_id = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, sid);
	        rs = ps.executeQuery();
	        rs.next();
	        int count = rs.getInt(1);
	        return count;
		}catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
				
			}catch (Exception e) {
			}
		}
	}
	/**총 찜한 게시물수 관련 메서드*/
	public int getfavoriteCnt(String sid) {
		try {
			conn = com.ksj.db.ConnectionDB.getConn();
	        String sql = "select distinct count(*) from products pd, favorite_products fp where pd.products_id = fp.products_id and is_valid = 1 and user_id = ? and bbs_state=0";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, sid);
	        rs = ps.executeQuery();
	        rs.next();
	        int count = rs.getInt(1);
	        return count;
		}catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
				
			}catch (Exception e) {
			}
		}
	}
}
