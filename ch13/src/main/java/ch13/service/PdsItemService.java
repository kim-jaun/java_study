package ch13.service;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ch13.dao.PdsItem;
import ch13.dao.PdsItemDao;
public class PdsItemService {
	public int insert(HttpServletRequest request) {
		int result = 0;
//	jsp application.getRealPath("/upload");
//		request.getRealPath("/upload");
		String real = 
			request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10;  // 10M
		try {
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, 
					"utf-8", new DefaultFileRenamePolicy());
			String fileName = mr.getFilesystemName("file");
			String description = mr.getParameter("description");
			File file = new File(real+"/"+fileName);
			int fileSize = (int)file.length();  // 파일 길이
//			file.renameTo(new File("새로운 파일명")); // 날자, random이름
			PdsItem pi = new PdsItem();
			pi.setDescription(description);
			pi.setFileName(fileName);
			pi.setFileSize(fileSize);
			PdsItemDao pid = PdsItemDao.getInstance();
			result = pid.insert(pi);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public List<PdsItem> list() {
		PdsItemDao pid = PdsItemDao.getInstance();
		List<PdsItem> list = pid.list();
		return list;
	}
}