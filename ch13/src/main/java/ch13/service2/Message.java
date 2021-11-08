package ch13.service2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Message implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("msg", "대박사건 음식의 비밀 msg");
		return "/kk/message.jsp";
	}
}
