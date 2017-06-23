package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

public class ControllerUsingURI extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//<커맨드, 핸들러인스턴스> 매핑 정보 저장
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	public void init() throws ServletException {
		// configFile 초기화 파라미터의 값을 읽어온다.
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		// configFile 초기화 파라미터의 값을 이용해서 설정 파일 경로를 구한다.
		String configFilePath = getServletContext().getRealPath(configFile);
		// configFile 파일로부터 매핑 정보를 읽어와 Properties 객체에 저장한다. Properties는 (이름, 값) 목록을 갖는 클래스로서, 이 경우에는 프로퍼티 이름을 커맨드 이름으로 사용하고 값을 클래스 이름으로 사용한다.  (커맨드(명령어)이름, 클래스 이름)
		try (FileReader fis = new FileReader(configFilePath)) {
			prop.load(fis);
		} catch (IOException e) {
			throw new ServletException(e);
		}
		
		// Properties에 저장된 각 프로퍼티의 키에 대해 다음 작업을 반복한다.
		Iterator<?> keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			// 1. 프로퍼티 이름을 커맨드 이름으로 사용한다.
			String command = (String) keyIter.next();
			// 2. 커맨드 이름에 해당하는 핸들러 클래스 이름을 Properties에서 구한다.
			String handlerClassName = prop.getProperty(command);
			try {
				// 3. 핸들러 클래스 이름을 이용해서 Class 객체를 구한다.
				Class<?> handlerClass = Class.forName(handlerClassName);
				// 4. Class로부터 핸들러 객체를 생성한다. 즉, 2번 과정에서 구한 이름에 해당하는 클래스의 객체를 생성한다.
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				// 5. commandHandlerMap에 (커맨드, 핸들러 객체) 매핑 정보를 저장한다.
				commandHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}
	
	private void Process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트가 요청한 명령어를 구한다. 요청URI 파라미터를 명령어로 사용한다.
		String command = request.getRequestURI();
		// 전체 요청 URI에서 request.getContextPath()부분(웹 어플리케이션 경로)을 제거하고 나머지 URI만을 명령어로 사용한다.
		if (command.indexOf(request.getContextPath())==0) {
			command = command.substring(request.getContextPath().length());
		}
		// commandHandlerMap에서 요청을 처리할 핸들러 객체를 구한다. 요청URI 파라미터 값을 키로 사용한다.
		CommandHandler handler = commandHandlerMap.get(command);
		// 명령어에 해당하는 핸들러 객체가 존재하지 않을 경우 NullHandler를 사용한다.
		if(handler == null) {
			handler = new NullHandler();
		}
		String viewPage = null;
		try {
			// 구한 핸들러 객체의 process() 메서드를 호출해서 요청을 처리하고, 결과로 보여줄 뷰 페이지 경로를 리턴 값으로 전달받는다. 핸들러 인스턴스인 handler의 process() 메서드는 클라이언트의 요청을 알맞게 처리한 후, 뷰 페이지에 보여줄 결과값을 request나 session의 속성에 저장해야 한다.
			viewPage = handler.process(request, response);
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		// viewPage가 null이 아닐 경우, 핸들러 인스턴스가 리턴한 뷰 페이지로 이동한다.
		if (viewPage != null){
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Process(request, response);
	}
	
}
