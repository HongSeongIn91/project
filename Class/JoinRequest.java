package member.service;

import java.util.Map;

public class JoinRequest {

  // 회원 가입 기능을 구현할 때 필요한 요청 데이터를 보관하는 필드.
  private String id;
  private String name;
  private String password;
  private String confirmPassword;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getConfirmPassword() {
    return confirmPassword;
  }
  public void setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
  }

  // password 필드와 confirmPassword 필드 값이 같은지 검사
  public boolean isPasswordEqualToConfirm() {
    return password != null && password.equals(confirmPassword);
  }

  // 각 필드의 데이터가 유효한지 검사.
  // 값이 올바르지 않으면 파라미터로 전달받은 errors 맵 객체에 (키, TRUE) 쌍을 추가한다. 키는 어떤 에러가 발생했는지를 의미한다.
  public void validate(Map<String, Boolean> errors) {
    checkEmpty(errors, id, "id");
    checkEmpty(errors, name, "name");
    checkEmpty(errors, password, "password");
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
