package Member_model;

public class MemberBean {
	
	private String id;
	private String pwd;
	private String email;
	private String name;
	private String member_key;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMember_Key() {
		return member_key;
	}
	public void setMember_Key(String key) {
		this.member_key = key;
	}
}
