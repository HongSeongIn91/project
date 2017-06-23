package article.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import Connection.DBConnection;
import article.dao.ArticleConentDao;
import article.dao.ArticleDao;
import article.model.Article;
import article.model.ArticleContent;

public class ReadArticleService {

  private ArticleDao articleDao = new ArticleDao();
  private ArticleConentDao contentDao = new ArticleConentDao();

  public ArticleData getArticle(int articleNum, boolean increaseReadCount) throws ClassNotFoundException, NamingException {
    try (Connection conn = DBConnection.getConnection()) {
      // article 테이블에서 지정한 번호의 Article 객체를 구한다.
      Article article = articleDao.selectById(conn, articleNum);
      if (article == null) {
        throw new ArticleNotFoundException();
      }
      // article_content 테이블에서 지정한 번호의 Article 객체를 구한다.
      ArticleContent content = contentDao.selectById(conn, articleNum);
      if (content == null) {
        throw new ArticleContentNotFoundException();
      }
      // increaseReadCount가 true이면, 조회수를 증가시킨다.
      if (increaseReadCount) {
        articleDao.increaseReadCount(conn, articleNum);
      }
      // ArticleData 객체를 리턴한다.
      return new ArticleData(article, content);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
}
