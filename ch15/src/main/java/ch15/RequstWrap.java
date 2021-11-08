package ch15;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class RequstWrap extends HttpServletRequestWrapper {
	private HttpServletRequest request;
	public RequstWrap(HttpServletRequest request) {
		super(request);
		this.request = request;
	}
	@Override
	public String getParameter(String name) {
		String value = request.getParameter(name);
		if (name.equals("name")) {
			return value+" 에이 바보";
		} else return "우리집";
		/* return value + " 에이 바보"; */
	}
	public String[] getParameterValues(String name) {
		String[] value = request.getParameterValues(name);
		String[] newValue = new String[value.length];
		for (int i =0; i <value.length;i++) {
			newValue[i] = value[i]+" 맛있어";
		}
		return newValue;
	}
}
