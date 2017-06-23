package mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandHandler {

    // 모든 명령어 핸들러 클래스가 구현해야만 하는 메서드
	public String process(HttpServletRequest req, HttpServletResponse res) 
	throws Exception;
}
