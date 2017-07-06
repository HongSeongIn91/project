package member.model;

import java.util.Date;

public class Member {

	private String m_id;
	private String m_pw;
	private String m_regnum;
	private String m_email;
	private String m_phone;
	private Date m_regDate;
	
	public Member(String m_id, String m_pw, String m_regnum, String m_email, String m_phone, Date m_regDate) {
		this.m_id=m_id;
		this.m_pw=m_pw;
		this.m_regnum=m_regnum;
		this.m_email = m_email;
		this.m_phone = m_phone;
		this.m_regDate=m_regDate;
	}
	
	public String getM_id() {
		return m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public String getM_regnum() {
		return m_regnum;
	}

	public String getM_email() {
		return m_email;
	}

	public String getM_phone() {
		return m_phone;
	}

	public Date getM_regDate() {
		return m_regDate;
	}

	public boolean matchPassword(String pwd) {
		return m_pw.equals(pwd);
	}
	
  // 회원정보 변경 기능 구현할 때 사용
	public void changePassword(String newPwd) {
		this.m_pw = newPwd;
	}

	public void changeEmail(String newEmail) {

		this.m_email = newEmail;
	}

	public void changePhone(String newPhone) {

		this.m_phone = newPhone;
	}
	
}
