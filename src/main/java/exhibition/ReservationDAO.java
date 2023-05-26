package exhibition;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
public class ReservationDAO {

	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";

	ReservationVO vo = null;

	
	// 예약하기
	public int setReservation(int exIdx, String mid, String reNum, String reDate, int peopleNum, int totalPrice, String confirmDate, String title) {
		int res=0;
		try {
			sql = "insert into reservation values (default,?,?,?,?,default,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reNum);
			pstmt.setInt(2, exIdx);
			pstmt.setString(3, title);
			pstmt.setString(4, mid);
			pstmt.setString(5, reDate);
			pstmt.setInt(6, peopleNum);
			pstmt.setInt(7, totalPrice);
			pstmt.setString(8, confirmDate);
			
			pstmt.executeUpdate();	
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		}
		finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 예약 정보 1건 가져오기
	public ReservationVO getReservationInfo(int exIdx) {
		vo = new ReservationVO();
		try {
			sql = "select * from reservation where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exIdx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setReNum(rs.getString("reNum"));
				vo.setExIdx(rs.getInt("exIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setMid(rs.getString("mid"));
				vo.setwDate(rs.getString("wDate"));
				vo.setReDate(rs.getString("reDate"));
				vo.setPeopleNum(rs.getInt("peopleNum"));
				vo.setTotalPrice(rs.getInt("totalPrice"));
				vo.setConfirm(rs.getString("confirm"));
				vo.setConfirmDate(rs.getString("confirmDate"));	
			}	
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		}
		  finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 아이디로 예약전시목록 가져오기
	public ArrayList<ReservationVO> getReservationList(String mid) {
		ArrayList<ReservationVO> vos = new ArrayList<>();
		try {
			sql = "select * from reservation where mid=? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ReservationVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setReNum(rs.getString("reNum"));
				vo.setExIdx(rs.getInt("exIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setMid(rs.getString("mid"));
				vo.setwDate(rs.getString("wDate"));
				vo.setReDate(rs.getString("reDate"));
				vo.setPeopleNum(rs.getInt("peopleNum"));
				vo.setTotalPrice(rs.getInt("totalPrice"));
				vo.setConfirm(rs.getString("confirm"));
				vo.setConfirmDate(rs.getString("confirmDate"));	
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		}
		  finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 예약 취소하기
	public String setReservationCalcel(int idx) {
		String res = "0";
		try {
			sql = "delete from reservation where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,idx);
			pstmt.executeUpdate();
			res = "1";			
		} catch (SQLException e) {
			System.out.println("SQL에러 : " + e.getMessage());
		}
		  finally {
			getConn.pstmtClose();
		}
		return res;
	}

	
	//총 레코드 건수 구하기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from reservation";
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
	
	// 페이징~ 예약 목록 가져오기
	public ArrayList<ReservationVO> getReservationList(int startIndexNo, int pageSize) {
		ArrayList<ReservationVO> vos = new ArrayList<>();
		try {
			sql = "select * from reservation order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ReservationVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setReNum(rs.getString("reNum"));
				vo.setExIdx(rs.getInt("exIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setMid(rs.getString("mid"));
				vo.setwDate(rs.getString("wDate"));
				vo.setReDate(rs.getString("reDate"));
				vo.setPeopleNum(rs.getInt("peopleNum"));
				vo.setTotalPrice(rs.getInt("totalPrice"));
				vo.setConfirm(rs.getString("confirm"));
				vo.setConfirmDate(rs.getString("confirmDate"));	
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	
	
	
	
}
