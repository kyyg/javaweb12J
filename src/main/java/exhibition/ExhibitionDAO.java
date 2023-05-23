package exhibition;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
public class ExhibitionDAO {

	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";

	ExhibitionVO vo = null;
	
	
	// 전시 리스트 전체 보기
	public ArrayList<ExhibitionVO> getExhibitionList(int startIndexNo, int pageSize) {
		ArrayList<ExhibitionVO> vos = new ArrayList<>();
		try {
			sql = "select * from exhibition order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ExhibitionVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setAuthor(rs.getString("author"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setEndDate(rs.getString("endDate"));
				vo.setAdultPrice(rs.getInt("adultPrice"));
				vo.setChildPrice(rs.getInt("childPrice"));
				vo.setPlace(rs.getString("place"));
				vo.setPoster(rs.getString("poster"));
				vo.setContent(rs.getString("content"));
				vo.setPart(rs.getString("part"));
				vo.setReCnt(rs.getInt("reCnt"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	
	//총 레코드 건수 구하기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from exhibition";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	
	// 게시글 1개 가져오기
	public ExhibitionVO getReservationContent(int exIdx) {
		vo = new ExhibitionVO();
		try {
			sql = "select * from exhibition where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exIdx);
			rs = pstmt.executeQuery();
						
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setAuthor(rs.getString("author"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setEndDate(rs.getString("endDate"));
				vo.setAdultPrice(rs.getInt("adultPrice"));
				vo.setChildPrice(rs.getInt("childPrice"));
				vo.setPlace(rs.getString("place"));
				vo.setPoster(rs.getString("poster"));
				vo.setContent(rs.getString("content"));
				vo.setPart(rs.getString("part"));
				vo.setReCnt(rs.getInt("reCnt"));
			}			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}


	// 전시 등록하기
	public int setExhibitionInputOk(ExhibitionVO vo) {
		int res = 0;
		try {
			sql = "insert into exhibition values(default,?,?,?,?,?,?,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getAuthor());
			pstmt.setString(3, vo.getStartDate());
			pstmt.setString(4, vo.getEndDate());
			pstmt.setInt(5, vo.getAdultPrice());
			pstmt.setInt(6, vo.getChildPrice());
			pstmt.setString(7, vo.getPlace());
			pstmt.setString(8, vo.getPoster());
			pstmt.setString(9, vo.getContent());
			pstmt.executeUpdate();
			res = 1;			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

		
	
}
