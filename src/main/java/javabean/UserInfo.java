package javabean;

public class UserInfo {
	private int id;
    private String name;
    private String studentId;
    private String major;
    private String phone;

    public int getid() {
    	return id;
    }

    public void setid(int id) {
        this.id = id;
    }
    public String getName() {
    	return name;
    }
    public void setName(String name) {
    	this.name=name;
    }
    public String getStudentId() {
    	return studentId;
    }
    public void setStudentId(String studentId) {
    	this.studentId=studentId;
    }
    public String getMajor() {
    	return major;
    }
    public void setMajor(String major) {
    	this.major=major;
    }
    public String getPhone() {
    	return phone;
    }
    public void setPhone(String phone) {
    	this.phone=phone;
    }
}

