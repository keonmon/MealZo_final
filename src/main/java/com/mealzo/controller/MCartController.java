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

import com.mealzo.service.MCartService;

@Controller
public class MCartController {

	@Autowired
	MCartService cs;
	
	
	@RequestMapping(value="/cartInsert")
	public String cartInsert( HttpServletRequest request, Model model,
			@RequestParam("pseq")int pseq,
			@RequestParam("quantity")int quantity ) {
		
		HttpSession session = request.getSession();
		HashMap<String, Object>loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		if( loginUser == null ) {
			return "member/login";
		} else {
			HashMap<String, Object>paramMap = new HashMap<String, Object>();
			paramMap.put("id", loginUser.get("ID") );
			paramMap.put("pseq", pseq);
			paramMap.put("quantity", quantity);
			
			cs.insertCart( paramMap );
		}
		return "redirect:/cartList";
	}
	
	
	@RequestMapping(value="/cartList")
	public ModelAndView cartList( HttpServletRequest request, Model model) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		if( loginUser == null) {
			mav.setViewName("member/login");
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", loginUser.get("ID") );
			paramMap.put("ref_cursor", null);
			cs.listCart(paramMap);
			ArrayList<HashMap<String, Object>> list
				= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			mav.addObject("cartList", list);
			
			int totalPrice = 0;
			for( HashMap<String, Object> cart : list ) {
				totalPrice += Integer.parseInt( cart.get("QUANTITY").toString() )
									* Integer.parseInt( cart.get("PRICE2").toString() ); 
			}
			mav.addObject("totalPrice", totalPrice);
			mav.setViewName("cart/cartList");
		}
		return mav;
	}
	
	
	@RequestMapping(value="/cartDelete")
	public String cartDelete( HttpServletRequest request,
			@RequestParam("cseq") String [] cseqArr ) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		for( String cseq : cseqArr ) {
			paramMap.put("cseq", cseq);
			cs.deleteCart(paramMap);
		}
		return "redirect:/cartList";
	}
}

























