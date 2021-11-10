package com.yedam.saramin.command.adt;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.yedam.saramin.adoptions.Adoption;
import com.yedam.saramin.adoptions.service.AdoptionService;
import com.yedam.saramin.adoptions.service.impl.AdoptionServiceImpl;
import com.yedam.saramin.comm.Command;

public class AdtInsertFormSubmit implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		Adoption adtVO = new Adoption();
		AdoptionService adtDAO = new AdoptionServiceImpl();
		try {
			ServletContext context = request.getSession().getServletContext();
			String saveDir = context.getRealPath("./imgUpload");
			response.setContentType("text/html; charset=utf-8");
			request.setCharacterEncoding("utf-8");
			File attachesDir = new File(saveDir);
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			fileItemFactory.setRepository(attachesDir);
			fileItemFactory.setSizeThreshold(1024 * 1024);
			ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
			String imgString = "";
			String addressString = "";
			List<FileItem> items;
			items = fileUpload.parseRequest(request);
			for (FileItem item : items) {
				if (item.isFormField()) {
					System.out.printf("파라미터명: %s, 파라미터 값: %s \n", item.getFieldName(), item.getString("utf-8"));
					if (item.getFieldName().equals("contents")) {
						System.out.println(item.getString("utf-8"));
						adtVO.setBody(item.getString("utf-8"));
					}
					if (item.getFieldName().equals("comId")) {
						System.out.println(item.getString("utf-8"));
						adtVO.setCom_id(item.getString("utf-8"));
					}
					if (item.getFieldName().equals("email")) {
						System.out.println(item.getString("utf-8"));
						adtVO.setAdt_email(item.getString("utf-8"));
					}
					if (item.getFieldName().equals("title")) {
						System.out.println(item.getString("utf-8"));
						adtVO.setTitle(item.getString("utf-8"));
					}
					if (item.getFieldName().equals("career")) {
						System.out.println(item.getString("utf-8"));
						adtVO.setCareer(item.getString("utf-8"));
					}
					if (item.getFieldName().equals("salType")) {
						System.out.println(item.getString("utf-8"));
						adtVO.setSal_type(item.getString("utf-8"));
					}
					if (item.getFieldName().equals("salHowmuch")) {
						System.out.println(item.getString("utf-8"));
						adtVO.setSal_howmuch(item.getString("utf-8"));
					}
					if (item.getFieldName().equals("adtExp")) {
						System.out.println(item.getString("utf-8"));
						adtVO.setAdt_exp(item.getString("utf-8"));
					}
					if (item.getFieldName().equals("postcode")) {
						System.out.println(item.getString("utf-8"));
						addressString += item.getString("utf-8");
					}
					if (item.getFieldName().equals("address")) {
						System.out.println(item.getString("utf-8"));
						addressString += "!" + item.getString("utf-8");
					}
					if (item.getFieldName().equals("detailAddress")) {
						System.out.println(item.getString("utf-8"));
						addressString += "@" + item.getString("utf-8");
					}
					if (item.getFieldName().equals("extraAddress")) {
						System.out.println(item.getString("utf-8"));
						addressString += "#" + item.getString("utf-8");
					}
					if (item.getFieldName().equals("coordinate")) {
						System.out.println(item.getString("utf-8"));
						addressString += "$" + item.getString("utf-8");
					}
					adtVO.setAdt_address(addressString);
				} else {
					System.out.printf("파라미터명 : %s, 파일명 : %s,  파일크기 : %s bytes \n", item.getFieldName(), item.getName(),
							item.getSize());
					imgString += "&" + item.getName();
					adtVO.setAdt_imgsrc(imgString);
					// tmp 경로: .metadata\plugins\org.eclipse.wst.server.core\tmp0
					System.out.println(attachesDir.getAbsolutePath());
					if (item.getSize() > 0) {
						String separator = File.separator;
						int index = item.getName().lastIndexOf(separator);
						String fileName = item.getName().substring(index + 1);
						File uploadFile = new File(attachesDir + separator + fileName);
						item.write(uploadFile);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		int r = adtDAO.insertAdoption(adtVO);
		System.out.println(r + "업로드 완료");
		return "searchInfo.do";
	}
}
