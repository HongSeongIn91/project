package article.service;

import java.util.List;

import article.model.Article;

public class ArticlePage {

  private int total; // 전체 게시글의 개수
  private int currentPage; // 사용자가 요청한 페이지 번호
  private List<Article> content; // 화면에 출력할 게시글 목록
  private int totalPages; // 전체 페이지 개수
  private int startPage; // 화면 하단의 페이지 이동 링크의 시작 번호
  private int endPage; // 화면 하단의 페이지 이동 링크의 끝 번호

  public ArticlePage(int total, int currentPage, int size, List<Article> content) {
    this.total = total;
    this.currentPage = currentPage;
    this.content = content;
    // 게시글 개수가 0개일 때
    if(total == 0) {
      totalPages = 0;
      startPage = 0;
      endPage = 0;
    } else {
      // 한 페이지에 보여줄 게시글 개수를 size로 전달받는다. 게시글 개수를 size로 나눈 값을 페이지 개수로 사용한다.
      totalPages = total/size;
      // 게시글 개수를 size로 나눈 나머지가 0보다 크면 페이지 수를 1 증가한다.
      if(total % size > 0) {
        totalPages++;
      }
      // 화면 하단에 보여줄 페이지의 이동 링크의 시작 페이지 번호를 구한다.
      int modVal = currentPage % 5;
      startPage = currentPage / 5 * 5 + 1;
      if (modVal == 0) startPage -= 5;

      // 화면 하단에 보여줄 페이지의 이동 링크의 끝 페이지 번호를 구한다.
      endPage = startPage + 4;
      if (endPage > totalPages) endPage = totalPages;
    }
  }

  public int getTotal() {
    return total;
  }

  public boolean hasNoArticles() {
    return total == 0;
  }

  public boolean hasArticles() {
    return total > 0;
  }

  public int getCurrentPage() {
    return currentPage;
  }

  public List<Article> getContent() {
    return content;
  }

  public int getTotalPages() {
    return totalPages;
  }

  public int getStartPage() {
    return startPage;
  }

  public int getEndPage() {
    return endPage;
  }

}
