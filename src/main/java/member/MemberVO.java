package member;

public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String name;
	private String tel;
	private String email;
	private String userDel;
	private int point;
	private int level;
	private int visitCnt;
	private String startDate;
	private String lastDate;
	private int todayCnt;
	private String salt;
	
	private int deleteDiff;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserDel() {
		return userDel;
	}

	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getVisitCnt() {
		return visitCnt;
	}

	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public int getTodayCnt() {
		return todayCnt;
	}

	public void setTodayCnt(int todayCnt) {
		this.todayCnt = todayCnt;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public int getDeleteDiff() {
		return deleteDiff;
	}

	public void setDeleteDiff(int deleteDiff) {
		this.deleteDiff = deleteDiff;
	}

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", nickName=" + nickName + ", name=" + name
				+ ", tel=" + tel + ", email=" + email + ", userDel=" + userDel + ", point=" + point + ", level=" + level
				+ ", visitCnt=" + visitCnt + ", startDate=" + startDate + ", lastDate=" + lastDate + ", todayCnt=" + todayCnt
				+ ", salt=" + salt + ", deleteDiff=" + deleteDiff + "]";
	}
	
	
}
