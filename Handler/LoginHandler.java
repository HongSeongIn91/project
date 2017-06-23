	package auth.command;
	
	import java.io.IOException;
	import java.util.HashMap;
	import java.util.Map;
	
	import javax.naming.NamingException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import auth.service.LoginFailException;
	import auth.service.LoginService;
	import auth.service.User;
	import member.service.JoinService;
	import mvc.command.CommandHandler;
	
	public class LoginHandler implements CommandHandler {
	
		private static final String FORM_VIEW = "/WEB-INF/view/loginForm.jsp";
		private LoginService loginService = new LoginService();
		
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
	
		private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws ClassNotFoundException, NamingException, IOException {
			// 폼에서 전송한 id 파라미터와 password 파라미터 값을 구한다.
			String id = trim(req.getParameter("id"));
			String password = trim(req.getParameter("password"));
			
			// 에러 정보를 담을 맵 객체를 생성하고 errors 속성에 저장한다.
			Map<String, Boolean> errors = new HashMap<String, Boolean>();
			req.setAttribute("errors", errors);
			
			if(id==null || id.isEmpty())
				errors.put("id", Boolean.TRUE);
			if(password==null || password.isEmpty())
				errors.put("password", Boolean.TRUE);
			
			// 에러가 존재하면 폼 뷰를 리턴한다.
			if(!errors.isEmpty()){
				return FORM_VIEW;
			}
			
			try {
				// loginService.login()을 이용해서 인증을 수행한다. 로그인에 성공하면 User 객체를 리턴한다.
				User user = LoginService.login(id, password);
				// User 객체를 세션의 authUser 속성에 저장한다.
				req.getSession().setAttribute("authUser", user);
				// /index.jsp로 리다이렉트한다.
				res.sendRedirect(req.getContextPath()+"/index.jsp");
				return null;
			// 로그인에 실패해서 LoginFailException이 발생하면 해당 에러를 추가하고, 폼을 위한 뷰를 리턴한다.
			} catch (LoginFailException e) {
				errors.put("idOrPwNotMatch", Boolean.TRUE);
				return FORM_VIEW;
			}
			
		}
	
		private String trim(String str) {
		
			return str == null ? null : str.trim();
		}
	
		private String processForm(HttpServletRequest req, HttpServletResponse res) {
	
			return FORM_VIEW;
		}
	
	}
