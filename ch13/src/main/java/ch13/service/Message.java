package ch13.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Message implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("message", "점심 잘 먹었네");
		return "message.jsp";
	}
}