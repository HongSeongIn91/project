package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.DuplicateIdException;
import member.service.JoinRequest;
import member.service.JoinService;
import mvc.command.CommandHandler;

public class JoinHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/joinForm.jsp";
	private JoinService joinService = new JoinService();

	@Override
	// 요청 방식이 GET이면 processForm()실행, POST이면 processSubmit() 실행, GET 또는 POST가 아니면 405 응답 코드 전송.
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
		// 폼에 입력한 데이터를 이용해서 JoinRequest 객체를 생성
		JoinRequest joinReq = new JoinRequest();
		joinReq.setId(req.getParameter("id"));
		joinReq.setName(req.getParameter("name"));
		joinReq.setPassword(req.getParameter("password"));
		joinReq.setConfirmPassword(req.getParameter("confirmPassword"));

		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);

		// JoinRequest 객체의 값이 올바른지 검사.  JoinRequest.java의 validate()
		joinReq.validate(errors);

		if(!errors.isEmpty()) {
			return FORM_VIEW;
		}

		try {
			JoinService.join(joinReq);
			return "/WEB-INF/view/joinSuccess.jsp";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}

	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {

		return FORM_VIEW;
	}

}
