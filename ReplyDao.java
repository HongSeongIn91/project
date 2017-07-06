package myUpload.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import member.dao.JdbcUtil;
import reply.model.Reply;

public class ReplyDao {
	public int selectCount(Connection conn, String rp_m_id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement("select count(*) from review_reply where rp_m_id=?");
			pstmt.setString(1, rp_m_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public List<Reply> select(Connection conn, int startRow, int size, String rp_m_id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"SELECT * FROM ("
					+ "SELECT ROWNUM AS rnum, A.* FROM ("
					+ "SELECT * FROM REVIEW_REPLY WHERE RP_M_ID= ? ORDER BY RP_NUM DESC"
					+ ") A WHERE ROWNUM <= ?"
					+ ") WHERE RNUM >= ?"
					);
			
			pstmt.setString(1, rp_m_id);
			pstmt.setInt(2, startRow+size);
			pstmt.setInt(3, startRow);
			
			
			rs = pstmt.executeQuery();
			List<Reply> result = new ArrayList<Reply>();
			while(rs.next()) {
				result.add(convertReply(rs));
			}
			
			return result;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private Reply convertReply(ResultSet rs) throws SQLException {
		return new Reply(rs.getInt("rp_num"),
						  rs.getInt("rp_rv_num"),
						  rs.getString("rp_m_id"),
						  toDate(rs.getTimestamp("rp_regdate")),
						  rs.getString("rp_content")
						  );
	}
	
private static Date toDate(Timestamp timestamp) {
		
		return new Date(timestamp.getTime());
	}
	
}
