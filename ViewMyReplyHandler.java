package myUpload.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import auth.service.User;
import mvc.command.CommandHandler;
import myUpload.service.ListReplyService;
import myUpload.service.ReplyPage;

public class ViewMyReplyHandler implements CommandHandler {

	private ListReplyService listService = new ListReplyService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		User user = (User)req.getSession().getAttribute("authUser");
		
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if(pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		ReplyPage replyPage = listService .getReplyPage(user.getId(), pageNo);
		req.setAttribute("replyPage", replyPage);
		return "/WEB-INF/view/listMyReply.jsp";
	}

}
