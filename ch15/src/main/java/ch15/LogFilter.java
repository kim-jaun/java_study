package ch15;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class LogFilter
 */
@WebFilter("/sub3/*")
public class LogFilter implements Filter {
    private PrintWriter pw;
	public void destroy() {
		if (pw != null) pw.close();
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		GregorianCalendar gc = new GregorianCalendar();
		String date = String.format("%TF %TT", gc, gc);
		pw.write(date+" : sub3 웹 프로그램 실행\r\n");
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		try {
			pw = new PrintWriter("c:/jsp/filLog.txt");
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		}
	}

}
