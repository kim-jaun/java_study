package ch13.dao;
public class PdsItem {
	private int id;     // 입력한 순서, 자동으로 1씩 증가
	private String fileName; // 파일명
	private int fileSize;    // 파일크기
	private String description; // 파일 설명
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}