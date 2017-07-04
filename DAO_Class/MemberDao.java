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
		      pstmt = conn.prepareStatement("select * from member where m_id=?");
		      pstmt.setString(1, id);
		      rs = pstmt.executeQuery();
		      Member member = null;
		      // 데이터가 존재하면 member 객체를 생성하고 조회된 값을 저장한다.
		      if(rs.next()){
		        member = new Member(
		            rs.getString("m_id"),
		            rs.getString("m_pw"),
		            rs.getString("m_regnum"),
		            rs.getString("m_email"),
		            rs.getString("m_phone"),
		            toDate(rs.getTimestamp("m_regdate"))
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

	public void insert(Connection conn, Member mem) throws SQLException {
		try (PreparedStatement pstmt =
				conn.prepareStatement("insert into member values(?,?,?,?,?,?)")) {
			pstmt.setString(1, mem.getM_id());
			pstmt.setString(2, mem.getM_pw());
			pstmt.setString(3, mem.getM_regnum());
			pstmt.setString(4, mem.getM_email());
			pstmt.setString(5, mem.getM_phone());
			pstmt.setTimestamp(6, new Timestamp(mem.getM_regDate().getTime()));
			pstmt.executeUpdate();
		}
	}
	
	public static void update(Connection conn, Member member) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update member set m_pw = ?, m_email = ?, m_phone = ? where m_id =?")) {
			pstmt.setString(1, member.getM_pw());
			pstmt.setString(2, member.getM_email());
			pstmt.setString(3, member.getM_phone());
			pstmt.setString(4, member.getM_id());
			pstmt.executeUpdate();
		}
	}
}
