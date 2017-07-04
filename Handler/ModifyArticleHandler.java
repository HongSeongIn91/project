package article.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.ModifyArticleService;
import article.service.ModifyRequest;
import article.service.PermissionDeniedException;
import article.service.ReadArticleService;
import auth.service.User;
import mvc.command.CommandHandler;

public class ModifyArticleHandler implements CommandHandler {

  private static final String FORM_VIEW = "/WEB-INF/view/modifyForm.jsp";

  private ReadArticleService readService = new ReadArticleService();
  private ModifyArticleService modifyService = new ModifyArticleService(); 

  @Override
  public String process(HttpServletRequest req, HttpServletResponse res)
      throws Exception {
    if (req.getMethod().equalsIgnoreCase("GET")) {
      return processForm(req, res);
    } else if(req.getMethod().equalsIgnoreCase("POST")) {
      return processSubmit(req, res);
    } else {
      res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
      return null;
    }
  }
  // POST 방식. 폼 전송을 처리한다.
  private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, NamingException, IOException {
    // 현재 로그인한 사용자 정보를 구한다.
    User authUser = (User)req.getSession().getAttribute("authUser");
    String noVal = req.getParameter("articleNumber");
    int no = Integer.parseInt(req.getParameter("noVal"));
    /*System.out.println(noVal);
    int no = Integer.parseInt(noVal);
    System.out.println(no);*/
   

    // 요청 파라미터와 현재 사용자 정보를 이용해서 ModifyRequest 객체를 생성한다.
    ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, req.getParameter("title"), req.getParameter("content"));
    // ModifyRequest 객체를 request의 modReq 속성에 저장한다.
    req.setAttribute("modReq", modReq);

    // 에러 정보를 담을 맵 객체를 생성하고, 78행에서 ModifyRequest 객체가 유효한지 검사한다. 유효하지 않은 데이터가 존재하면 다시 폼을 보여준다.
    Map<String, Boolean> errors = new HashMap<String, Boolean>();
    req.setAttribute("errors", errors);
    modReq.validate(errors);
    if(!errors.isEmpty()) {
      return FORM_VIEW;
    }
    try {
      // 게시글 수정 기능을 실행한다. 익셉션이 발생하면 catch 블록의 에러 코드를 응답으로 전송한다.
      modifyService.modify(modReq);
      return "/WEB-INF/view/modifySuccess.jsp";
    } catch (ArticleNotFoundException e) {
      res.sendError(HttpServletResponse.SC_NOT_FOUND);
      return null;
    } catch (PermissionDeniedException e) {
      res.sendError(HttpServletResponse.SC_FORBIDDEN);
      return null;
    }
  }

  // GET 방식. 폼 요청을 처리한다.
  private String processForm(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, NamingException, IOException {

    try {
      String noVal = req.getParameter("no");
      int no = Integer.parseInt(noVal);
      // 폼에 보여줄 게시글을 구한다. 게시글이 존재하지 않으면 ArticleNotFoundException이 발생한다.
      ArticleData articleData = readService.getArticle(no, false);
      // 현재 로그인한 사용자 정보를 구한다.
      User authUser = (User) req.getSession().getAttribute("authUser");
      // 현재 로그인한 사용자가 게시글의 작성자인지 아닌지 검사한다.
      if(!canModify(authUser, articleData)) {
        res.sendError(HttpServletResponse.SC_FORBIDDEN);
        return null;
      }
      // 폼에 데이터를 보여줄 때 사용할 객체를 생성하고, request의 modReq 속성에 저장한다.
      ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, 
          articleData.getArticle().getTitle(), 
          articleData.getContent());

      req.setAttribute("modReq", modReq);
      // 폼을 위한 뷰를 리턴한다.
      return FORM_VIEW;
    } catch (ArticleNotFoundException e) {
      res.sendError(HttpServletResponse.SC_NOT_FOUND);
      return null;
    }
  }

  private boolean canModify(User authUser, ArticleData articleData) {
    String writerId = articleData.getArticle().getWriter().getId();
    return authUser.getId().equals(writerId);
  }

}
