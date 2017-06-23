package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import member.model.Member;

public class MemberDao {

  public static Member selectById(Connection conn, String id) throws SQLException {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      // member 테이블에서 memberid 칼럼 값이 id 파라미터와 동일한 데이터를 조회한다.
      pstmt = conn.prepareStatement("select * from member where memberid=?");
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      Member member = null;
      // 데이터가 존재하면 member 객체를 생성하고 조회된 값을 저장한다.
      if(rs.next()){
        member = new Member(
            rs.getString("memberid"),
            rs.getString("name"),
            rs.getString("password"),
            toDate(rs.getTimestamp("regdate"))
            );
      }
      return member;
    } finally {
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
    }
  }

  private static Date toDate(Timestamp date) {
    return date == null ? null : new Date(date.getTime());
  }

  // member 테이블에 데이터를 추가한다.
  public void insert(Connection conn, Member mem) throws SQLException {
    try (PreparedStatement pstmt =
        conn.prepareStatement("insert into member values(?,?,?,?)")) {
      pstmt.setString(1, mem.getId());
      pstmt.setString(2, mem.getName());
      pstmt.setString(3, mem.getPassword());
      pstmt.setTimestamp(4, new Timestamp(mem.getRegDate().getTime()));
      pstmt.executeUpdate();
    }
  }

  public static void update(Connection conn, Member member) throws SQLException {
  try (PreparedStatement pstmt = conn.prepareStatement(
      "update member set name = ?, password = ? where memberid =?")) {
    pstmt.setString(1, member.getName());
    pstmt.setString(2, member.getPassword());
    pstmt.setString(3, member.getId());
    pstmt.executeUpdate();
  }
}

}
