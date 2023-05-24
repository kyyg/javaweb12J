package Askboard;

public class AskBoardReplyVO {
	private int idx;
	private int askBoardIdx;
	private String mid;
	private String nickName;
	private String wDate;
	private String content;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getAskBoardIdx() {
		return askBoardIdx;
	}
	public void setAskBoardIdx(int askBoardIdx) {
		this.askBoardIdx = askBoardIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "AskBoardReplyVO [idx=" + idx + ", askBoardIdx=" + askBoardIdx + ", mid=" + mid + ", nickName=" + nickName
				+ ", wDate=" + wDate + ", content=" + content + "]";
	}
	
	
}
