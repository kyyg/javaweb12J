package exhibition;

public class ExhibitionVO {

	
	private int idx;
	private String title;
	private String author;
	private String startDate;
	private String endDate;
	private int price;
	private String place;
	private String poster;
	private String content;
	private String part;
	private int ReCnt;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getReCnt() {
		return ReCnt;
	}
	public void setReCnt(int reCnt) {
		ReCnt = reCnt;
	}
	@Override
	public String toString() {
		return "ExhibitionVO [idx=" + idx + ", title=" + title + ", author=" + author + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", price=" + price + ", place=" + place + ", poster=" + poster + ", content="
				+ content + ", part=" + part + ", ReCnt=" + ReCnt + "]";
	}
	

	
	
}
