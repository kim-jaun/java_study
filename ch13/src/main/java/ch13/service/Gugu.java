package ch13.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Gugu implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = (int)(Math.random()*8) + 2;
		request.setAttribute("num", num);
		return "gugu.jsp";
	}

}
