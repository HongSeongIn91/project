package member.service;

import java.util.Map;

public class JoinRequest {
	
	// 회원 가입 기능을 구현할 때 필요한 요청 데이터를 보관하는 필드.
	private String m_id;
	private String m_pw;
	private String m_regnum;
	private String m_email;
	private String m_phone;
	private String confirmPassword;
	
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_regnum() {
		return m_regnum;
	}

	public void setM_regnum(String m_regnum) {
		this.m_regnum = m_regnum;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	// password 필드와 confirmPassword 필드 값이 같은지 검사
	public boolean isPasswordEqualToConfirm() {
		return m_pw != null && m_pw.equals(confirmPassword);
	}
	
	// 각 필드의 데이터가 유효한지 검사.
	// errors 맵 객체는 에러 정보를 담기 위해 사용.
	public void validate(Map<String, Boolean> errors) {
		checkEmpty(errors, m_id, "m_id");
		checkEmpty(errors, m_pw, "m_pw");
		checkEmpty(errors, m_regnum, "m_regnum");
		checkEmpty(errors, m_email, "m_email");
		checkEmpty(errors, m_phone, "m_phone");
		checkEmpty(errors, confirmPassword, "confirmPassword");
		if(!errors.containsKey("confirmPassword")) {
			if(!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
		
	}

	// value가 값이 없는 경우 errors 맵 객체의 fieldName 키에 TRUE를 값으로 추가
	private void checkEmpty(Map<String, Boolean> errors, String value,
			String fieldName) {
		if (value == null || value.isEmpty())
			errors.put(fieldName, Boolean.TRUE);
		
	}
}
