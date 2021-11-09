package com.yedam.saramin.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.command.AdminPage;
import com.yedam.saramin.command.AdtBookMarkList;
import com.yedam.saramin.command.AdtBookmarkDelete;
import com.yedam.saramin.command.AdtBookmarkInsert;
import com.yedam.saramin.command.AjaxCompanyList;
import com.yedam.saramin.command.AjaxUserList;
import com.yedam.saramin.command.BookMarkForm;
import com.yedam.saramin.command.ComBookMarkDelete;
import com.yedam.saramin.command.ComBookMarkInsert;
import com.yedam.saramin.command.ComBookMarkList;
import com.yedam.saramin.command.CompanyDelete;
import com.yedam.saramin.command.CompanyDeleteForm;
import com.yedam.saramin.command.CompanyJoin;
import com.yedam.saramin.command.CompanyJoinForm;
import com.yedam.saramin.command.CompanyLike;
import com.yedam.saramin.command.CompanyLikeSelect;
import com.yedam.saramin.command.CompanyLogin;
import com.yedam.saramin.command.CompanyMyInfo;
import com.yedam.saramin.command.CompanySelect;
import com.yedam.saramin.command.CompanySelectList;
import com.yedam.saramin.command.CompanyUpdate;
import com.yedam.saramin.command.CompanyUpdateForm;
import com.yedam.saramin.command.HomeCommand;
import com.yedam.saramin.command.LoginForm;
import com.yedam.saramin.command.Logout;
import com.yedam.saramin.command.UserDeleto;
import com.yedam.saramin.command.UserList;
import com.yedam.saramin.command.UserLogin;
import com.yedam.saramin.command.UserOne;
import com.yedam.saramin.command.UsersJoin;
import com.yedam.saramin.command.UsersJoinForm;
import com.yedam.saramin.command.adt.AdtInsertForm;
import com.yedam.saramin.command.adt.AdtInsertFormSubmit;
import com.yedam.saramin.command.adt.AdtSelect;
import com.yedam.saramin.command.adt.AdtSelectAll;
import com.yedam.saramin.resume.ResumeForm;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, Command> map = new HashMap<String, Command>();

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		// 김범수
		map.put("/main.do", new HomeCommand());
		map.put("/adtSelectAll.do", new AdtSelectAll());
		map.put("/adtInsertForm.do", new AdtInsertForm());
		map.put("/adtInsertFormSubmit.do", new AdtInsertFormSubmit());
		map.put("/adtSelect.do", new AdtSelect());
		
		// 최창인 command
		map.put("/UsersJoinForm.do", new UsersJoinForm()); //회원가입 폼
		map.put("/UsersJoin.do", new UsersJoin()); //회원가입 처리
		map.put("/UserList.do", new UserList());//회원 리스트 출력
		map.put("/UserOne.do", new UserOne()); //회원 한건 검색(모달 완성)
		map.put("/UserDeleto.do", new UserDeleto());//회원 정보 삭제(음..)
		map.put(getServletInfo(), null); // X
		
		// 허재철 command
		map.put("/loginForm.do", new LoginForm()) ; // 로그인 폼 호출 (테스트끝)
		map.put("/companyLogin.do", new CompanyLogin()) ; // 기업 로그인 처리 (테스트끝)
		map.put("/logout.do", new Logout()) ; // 로그아웃 (테스트끝)
		map.put("/companyJoinForm.do", new CompanyJoinForm()) ; // 기업 회원가입 폼 호출 (테스트끝)
		map.put("/companyJoin.do", new CompanyJoin()) ; // 기업 회원가입 처리 (테스트끝)
		map.put("/companySelectList.do", new CompanySelectList()) ; // 기업 전체목록 조회 (테스트끝)
		map.put("/companySelect.do", new CompanySelect()) ; // 기업 상세 정보 조회 (테스트끝)
		map.put("/companyMyInfo.do", new CompanyMyInfo()) ; // 기업 내 정보 보기 (테스트끝)
		map.put("/companyLike.do", new CompanyLike()) ; // 기업 좋아요 (테스트끝)
		map.put("/companyLikeSelect.do", new CompanyLikeSelect()) ; // 기업 좋아요 조회 (테스트끝)
		map.put("/companyUpdateForm.do", new CompanyUpdateForm()) ; // 기업 정보 수정 폼 호출 (테스트끝)
		map.put("/companyUpdate.do", new CompanyUpdate()) ; // 기업 정보 수정 처리 (테스트끝)
		map.put("/companyDeleteForm.do", new CompanyDeleteForm()) ; // 기업 회원 탈퇴 폼 호출 (테스트끝)
		map.put("/companyDelete.do", new CompanyDelete()) ; // 기업 회원 탈퇴 (테스트끝) 
		map.put("/companyUpdateForm.do", new CompanyUpdateForm()) ; // 기업 정보 수정 폼 호출 (테스트끝)
		map.put("/companyUpdate.do", new CompanyUpdate()) ; // 기업 정보 수정 처리 (테스트끝)
		map.put("/adminPage.do", new AdminPage()) ; // 관리자 페이지 호출 (테스트끝)
		map.put("/userLogin.do", new UserLogin()) ; // 유저 로그인 처리 (테스트끝)
		map.put("/ajaxUserList.do", new AjaxUserList()) ; // 관리자 페이지에 ajax로 유저목록 불러오기 (테스트끝)
		map.put("/AjaxCompanyList.do", new AjaxCompanyList()) ; // 관리자 페이지에 ajax로 회사목록 불러오기 (테스트끝)
		map.put("/bookMarkForm.do", new BookMarkForm()) ; // 즐겨찾기 폼 호출 (테스트끝)
		map.put("/comBookmarkList.do", new ComBookMarkList()) ; // 기업북마크 조회 (테스트끝)
		map.put("/comBookmarkInsert.do", new ComBookMarkInsert()) ; // 기업북마크 추가 (테스트끝)
		map.put("/comBookmarkDelete.do", new ComBookMarkDelete()) ; // 기업북마크 삭제 (테스트끝)
		map.put("/adtBookMarkList.do", new AdtBookMarkList()) ; // 공고북마크 조회 (테스트끝)
		map.put("/adtBookmarkInsert.do", new AdtBookmarkInsert()) ; // 공고북마크 추가 (테스트끝)
		map.put("/adtBookmarkDelete.do", new AdtBookmarkDelete()) ; // 공고북마크 삭제 (테스트끝)
		
		// 승근씨 command
		map.put("/resumeForm.do", new ResumeForm());
	}

	
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length());
    
		Command command = map.get(page);
		String viewPage = command.run(request, response);
		
		if (viewPage != null && !viewPage.endsWith(".do")) {
			if (viewPage.startsWith("ajax:")) {
				response.setContentType("text/plain; charset=UTF-8") ;
				response.getWriter().append(viewPage.substring(5)) ;
				return ;
			}
			
			if (viewPage.endsWith(".jsp"))
				viewPage = "WEB-INF/views/" + viewPage ;
			else
				viewPage = viewPage + ".tiles" ;
		}
    
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		System.out.println(viewPage);
		dispatcher.forward(request, response);
	}

}
