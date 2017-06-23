package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import Connection.DBConnection;
import member.dao.JdbcUtil;
import member.dao.MemberDao;
import member.model.Member;

public class ChangePasswordService {

  private MemberDao memberDao = new MemberDao();

  // 비밀번호 변경 기능을 구현한다. userId는 비밀번호를 변경할 회원 아이디, curPwd는 현재 비밀번호, newPwd는 신규 비밀번호를 의미한다.
  public void changePassword(String userId, String curPwd, String newPwd) throws ClassNotFoundException, NamingException {
    Connection conn = null;
    try {
      conn = DBConnection.getConnection();
      conn.setAutoCommit(false);

      // userId에 해당하는 Member 객체의 데이터를 구한다.
      Member member = MemberDao.selectById(conn, userId);
      // 회원 데이터가 존재하지 않으면 MemberNotFoundException을 발생시킨다.
      if (member == null) {
        throw new MemberNotFoundException();
      }
      // curPwd가 회원의 실제 비밀번호와 일치하지 않으면 InvalidPasswordException을 발생시킨다.
      if (!member.matchPassword(curPwd)) {
        throw new InvalidPasswordException();
      }
      // member 객체의 비밀번호를 변경한다.
      member.changePassword(newPwd);
      // 변경한 비밀번호를 MemberDao를 이용해 DB의 member 테이블에 반영한다.
      MemberDao.update(conn, member);
      conn.commit();
    } catch (SQLException e) {
      JdbcUtil.rollback(conn);
      throw new RuntimeException(e);
    } finally {
      JdbcUtil.close(conn);
    }
  }
}
