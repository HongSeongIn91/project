package auth.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import Connection.DBConnection;
import member.dao.MemberDao;
import member.model.Member;

public class LoginService {

  private static MemberDao memberDao = new MemberDao();

  public static User login(String id, String password) throws ClassNotFoundException, NamingException {
    try (Connection conn = DBConnection.getConnection()) {
      // MemberDao를 이용해서 아이디에 해당하는 회원 데이터가 존재하는지 확인한다. 
      Member member = memberDao.selectById(conn, id);
      // 회원 데이터가 존재하지 않거나 암호가 일치하지 않으면 LoginFailException을 발생시킨다.
      if(member == null) {
        throw new LoginFailException();
      }
      if(!member.matchPassword(password)) {
        throw new LoginFailException();
      }
      // 회원 아이디와 이름을 담은 User 객체를 생성해서 리턴한다.
      return new User(member.getId(), member.getName());
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
