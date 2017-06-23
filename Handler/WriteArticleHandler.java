	package article.command;
	
	import java.util.HashMap;
	import java.util.Map;
	
	import javax.naming.NamingException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import article.model.Writer;
	import article.service.WriteArticleService;
	import article.service.WriteRequest;
	import auth.service.User;
	import mvc.command.CommandHandler;
	
	public class WriteArticleHandler implements CommandHandler {
		private static final String FORM_VIEW = "/WEB-INF/view/newArticleForm.jsp";
		private WriteArticleService writeService = new WriteArticleService();
		
		@Override
		public String process(HttpServletRequest req, HttpServletResponse res)
				throws Exception {
			if(req.getMethod().equalsIgnoreCase("GET")) {
				return processForm(req, res);
			} else if(req.getMethod().equalsIgnoreCase("POST")) {
				return processSubmit(req, res);
			} else {
				res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
				return null;
			}
		}
	
		private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, NamingException {
			Map<String, Boolean> errors = new HashMap<String, Boolean>();
			req.setAttribute("errors", errors);
			
			// 세션에 로그인한 사용자 정보를 구한다.
			User user = (User)req.getSession(false).getAttribute("authUser");
			// user와 HttpServletRequest를 이용해서 WriteRequest 객체를 생성한다.
			WriteRequest writeReq = createWriteRequest(user, req);
			// writeReq 객체가 유효한지 검사한다.
			writeReq.validate(errors);
			
			if(!errors.isEmpty()) {
				return FORM_VIEW;
			}
			
			// WriteArticleService를 이용해서 게시글을 등록하고, 등록된 게시글의 ID를 리턴받는다.
			int newArticleNo = writeService.write(writeReq);
			// 새 글의 ID를 request의 newArticled 속성에 저장한다. 처리 결과를 보여줄 JSP는 이 속성값을 사용해서 링크를 생성한다.
			req.setAttribute("newArticleNo", newArticleNo);
			
			return "/WEB-INF/view/newArticleSuccess.jsp";
		}
		
	
		private WriteRequest createWriteRequest(User user, HttpServletRequest req) {
			
			return new WriteRequest(
					new Writer(user.getId(), user.getName()), 
					req.getParameter("title"), 
					req.getParameter("content"));
		}
	
		private String processForm(HttpServletRequest req, HttpServletResponse res) {
			
			return FORM_VIEW;
		}
	
	}
