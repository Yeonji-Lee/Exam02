package dto;

public class MemberDTO {
	private String name;
	private String msg;
	
	
	public MemberDTO(String name, String msg) {
		super();
		this.name = name;
		this.msg = msg;
	}
	public MemberDTO() {
		super();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
