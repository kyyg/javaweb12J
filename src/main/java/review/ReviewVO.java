package review;

public class ReviewVO {
	private int idx;
	private int reIdx;
	private String mid;
	private String title;
	private String content;
	private String wDate;
	private String pwd;
	private String photo;
	
	private int day_diff;		// 새글처리를 위한 변수
	private int hour_diff;	// 새글처리를 위한 변수
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getReIdx() {
		return reIdx;
	}
	public void setReIdx(int reIdx) {
		this.reIdx = reIdx;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getDay_diff() {
		return day_diff;
	}
	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
	@Override
	public String toString() {
		return "ReviewVO [idx=" + idx + ", reIdx=" + reIdx + ", mid=" + mid + ", title=" + title + ", content=" + content
				+ ", wDate=" + wDate + ", pwd=" + pwd + ", photo=" + photo + ", day_diff=" + day_diff + ", hour_diff="
				+ hour_diff + "]";
	}
	

	
	
}
