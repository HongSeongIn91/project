package article.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import Connection.DBConnection;
import article.dao.ArticleDao;
import article.model.Article;

public class ListArticleService {

  private ArticleDao articleDao = new ArticleDao();
  private int size = 10;

  public ArticlePage getArticlepPage(int pageNum) throws ClassNotFoundException, NamingException {
    try (Connection conn = DBConnection.getConnection()) {
      // 전체 게시글의 개수를 구한다
      int total = articleDao.selectCount(conn);
      // pageNum에 해당하는 게시글 목록을 구한다. articleDao.select() 메서드의 두 번째 파라미터는 조회할 레코드의 시작 행이다. 
      List<Article> content = articleDao.select(conn, (pageNum-1)*size, size);
      // ArticlePage 객체를 리턴한다
      return new ArticlePage(total, pageNum, size, content);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

}
