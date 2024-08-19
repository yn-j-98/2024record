package join;

public class JoinBean {
	
	private String id;
	private String password;
	private String message;
	
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}	
	
	
	public void validate() {
        
        
        if ("teemo".equals(id)) {
            message = "<p>이미 있는 아이디입니다.</p>";
            return;
        }
        
        message = "<p>회원가입 성공!</p>";
    }
}
