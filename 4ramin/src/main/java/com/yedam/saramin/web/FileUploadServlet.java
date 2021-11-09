package com.yedam.saramin.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("*.upload")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public FileUploadServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	    ServletContext context =request.getSession().getServletContext();
	    String saveDir = context.getRealPath("./WEB-INF/imgUpload");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		File attachesDir = new File(saveDir);

		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(attachesDir);
		fileItemFactory.setSizeThreshold(1024 * 1024);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);

		try {
			List<FileItem> items;
			items = fileUpload.parseRequest(request);
			for (FileItem item : items) {
				if (item.isFormField()) {
					System.out.printf("파라미터명: %s, 파라미터 값: %s \n", item.getFieldName(), item.getString("utf-8"));
				}else {
					System.out.printf("파라미터명 : %s, 파일명 : %s,  파일크기 : %s bytes \n", item.getFieldName(), item.getName(), item.getSize());
					
					//tmp 경로: .metadata\plugins\org.eclipse.wst.server.core\tmp0
					
					System.out.println(attachesDir.getAbsolutePath());
					if(item.getSize()>0) {
						String separator = File.separator;
						int index = item.getName().lastIndexOf(separator);
						String fileName = item.getName().substring(index+1);
						File uploadFile = new File(attachesDir + separator + fileName);
						item.write(uploadFile);
					}
				}
			}
			System.out.println("업로드 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
