package com.yedam.saramin.command.search;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;
import com.yedam.saramin.search.Search;
import com.yedam.saramin.search.service.SearchService;
import com.yedam.saramin.search.service.impl.SearchServiceImpl;

public class SearchInfo implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		Search vo = new Search();
		SearchService searchDAO = new SearchServiceImpl();
		String comName = request.getParameter("comName");
		String adtAddress = request.getParameter("adtAddress");
		String pageNum = request.getParameter("pageNum");
		String comBranch = request.getParameter("comBranch");
		
		if(comName!=null && comName !="") {
		vo.setCom_name(comName);
		}
		if(adtAddress!=null && adtAddress!="") {
		vo.setAdt_address(adtAddress);
		}
		if(comBranch!=null && comBranch!="") {
		vo.setCom_branch(comBranch);
		}
		if(pageNum!=null && pageNum!="") {
		int clickedPageNum = Integer.parseInt(pageNum);
		vo.setPage_b(clickedPageNum*10);
		vo.setPage_a(vo.getPage_b()-9);
		} else {
			vo.setPage_a(1);
			vo.setPage_b(10);
			pageNum = "1";
		}
		
		System.out.println(vo.getCom_name());
		System.out.println(vo.getAdt_address());
		System.out.println(vo.getCom_branch());
		System.out.println(pageNum);
		
		List<Search> list = new ArrayList<>(); 
		list = searchDAO.search(vo);
		request.setAttribute("adoptions", list);
		request.setAttribute("cnt", list.size());
		request.setAttribute("pageName", "채용공고");
		
		
//		for(int i=0;i<list.size();i++) {
//		System.out.println(list.get(i).getTitle());
//		System.out.println(list.get(i).getAdt_exp());
//		System.out.println(list.get(i).getCom_branch());
//		System.out.println(list.get(i).getCom_name());
//		}
		
		request.setAttribute("searchPageNum", pageNum);
		request.setAttribute("searchComName", comName);
		request.setAttribute("searchAdtAddress", adtAddress);
		request.setAttribute("searchComBranch", comBranch);
		request.setAttribute("result", searchDAO.searchDistinct());
		return "adoptions/adtSelectAll";
	}

}
