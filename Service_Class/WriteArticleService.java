package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import member.dao.JdbcUtil;
import Connection.DBConnection;
import article.dao.ArticleConentDao;
import article.dao.ArticleDao;
import article.model.Article;
import article.model.ArticleContent;

public class WriteArticleService {

  private ArticleDao articleDao = new ArticleDao();
  private ArticleConentDao contentDao = new ArticleConentDao();

  // write() 메서드는 WriteRequest 타입의 req 파라미터를 이용해서 게시글을 등록하고, 결과로 게시글 번호를 리턴한다.
  public Integer write(WriteRequest req) throws ClassNotFoundException, NamingException {
    Connection conn = null;

    try {
      conn = DBConnection.getConnection();
      // 트랜잭션을 시작한다.
      conn.setAutoCommit(false);

      // WriteRequest로부터 Article 객체를 생성한다. insert 쿼리를 실행해야 id를 알 수 있으므로 toArticle() 메서드에서 Article 객체를 생성할 때 number 값으로 null을 전달한다.
      Article article = toArticle(req);
      // ArticleDao의 insert() 메서드를 실행하고, 그 결과를 savedArticle에 할당한다. 데이터를 삽입한 경우 savedArticle은 null이 아니고, article 테이블에 추가한 데이터의 주요 키 값을 number 값으로 갖는다.
      Article savedArticle = articleDao.insert(conn, article);
      if(savedArticle == null) {
        throw new RuntimeException("fail to insert article");
      }

      // ArticleContent 객체를 생성한다. SavedArticle의 게시글 번호를 사용한다. 즉, savedArticle 객체에서 삽입한 데이터와 동일한 번호를 값으로 갖는 ArticleContent 객체를 생성한다.
      ArticleContent content = new ArticleContent(
          savedArticle.getNumber(), req.getContent());
      // ArticleContentDao의 insert() 메서드를 실행해서 article_content 테이블에 데이터를 삽입한다.
      ArticleContent savedContent = contentDao.insert(conn, content);
      if(savedContent == null) {
        throw new RuntimeException("fail to insert article_content");
      }

      conn.commit();

      // 새로 추가한 게시글 번호를 리턴한다.
      return savedArticle.getNumber();
    } catch (SQLException e) {
      JdbcUtil.rollback(conn);
      throw new RuntimeException(e);
    } catch (RuntimeException e) {
      JdbcUtil.rollback(conn);
      throw e;
    } finally {
      JdbcUtil.close(conn);
    }
  }

  private Article toArticle(WriteRequest req) {
    Date now = new Date();
    return new Article(null, req.getWriter(), req.getTitle(), now, now, 0);
  }
}
