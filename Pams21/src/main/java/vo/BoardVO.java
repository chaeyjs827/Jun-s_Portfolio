package vo;

import java.sql.Date;

public class BoardVO {
	private int postIndex;
	private String postTitle;
	private String postType;
	private String postWriter;
	private Date postRegiDate;
	private String postFile;
	private String postContent;
	private int postHits;
	private String boardType; // 테이블 쿼리때문에

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getPostIndex() {
		return postIndex;
	}

	public void setPostIndex(int postIndex) {
		this.postIndex = postIndex;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostType() {
		return postType;
	}

	public void setPostType(String postType) {
		this.postType = postType;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public Date getPostRegiDate() {
		return postRegiDate;
	}

	public void setPostRegiDate(Date postRegiDate) {
		this.postRegiDate = postRegiDate;
	}

	public String getPostFile() {
		return postFile;
	}

	public void setPostFile(String postFile) {
		this.postFile = postFile;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getPostHits() {
		return postHits;
	}

	public void setPostHits(int postHits) {
		this.postHits = postHits;
	}

	@Override
	public String toString() {
		return "BoardVO [postIndex=" + postIndex + ", postTitle=" + postTitle + ", postType=" + postType
				+ ", postWriter=" + postWriter + ", postRegiDate=" + postRegiDate + ", postFile=" + postFile
				+ ", postContent=" + postContent + ", postHits=" + postHits + ", boardType=" + boardType + "]";
	}

}
