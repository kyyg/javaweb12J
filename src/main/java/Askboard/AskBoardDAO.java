package Askboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class AskBoardDAO {
	// 싱클톤으로 선언된 DB연결객체(GetConn)을 연결한다.
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	AskBoardVO vo = null;

	// 게시글 전체 조회처리
	public ArrayList<AskBoardVO> getBoardList(int startIndexNo, int pageSize) {
		ArrayList<AskBoardVO> vos = new ArrayList<>();
		try {
			// sql = "select * from board order by idx desc limit ?,?";
//			sql = "select *,datediff(wDate, now()) as day_diff,timestampdiff(hour, wDate, now()) as hour_diff from"
//					+ " board order by idx desc limit ?,?";
			sql = "select *, datediff(wDate, now()) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff, "
					+ "(select count(*) from askBoardReply where askBoardIdx=b.idx) as replyCount "
					+ "from askBoard b order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new AskBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vo.setReadNum(rs.getInt("readNum"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDay_diff(rs.getInt("day_diff"));
				
				vo.setReplyCount(rs.getInt("replyCount"));;
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 게시글 저장하기
	public int setBoardInputOk(AskBoardVO vo) {
		int res = 0;
		try {
			sql = "insert into askBoard values (default,?,?,?,?,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 전체 레코드 건수 구하기
	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from askBoard";
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

	// 게시글 1건 가져오기.
	public AskBoardVO getAskBoardContent(int idx) {
		AskBoardVO vo = new AskBoardVO();
		try {
			sql = "select * from askBoard where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setNickName(rs.getString("nickName"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setOpenSw(rs.getString("openSw"));
			vo.setwDate(rs.getString("wDate"));
			vo.setGood(rs.getInt("good"));
			vo.setReadNum(rs.getInt("readNum"));
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 조회수
	public void setReadNumUpdate(int idx) {
		try {
			sql = "update askBoard set readNum = readNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 좋아요 1 증가시키기
	public void setGoodUpdate(int idx) {
		try {
			sql = "update askBoard set good = good + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	// 좋아요 증가/감소..
	public void setGoodPlusMinus(int idx, int goodCnt) {
		try {
			sql = "update askBoard set good = (good + ?) where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodCnt);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public AskBoardVO getPreNextSearch(int idx, String str) {
		vo = new AskBoardVO();
		try {
			if(str.equals("preVo")) {
				sql = "select idx,title from askBoard where idx < ? order by idx desc limit 1"; /* 이전글 */
			}
			else {
				sql = "select idx,title from askBoard where idx > ? limit 1;";  /* 다음글 처리 */
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(str.equals("preVo") && rs.next()) {
				vo.setPreIdx(rs.getInt("idx"));
				vo.setPreTitle(rs.getString("title"));
			}
			else if(str.equals("nextVo") && rs.next()) {
				vo.setNextIdx(rs.getInt("idx"));
				vo.setNextTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 검색기 자료검색 처리
	public ArrayList<AskBoardVO> getBoardContentSearch(String search, String searchString) {
		ArrayList<AskBoardVO> vos = new ArrayList<>();
		try {
			sql = "select * from askBoard where "+search+" like ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new AskBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vo.setReadNum(rs.getInt("readNum"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	// 게시글 삭제처리
	public int setBoardDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from askBoard where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 게시글 수정처리
	public int setBoardUpdateOk(AskBoardVO vo) {
		int res = 0;
		try {
			System.out.println("vo(updateOk) : " + vo);
			sql = "update askBoard set title=?, content=?, openSw=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getOpenSw());
			pstmt.setInt(4, vo.getIdx());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 댓글 입력하기
	public String setReplyInputOk(AskBoardReplyVO askReplyVo) {
		String res = "0";
		try {
			sql = "insert into askBoardReply values (default,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, askReplyVo.getAskBoardIdx());
			pstmt.setString(2, askReplyVo.getMid());
			pstmt.setString(3, askReplyVo.getNickName());
			pstmt.setString(4, askReplyVo.getContent());
			pstmt.executeUpdate();
			res = "1";
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 부모글에 해당하는 댓글 내역 가져오기
	public ArrayList<AskBoardReplyVO> getAskBoardReply(int idx) {
		ArrayList<AskBoardReplyVO> replyVos = new ArrayList<>();
		try {
			sql = "select * from askBoardReply where askBoardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AskBoardReplyVO replyVo = new AskBoardReplyVO();
				replyVo.setIdx(rs.getInt("idx"));
				replyVo.setAskBoardIdx(idx);
				replyVo.setMid(rs.getString("mid"));
				replyVo.setNickName(rs.getString("nickName"));
				replyVo.setwDate(rs.getString("wDate"));
				replyVo.setContent(rs.getString("content"));
				
				replyVos.add(replyVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return replyVos;
	}

	// 댓글 삭제하기
	public String setReplyDeleteOk(int replyIdx) {
		String res = "0";
		try {
      sql = "delete from askBoardReply where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, replyIdx);
      pstmt.executeUpdate();
      res = "1"; 
    } catch (SQLException e) {
       System.out.println("SQL 오류 : " + e.getMessage());
    } finally {
       getConn.pstmtClose();
    }
		return res;
	}

	// 본인이 쓴 게시글 전체 건수 구하기
	public int getTotRecCntMember(String mid) {
		int totRecCnt = 0;
		try {
			sql = "select count(idx) as cnt from askBoard where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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

	// 로그인 사용자가 올린 전체 게시글 가져오기
	public ArrayList<AskBoardVO> getBoardSearchMember(int startIndexNo, int pageSize, String mid) {
		ArrayList<AskBoardVO> vos = new ArrayList<>();
		try {
			sql = "select *, datediff(wDate, now()) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff, "
					+ "(select count(*) from askBoardReply where askBoardIdx=b.idx) as replyCount "
					+ "from askBoard b where mid = ? order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new AskBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDay_diff(rs.getInt("day_diff"));
				
				vo.setReplyCount(rs.getInt("replyCount"));
				
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
