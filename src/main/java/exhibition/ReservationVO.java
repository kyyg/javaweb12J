package exhibition;

public class ReservationVO {

	private int idx;
	private String reNum;
	private int exIdx;
	private String mid;
	private String title;
	private String wDate;
	private String reDate;
	private int peopleNum;
	private int totalPrice;
	private String confirm;
	private String confirmDate;
	private int reCnt;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getReNum() {
		return reNum;
	}
	public void setReNum(String reNum) {
		this.reNum = reNum;
	}
	public int getExIdx() {
		return exIdx;
	}
	public void setExIdx(int exIdx) {
		this.exIdx = exIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getReDate() {
		return reDate;
	}
	public void setReDate(String reDate) {
		this.reDate = reDate;
	}
	public int getPeopleNum() {
		return peopleNum;
	}
	public void setPeopleNum(int peopleNum) {
		this.peopleNum = peopleNum;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getConfirmDate() {
		return confirmDate;
	}
	public void setConfirmDate(String confirmDate) {
		this.confirmDate = confirmDate;
	}
	public int getReCnt() {
		return reCnt;
	}
	public void setReCnt(int reCnt) {
		this.reCnt = reCnt;
	}
	@Override
	public String toString() {
		return "ReservationVO [idx=" + idx + ", reNum=" + reNum + ", exIdx=" + exIdx + ", mid=" + mid + ", title=" + title
				+ ", wDate=" + wDate + ", reDate=" + reDate + ", peopleNum=" + peopleNum + ", totalPrice=" + totalPrice
				+ ", confirm=" + confirm + ", confirmDate=" + confirmDate + ", reCnt=" + reCnt + "]";
	}
	

	
}
