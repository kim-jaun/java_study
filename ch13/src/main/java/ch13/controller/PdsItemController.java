package ch13.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch13.dao.PdsItem;
import ch13.service.PdsItemService;
// 확장자가 action인경우에 이 컨트롤러를 실행하라, 확장자명은 임의로 정한다
// url : http://localhost:8080/ch13/pds/fileupload.action
@WebServlet("*.action")
public class PdsItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	여러개의 서블릿 요청을 하나의 서블릿으로 처리하기 위해 사용
		String path = request.getContextPath();
		System.out.println("path = " + path); //  /ch13(프로젝트명)
		String uri = request.getRequestURI(); 
		//                                        0123456
		System.out.println("uri = " + uri);   //  /ch13/pds/fileupload.action
		String command = uri.substring(path.length()+1);
		System.out.println("command = " + command);  //  pds/fileupload.action
		String pgm = "";
		if (command.equals("pds/fileupload.action")) {
			PdsItemService pis = new PdsItemService();
			int result = pis.insert(request);
			request.setAttribute("result", result);
			pgm = "uploadResult.jsp";
		} else if (command.equals("pds/list.action")) {
			PdsItemService pis = new PdsItemService();
			List<PdsItem> list = pis.list(); 
			request.setAttribute("list", list);
			pgm = "list.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(pgm);
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}