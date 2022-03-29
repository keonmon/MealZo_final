package com.mealzo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealzo.dto.Paging;
import com.mealzo.service.MProductService;

@Controller
public class MProductController {

	@Autowired
	MProductService ps;
	
	@RequestMapping("/")
	public ModelAndView index(Model model, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		String sub = request.getParameter("sub");
		if( sub!=null && sub.equals("y") ) {
			session.removeAttribute("key");
			session.removeAttribute("page");
		}
		mav.setViewName("index");
		
		
		//mproductDao pdao = mproductDao.getInstance();
		HashMap<String,Object> paramMap= new HashMap<String,Object>();
		paramMap.put("ref_cursor1", null);
		paramMap.put("ref_cursor2", null);
		
		ps.getNewBestProduct(paramMap);
		// NewList 담아오기
		ArrayList<HashMap<String,Object>> newList 
			= (ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor1");
		// bestList 담아오기
		ArrayList<HashMap<String,Object>> bestList 
			= (ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor2");
		
		
		mav.addObject("newList", newList);
		mav.addObject("bestList", bestList);
		
		return mav;
	}
	
	
	// 전체보기
	@RequestMapping("productAllForm")
	public String productAllForm(HttpServletRequest request, Model model, 
			@RequestParam("sort")String sort,
			//@RequestParam("sub")String sub,
			@RequestParam("idx")Integer idx ) {
		
		String url="product/productAll";
		HttpSession session = request.getSession();
		 
		String sub = request.getParameter("sub");
		if( sub!=null && sub.equals("y") ) {
			session.removeAttribute("key");
			session.removeAttribute("page");
		}
		
		String key="";
		if( request.getParameter("key") != null ) {
			key = request.getParameter("key");
			session.setAttribute("key", key);
		} else if( session.getAttribute("key")!= null ) {
			key = (String)session.getAttribute("key");
		} else {
			session.removeAttribute("key");
			key = "";
		}
		
		// 검색어는 레코드 갯수를 세는 동작부터 영향을 미칩니다
		//System.out.println(count);
		//System.out.println(key);

		int page = 1;
		if( request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if( session.getAttribute("page") != null ) {
			page = (int) session.getAttribute("page");
		} else{
			page = 1;
			session.removeAttribute("page");
		}
		
		HashMap<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("key", key);
		paramMap.put("cnt", 0);
		ps.getAllCount(paramMap);
		
		Paging paging = new Paging();
		paging.setPage(page);		
		paging.setTotalCount((int)paramMap.get("cnt"));
		request.setAttribute("paging" , paging );
		
		
		if(sort.equals("recently")){
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("key", key);
			paramMap.put("ref_cursor", null);
			ps.listProduct(paramMap);
			
			ArrayList<HashMap<String,Object>> allList 
				= (ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
			request.setAttribute("mproductVoList", allList);
			
		}else if(sort.equals("low_price")){
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("key", key);
			paramMap.put("ref_cursor", null);
			ps.getalow(paramMap);
			
			ArrayList<HashMap<String,Object>> alow 
			= (ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
			request.setAttribute("mproductVoList", alow);
			
		}else{
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("key", key);
			paramMap.put("ref_cursor", null);
			ps.getahight(paramMap);
			
			ArrayList<HashMap<String,Object>> ahight 
			= (ArrayList<HashMap<String,Object>>) paramMap.get("ref_cursor");
			request.setAttribute("mproductVoList", ahight);
			
		}
		request.setAttribute("key", key);
		request.setAttribute("idx", idx);
		
		return url;
	}
	
}
