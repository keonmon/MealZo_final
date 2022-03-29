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
	
	// 카테고리 메뉴
	@RequestMapping("productForm")
	public String productForm(HttpServletRequest request, Model model, 
			@RequestParam("sort")String sort,
			//@RequestParam("sub")String sub,
			@RequestParam("idx")Integer idx ) {
		
		String url="product/productkind";
	    
		HttpSession session = request.getSession();
		String sub=request.getParameter("sub");
		if(sub!=null&& sub.equals("y")) {
			session.removeAttribute("page");
			session.removeAttribute("key");
		}
		  
		String key="";
		int page = 1;
		if( request.getParameter("key") != null ) {
			key = request.getParameter("key");
			session.setAttribute("key", key);
		} else if( session.getAttribute("key")!= null ) {
			key = (String)session.getAttribute("key");
		} else {
			session.removeAttribute("key");
			key = "";
		}
		if( request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if( session.getAttribute("page") != null ) {
			page = (int) session.getAttribute("page");
		} else{
			page = 1;
			session.removeAttribute("page");
		}
		
		String kind= request.getParameter("kind");
		String bestyn= request.getParameter("bestyn");
		String useyn = request.getParameter("useyn");
		String newyn = request.getParameter("newyn");
		
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		// 베스트
		HashMap<String,Object> paramMap = new HashMap<String,Object>();
		if(bestyn.equals("y")){
			
			/* paramMap.put("key", key); */
			paramMap.put("bestyn", bestyn);
			paramMap.put("cnt", 0);
			ps.getAllCountByBest(paramMap);
			
			//session.removeAttribute("submenu");
			Paging paging = new Paging();
			paging.setPage(page);		
			paging.setTotalCount((int)paramMap.get("cnt"));
			request.setAttribute("paging" , paging );
			//request.setAttribute("key", key);
			
			System.out.println(kind);
			System.out.println(sort);
			System.out.println(bestyn);
			System.out.println("~~best끝~~");
			
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			
			if(sort.equals("recently")){
				//베스트
				ps.getBest(paramMap);
				ArrayList<HashMap<String,Object>> best 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", best);
			}else if(sort.equals("low_price")){
				//베스트-낮은순
				ps.getBLow(paramMap);
				ArrayList<HashMap<String,Object>> blow 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", blow);
			}else{
				//베스트-높은순
				ps.getBHight(paramMap);
				ArrayList<HashMap<String,Object>> bhight 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", bhight);
			}
			
		// 신상	
		}else if(newyn.equals("y")){
			/* paramMap.put("key", key); */
			paramMap.put("newyn", newyn);
			paramMap.put("cnt", 0);
			
			session.removeAttribute("submenu");
			int count = 20;	//신상품 보여질 개수 정의
			Paging paging = new Paging();
			paging.setPage(page);		
			paging.setTotalCount(count);
			request.setAttribute("paging" , paging );
			request.setAttribute("key", key);
			
			System.out.println(kind);
			System.out.println(sort);
			System.out.println(bestyn);
			System.out.println(newyn);
			System.out.println("~~new끝~~");
			
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			
			if(sort.equals("recently")){
				//신상품
				ps.getNewList(paramMap);
				ArrayList<HashMap<String,Object>> newList 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", newList);
			}else if(sort.equals("low_price")){
				//신상품-낮은순
				ps.getNewLow(paramMap);
				ArrayList<HashMap<String,Object>> newlow 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", newlow);
			}else{
				//신상품-높은순
				ps.getNewHight(paramMap);
				ArrayList<HashMap<String,Object>> newhight 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", newhight);
			}
			
		// 한식
		}else if(kind.equals("한식")) {
			
			/* paramMap.put("key", key); */
			paramMap.put("kind", kind);
			paramMap.put("cnt", 0);
			ps.getAllCountByKind(paramMap);
			
			session.removeAttribute("submenu");
			Paging paging = new Paging();
			paging.setPage(page);		
			paging.setTotalCount((int)paramMap.get("cnt"));
			request.setAttribute("paging" , paging );
			//request.setAttribute("key", key);
			
			System.out.println(kind);
			System.out.println(sort);
			System.out.println(bestyn);
			System.out.println("~~한끝~~");
			
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			
			if(sort.equals("recently")){
				//최신
				ps.getKind(paramMap);
				ArrayList<HashMap<String,Object>> list 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", list);
				
			}else if(sort.equals("low_price")){
				//가격낮은순
				ps.getLow(paramMap);
				ArrayList<HashMap<String,Object>> low 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", low);
				
			}else{
				//가격높은순
				ps.getHight(paramMap);
				ArrayList<HashMap<String,Object>> hight 
					= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", hight);
			}
			
			
		// 중식	
		}else if(kind.equals("중식")){
			
			/* paramMap.put("key", key); */
			paramMap.put("kind", kind);
			paramMap.put("cnt", 0);
			ps.getAllCountByKind(paramMap);
			
			session.removeAttribute("submenu");
			Paging paging = new Paging();
			paging.setPage(page);		
			paging.setTotalCount((int)paramMap.get("cnt"));
			request.setAttribute("paging" , paging );
			//request.setAttribute("key", key);
			
			System.out.println(kind);
			System.out.println(sort);
			System.out.println(bestyn);
			System.out.println("~~중끝~~");
			
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			
			if(sort.equals("recently")){
				//최신
				ps.getKind(paramMap);
				ArrayList<HashMap<String,Object>> list 
				= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", list);
			}else if(sort.equals("low_price")){
				//가격낮은순
				ps.getLow(paramMap);
				ArrayList<HashMap<String,Object>> low 
				= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", low);
			}else{
				//가격높은순
				ps.getHight(paramMap);
				ArrayList<HashMap<String,Object>> hight 
				= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", hight);
			}
			
		// 양식		
		}else if(kind.equals("양식")){
			
			/* paramMap.put("key", key); */
			paramMap.put("kind", kind);
			paramMap.put("cnt", 0);
			ps.getAllCountByKind(paramMap);
			
			session.removeAttribute("submenu");
			Paging paging = new Paging();
			paging.setPage(page);		
			paging.setTotalCount((int)paramMap.get("cnt"));
			request.setAttribute("paging" , paging );
			//request.setAttribute("key", key);
			
			System.out.println(kind);
			System.out.println(sort);
			System.out.println(bestyn);
			System.out.println("~~양끝~~");
			
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			
			if(sort.equals("recently")){
				//최신
				ps.getKind(paramMap);
				ArrayList<HashMap<String,Object>> list 
				= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", list);
			}else if(sort.equals("low_price")){
				//가격낮은순
				ps.getLow(paramMap);
				ArrayList<HashMap<String,Object>> low 
				= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", low);
			}else{
				//가격높은순
				ps.getHight(paramMap);
				ArrayList<HashMap<String,Object>> hight 
				= (ArrayList<HashMap<String,Object>>)paramMap.get("ref_cursor");
				request.setAttribute("mproductVoList", hight);
			}
		}
		request.setAttribute("kind", kind);
		request.setAttribute("bestyn", bestyn); // 2,3,4,5page 볼때 값을 넘겨주는걸로 셋팅
		request.setAttribute("newyn", newyn);
		request.setAttribute("sort", sort);
		request.setAttribute("idx", idx);
		
		return url;
	}
	
}