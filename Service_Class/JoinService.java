package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import Connection.DBConnection;
import member.dao.JdbcUtil;
import member.dao.MemberDao;
import member.model.Member;

public class JoinService {

  private static MemberDao memberDao = new MemberDao();

  public static void join(JoinRequest joinReq) throws ClassNotFoundException, NamingException {
    Connection conn = null;
    try {
      // 커넥션 풀로부퍼 커넥션을 구하고 트랜잭션을 시작.
      conn = DBConnection.getConnection();
      conn.setAutoCommit(false);

      // MemberDao.selectById()를 이용해서 joinReq.getId()에 해당하는 회원 데이터를 구한다
      Member member = MemberDao.selectById(conn, joinReq.getId());
      // 만약 ID에 해당하는 데이터가 이미 존재하면, 트랜잭션을 롤백하고 DuplicateIdException을 발생시킨다.
      if(member != null) {
        JdbcUtil.rollback(conn);
        throw new DuplicateIdException();
      }

      // joinReq를 이용해서 Member 객체를 생성하고, memberDao.insert를 실행해서 회원 데이터를 테이블에 삽입
      memberDao.insert(conn, 
          new Member(
              joinReq.getId(), 
              joinReq.getName(), 
              joinReq.getPassword(), 
              new Date())
          );
      // 트랜잭션 커밋
      conn.commit();

      // 처리 도중 SQLException이 발생하면 트랜잭션을 롤백하고, RuntimeException을 발생시킨다.
    } catch (SQLException e) {
      JdbcUtil.rollback(conn);
      throw new RuntimeException(e);
    } finally {
      JdbcUtil.close(conn);
    }
  }
}
