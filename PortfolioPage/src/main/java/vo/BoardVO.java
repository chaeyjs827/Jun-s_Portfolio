package vo;

import java.sql.Date;

public class BoardVO {
	private int postIndex;
	private Date regiDate;
	private String title;
	private String startedDate;
	private String finishedDate;
	private String summary;
	private String content;
	private String gitUrl;
	private String serverUrl;
	private String projectType;
	private String careerCheck;
	private String thumnail;
	private String writer;
	private String usingSkill;

	@Override
	public String toString() {
		return "BoardVO [postIndex=" + postIndex + ", regiDate=" + regiDate + ", title=" + title + ", startedDate="
				+ startedDate + ", finishedDate=" + finishedDate + ", summary=" + summary + ", content=" + content
				+ ", gitUrl=" + gitUrl + ", serverUrl=" + serverUrl + ", projectType=" + projectType + ", careerCheck="
				+ careerCheck + ", thumnail=" + thumnail + ", writer=" + writer + ", usingSkill=" + usingSkill + "]";
	}

	public String getUsingSkill() {
		return usingSkill;
	}

	public void setUsingSkill(String usingSkill) {
		this.usingSkill = usingSkill;
	}

	public String getCareerCheck() {
		return careerCheck;
	}

	public void setCareerCheck(String careerCheck) {
		this.careerCheck = careerCheck;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getPostIndex() {
		return postIndex;
	}

	public void setPostIndex(int postIndex) {
		this.postIndex = postIndex;
	}

	public String getThumnail() {
		return thumnail;
	}

	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}

	public Date getRegiDate() {
		return regiDate;
	}

	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartedDate() {
		return startedDate;
	}

	public void setStartedDate(String startedDate) {
		this.startedDate = startedDate;
	}

	public String getFinishedDate() {
		return finishedDate;
	}

	public void setFinishedDate(String finishedDate) {
		this.finishedDate = finishedDate;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGitUrl() {
		return gitUrl;
	}

	public void setGitUrl(String gitUrl) {
		this.gitUrl = gitUrl;
	}

	public String getServerUrl() {
		return serverUrl;
	}

	public void setServerUrl(String serverUrl) {
		this.serverUrl = serverUrl;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public String getMemberCheck() {
		return careerCheck;
	}

	public void setMemberCheck(String memberCheck) {
		this.careerCheck = memberCheck;
	}

}
