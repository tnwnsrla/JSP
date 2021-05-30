package product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import product.dto.ProductVO;
import util.DBManager;

public class ProductDAO {
	private ProductDAO() { }
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() { return instance; }
	
	public List<ProductVO> selectAllProducts() {
		String sql = "select * from product order by code desc"; // 최근 등록한 상품 먼저 출력하기
		List<ProductVO> list = new ArrayList<ProductVO>();
		try(Connection conn = DBManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
					while (rs.next()) { // 이동은 행(로우)단위로
						ProductVO pVo = new ProductVO();
						pVo.setCode(rs.getInt("code"));
						pVo.setName(rs.getString("name"));
						pVo.setPrice(rs.getInt("price"));
						pVo.setPictureUrl(rs.getString("pictureUrl"));
						pVo.setDescription(rs.getString("description"));
						list.add(pVo);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		return list;
	}
	
	public void insertProduct(ProductVO pVo) {
		String sql = "insert into product (name, price, pictureurl, description) values(?, ?, ?, ?)";
		try (Connection conn = DBManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
				pstmt.setString(1, pVo.getName());
				pstmt.setInt(2, pVo.getPrice());
				pstmt.setString(3, pVo.getPictureUrl());
				pstmt.setString(4, pVo.getDescription());
				pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ProductVO selectProductByCode(Integer code) {
		String sql = "select * from product where code=?"; // 최근 등록한 상품 먼저 출력하기
		ProductVO pVo = null;
		ResultSet rs = null;
		try(Connection conn = DBManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
				pstmt.setInt(1, code);
				rs = pstmt.executeQuery();
					if (rs.next()) { // 이동은 행(로우)단위로
						pVo = new ProductVO();
						pVo.setCode(rs.getInt("code"));
						pVo.setName(rs.getString("name"));
						pVo.setPrice(rs.getInt("price"));
						pVo.setPictureUrl(rs.getString("pictureUrl"));
						pVo.setDescription(rs.getString("description"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					DBManager.close(rs);
				}
		return pVo;
	}
	
	public void updateProduct(ProductVO pVo) {
		String sql = "update product set name=?, price=?, pictureurl=?, description=? where code=?";
		try (Connection conn = DBManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
				pstmt.setString(1, pVo.getName());
				pstmt.setInt(2, pVo.getPrice());
				pstmt.setString(3, pVo.getPictureUrl());
				pstmt.setString(4, pVo.getDescription());
				pstmt.setInt(5,  pVo.getCode());
				pstmt.executeUpdate(); // 쿼리문 실행
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteProduct(Integer code) {
		String sql = "delete from product where code=?";
		try (Connection conn = DBManager.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);){
				pstmt.setInt(1, code);
				pstmt.executeUpdate(); // 쿼리문 실행
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
