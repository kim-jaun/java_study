package ch15;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class ResponseWrap extends HttpServletResponseWrapper{
	private HttpServletResponse response;
	private StringWriter sw = new StringWriter();
	private PrintWriter pw = new PrintWriter(sw);
	public PrintWriter getWriter() {
		return pw;
	}
	public ResponseWrap(HttpServletResponse response) {
		super(response);
		this.response = response;
	}
	public void addCookie(Cookie cookie) {
		String value = cookie.getValue();
		String newValue = value + "-보바";
		cookie.setValue(newValue);
		response.addCookie(cookie);
	}
	public void replace() throws IOException {
		String str = sw.toString();
		String newStr = str.replace("비행기", "강아지");
		PrintWriter out = response.getWriter();
		out.print(newStr);
	}
}
