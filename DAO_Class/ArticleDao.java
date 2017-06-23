package article.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import member.dao.JdbcUtil;
import article.model.Article;
import article.model.Writer;

public class ArticleDao {

  public Article insert(Connection conn, Article article) throws SQLException {
    PreparedStatement pstmt = null;
    Statement stmt = null;
    ResultSet rs = null;

    try{
      // INSERT 쿼리를 실행해서 article 테이블에 데이터를 삽입한다. article_no 칼럼은 시쿼스를 이용한 자동 증가 칼럼이다.
      pstmt=conn.prepareStatement(
          "insert into article "
          +"(article_no, writer_id, writer_name, title, regdate, moddate, read_cnt) "
          +"values (article_no_sequence.nextval, ?, ?, ?, ?, ?, 0)"
          );
      pstmt.setString(1, article.getWriter().getId());
      pstmt.setString(2, article.getWriter().getName());
      pstmt.setString(3, article.getTitle());
      pstmt.setTimestamp(4, toTimestamp(article.getRegDate()));
      pstmt.setTimestamp(5, toTimestamp(article.getModifiedDate()));
      int insertedCount = pstmt.executeUpdate();

      if (insertedCount > 0) {
        stmt = conn.createStatement();
        // article 테이블에 새롭게 추가한 행의 article_no 값을 구한다.
        rs = stmt.executeQuery("select ARTICLE_NO_SEQUENCE.CURRVAL from article");
        if(rs.next()) {
          // 신규 게시글의 번호를 newNum에 저장한다.
          Integer newNum = rs.getInt(1);
          // article 테이블에 추가한 데이터를 담은 Article 객체를 리턴한다.
          return new Article(
              newNum,
              article.getWriter(),
              article.getTitle(),
              article.getRegDate(),
              article.getModifiedDate(),
              0
              );
        }
      }
      return null;
    } finally {
      JdbcUtil.close(rs);
      JdbcUtil.close(stmt);
      JdbcUtil.close(pstmt);

    }
  }

  private Timestamp toTimestamp(Date date) {

    return new Timestamp(date.getTime());
  }
  
  // 전체 게시글 개수를 구하기 위한 selectCount() 메서드 추가
  public int selectCount(Connection conn) throws SQLException {
    Statement stmt = null;
    ResultSet rs = null;
    try{
      stmt = conn.createStatement();
      rs = stmt.executeQuery("select count(*) from article");
      if (rs.next()) {
        return rs.getInt(1);
      }
      return 0;
    } finally {
      JdbcUtil.close(rs);
      JdbcUtil.close(stmt);
    }
  }
  
  // 지정한 범위의 게시글을 읽어오기 위한 select() 메서드 추가
  public List<Article> select(Connection conn, int startRow, int size) throws SQLException {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      // 오라클 페이징 처리 참고
      pstmt = conn.prepareStatement(
          "SELECT * FROM ("
          + "SELECT ROWNUM AS rnum, A.* FROM ("
          + "SELECT * FROM ARTICLE ORDER BY ARTICLE_NO DESC"
          + ") A WHERE ROWNUM <= ?"
          + ") WHERE RNUM >= ?"
          );
      pstmt.setInt(1, startRow+size);
      pstmt.setInt(2, startRow);
      rs = pstmt.executeQuery();
      List<Article> result = new ArrayList<Article>();
      while (rs.next()) {
        result.add(convertArticle(rs));
      }
      return result;
    } finally {
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
    }
  }

  private Article convertArticle(ResultSet rs) throws SQLException {
    return new Article(rs.getInt("article_no"),
        new Writer(
            rs.getString("writer_id"),
            rs.getString("writer_name")),
        rs.getString("title"),
        toDate(rs.getTimestamp("regdate")),
        toDate(rs.getTimestamp("moddate")),
        rs.getInt("read_cnt")
        );

  }

  private Date toDate(Timestamp timestamp) {

    return new Date(timestamp.getTime());
  }
  
  // 특정 번호에 해당하는 게시글 데이터 읽기 기능을 구현한 selectById() 
  public Article selectById(Connection conn, int no) throws SQLException {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      pstmt = conn.prepareStatement(
          "select * from article where article_no = ?");
      pstmt.setInt(1, no);
      rs = pstmt.executeQuery();
      Article article = null;
      if(rs.next()) {
        article = convertArticle(rs);
      }
      return article;
    } finally {
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
    }
  }

  // 특정 번호에 해당하는 게시글 조회수 증가하기 기능을 구현한 increaseReadCount() 메서드 추가
  public void increaseReadCount(Connection conn, int no) throws SQLException {
    try (PreparedStatement pstmt = conn.prepareStatement(
        "update article set read_cnt = read_cnt + 1 "
        +"where article_no =?")) {
      pstmt.setInt(1, no);
      pstmt.executeUpdate();
    }
  }

  // 게시글 제목, 수정일자 수정 기능을 위한 update() 메서드 추가
  public int update(Connection conn, int no, String title) throws SQLException {
      try (PreparedStatement pstmt =
          conn.prepareStatement(
              "update article set title = ?, moddate = sysdate "
              + "where article_no = ?")) {
        pstmt.setString(1, title);
        pstmt.setInt(2, no);
        return pstmt.executeUpdate();
      }
    }
}
