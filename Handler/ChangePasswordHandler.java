	package member.command;
	
	import java.io.IOException;
	import java.util.HashMap;
	import java.util.Map;
	
	import javax.naming.NamingException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import auth.service.User;
	import member.service.ChangePasswordService;
	import member.service.InvalidPasswordException;
	import member.service.MemberNotFoundException;
	import mvc.command.CommandHandler;
	
	public class ChangePasswordHandler implements CommandHandler {
	
		private static final String FORM_VIEW = "/WEB-INF/view/changePwdForm.jsp";
		private ChangePasswordService changePwdSvc = new ChangePasswordService();
		
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
			
			// LoginHandler에서 로그인에 성공하면 세션의 authUser 속성에 사용자 정보를 저장했으므로, 세션에서 사용자 정보를 구한다. LoginCheckFilter를 이용해서 로그인한 사용자만 비밀번호 변경 기능을 실행할 수 있도록 할 것이므로 세션에서 구한 사용자 정보는 null이 아니다. 
			User user = (User)req.getSession().getAttribute("authUser");
			
			// 에러 정보를 담을 맵 객체를 생성하고 errors 속성에 저장한다.
			Map<String, Boolean> errors = new HashMap<String, Boolean>();
			req.setAttribute("errors", errors);
			
			// curPwd 요청 파라미터와 newPwd 요청 파라미터 값을 구한다.
			String curPwd = req.getParameter("curPwd");
			String newPwd = req.getParameter("newPwd");
			
			// 파라미터 값이 없는 경우 errors 맵 객체에 에러 코드를 추가한다.
			if(curPwd == null || curPwd.isEmpty()) {
				errors.put("curPwd", Boolean.TRUE);
			}
			if(newPwd == null || newPwd.isEmpty()) {
				errors.put("newPwd", Boolean.TRUE);
			}
			// 에러가 존재하면 폼을 위한 뷰 경로를 리턴한다.
			if(!errors.isEmpty()){
				return FORM_VIEW;
			}
			
			// 비밀번호 변경 기능을 실행한다.
			try {
				// 비밀번호 변경에 성공하면 changePwdSuccess.jsp를 뷰로 리턴한다.
				changePwdSvc.changePassword(user.getId(), curPwd, newPwd);
				return "/WEB-INF/view/changePwdSuccess.jsp";
			} catch (InvalidPasswordException e) {
				errors.put("badCurPwd", Boolean.TRUE);
				return FORM_VIEW;
			} catch (MemberNotFoundException e) {
				res.sendError(HttpServletResponse.SC_BAD_REQUEST);
				return null;
			}
		}
	
		private String processForm(HttpServletRequest req, HttpServletResponse res) {
			
			return FORM_VIEW;
		}
	
	}
