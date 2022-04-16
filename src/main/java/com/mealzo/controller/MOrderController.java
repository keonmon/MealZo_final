package com.mealzo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mealzo.dto.Paging;
import com.mealzo.service.MCartService;
import com.mealzo.service.MOrderService;

@Controller
public class MOrderController {

	@Autowired
	MOrderService os;
	
	@Autowired
	MCartService cs;
	
	
	
	@RequestMapping(value="/orderInsert")
	public String orderInsert( HttpServletRequest request ) {
		
		int oseq = 0;
		int cnt = 0;
		
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		
		if( loginUser == null ) {
			return "member/login";
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", loginUser.get("ID") );
			paramMap.put("oseq", 0);
			
			os.insertOrder( paramMap );
			
			oseq = Integer.parseInt( paramMap.get("oseq").toString() );
			System.out.println(oseq);
			
			// 카트 개수 세션에 담기
			paramMap.put("cnt", 0);	// 카드 개수 담아올 변수
			cs.getCartCnt(paramMap);
			System.out.println(paramMap.get("cnt"));
			cnt = Integer.parseInt(paramMap.get("cnt").toString());
			session.setAttribute("cartCnt",cnt);
			
		}
		return "redirect:/orderList?oseq="+oseq;
	}
	
	
	
	@RequestMapping(value="/orderList")
		public ModelAndView orderListForm( HttpServletRequest request, Model model ) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser = (HashMap<String, Object>) session.getAttribute("loginUser");
		if( loginUser == null ) {
			mav.setViewName("member/login");	
			return mav;
		} else {
			
			int page=1;
			if(request.getParameter("sub") !=null) {
				session.removeAttribute("page");
			}
			if(request.getParameter("page")!=null) {
				page=Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			}else if(session.getAttribute("page")!=null) {
				page=(Integer)session.getAttribute("page");
			}else {
				session.removeAttribute("page");
			}	
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			Paging paging = new Paging();
			paging.setPage(page); //현재 페이지
			
		
		   paramMap.put("cnt" ,0);
			
			ArrayList<HashMap<String, Object>> finalList 
			= new ArrayList<HashMap<String, Object>>();
			HashMap<String, Object> paramMap1 = new HashMap<String, Object>();
			paramMap1.put("id", loginUser.get("ID") );
			paramMap1.put("ref_cursor", null);
			os.listOrderByIdAll( paramMap1 );   // 현재로그인유저의 진행중인 주문들의 "주문번호들" 조회
			
			ArrayList<HashMap<String, Object>> oseqList 
				= (ArrayList<HashMap<String, Object>>)paramMap1.get("ref_cursor");
			
			for( HashMap<String, Object> result : oseqList ) {
				int oseq = Integer.parseInt( result.get("OSEQ").toString() );   // 주문번호 1개 추출
				HashMap<String, Object> paramMap2 = new HashMap<String, Object>();
				paramMap2.put("oseq", oseq);
				paramMap2.put("reg_cursor", null);
				os.listOrderByOseq(paramMap2);  // 추출할 주문번호를 이용하여 주문 내역(상품들) 조회
				ArrayList<HashMap<String, Object>> orderListByOseq 
				= (ArrayList<HashMap<String, Object>>)paramMap2.get("ref_cursor");
			
			HashMap<String, Object> orderFirst = orderListByOseq.get(0);  // 주문 상품들중 첫번째 주문 추출
			orderFirst.put("PNAME" , (String)orderFirst.get("PNAME") + "포함 " + orderListByOseq.size() + "건" );
			// 추출한 첫번째 상품의 상품명을   "XXX 포함 X건" 이라고 수정
			
			//ovo.setPname(ovo.getPname() + " 포함 " + list2.size()+"건");
			
			int totalPrice = 0;
			for( HashMap<String, Object> order : orderListByOseq ) {
				totalPrice += Integer.parseInt( order.get("QUANTITY").toString() )
									* Integer.parseInt( order.get("PRICE2").toString() ); 
			}
			orderFirst.put("PRICE2", totalPrice);    // 추출한 첫번째 상품의 가격을 총가격으로 수정
			// 주번 번호별 대표 상품(첫번째 상품)을 별도의 리스트로 모아서 model 에 저장
			finalList.add(orderFirst);
			}
			mav.addObject("paging", paging);
			mav.addObject("orderList", finalList);
			mav.setViewName("order/orderList");
		}
		return mav;
	}
	
	
	@RequestMapping(value="/orderDetail")  
	public ModelAndView orderDetail( HttpServletRequest request, Model model,
			@RequestParam(value="oseq",required = false) int oseq,
			@RequestParam(value="message",required = false)String message) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser 
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null ) {
			mav.setViewName("member/login");
		}else {
				HashMap<String, Object> paramMap = new HashMap<String, Object>();
				paramMap.put("oseq", oseq);
				paramMap.put("ref_cursor", null);
				os.listOrderByOseq(paramMap);
				
				ArrayList<HashMap<String, Object>> orderListByOseq 
					= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
				
				int totalPrice = 0;
				for( HashMap<String, Object> order : orderListByOseq ) 
					totalPrice += Integer.parseInt( order.get("QUANTITY").toString() )
										* Integer.parseInt( order.get("PRICE2").toString() ); 
				mav.addObject("message", message);
				mav.addObject("totalPrice", totalPrice);
				mav.addObject("orderList", orderListByOseq);
				mav.addObject("orderDetail", orderListByOseq.get(0));
				mav.addObject("OSEQ",oseq);
				mav.setViewName("order/orderDetail");
		}
		return mav;
	}

	
	@RequestMapping(value="/myPage")  
	public ModelAndView mypage( HttpServletRequest request, Model model ) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null ) {
			mav.setViewName("member/login");
		}else {
			// 최종 mypage.jsp 에 전달될 리스트
			ArrayList<HashMap<String, Object>> finalList 
				= new ArrayList<HashMap<String, Object>>();
			
			// 현재 로그인 중인 유저의   진행중인 주문번호 리스트 조회
			HashMap<String, Object> paramMap1 = new HashMap<String, Object>();
			paramMap1.put("id", loginUser.get("ID") );
			paramMap1.put("ref_cursor", null);
			os.listOrderByIdIng( paramMap1 );   // 현재로그인유저의 진행중인 주문들의 "주문번호들" 조회
			ArrayList<HashMap<String, Object>> oseqList 
				= (ArrayList<HashMap<String, Object>>)paramMap1.get("ref_cursor");
			// 주문번호별 주문내역을 조회
			for( HashMap<String, Object> result : oseqList ) {
				int oseq = Integer.parseInt( result.get("OSEQ").toString() );   // 주문번호 1개 추출
				HashMap<String, Object> paramMap2 = new HashMap<String, Object>();
				paramMap2.put("oseq", oseq);
				paramMap2.put("reg_cursor", null);
				os.listOrderByOseq(paramMap2);  // 추출할 주문번호를 이용하여 주문 내역(상품들) 조회
				
				ArrayList<HashMap<String, Object>> orderListByOseq 
					= (ArrayList<HashMap<String, Object>>)paramMap2.get("ref_cursor");
				
				HashMap<String, Object> orderFirst = orderListByOseq.get(0);  // 주문 상품들중 첫번째 주문 추출
				orderFirst.put("PNAME" , (String)orderFirst.get("PNAME") + "포함 " + orderListByOseq.size() + "건" );
				// 추출한 첫번째 상품의 상품명을   "XXX 포함 X건" 이라고 수정
				
				int totalPrice = 0;
				for( HashMap<String, Object> order : orderListByOseq ) {
					totalPrice += Integer.parseInt( order.get("QUANTITY").toString() )
										* Integer.parseInt( order.get("PRICE2").toString() ); 
				}
				orderFirst.put("PRICE2", totalPrice);    // 추출한 첫번째 상품의 가격을 총가격으로 수정
				// 주번 번호별 대표 상품(첫번째 상품)을 별도의 리스트로 모아서 model 에 저장
				finalList.add(orderFirst);
			}
			mav.addObject("orderList", finalList);	
			mav.addObject("title", " 진행중인 주문내역");
			mav.setViewName("mypage/mypage");
		}		
		
		return mav;
	}
	

	@RequestMapping(value="/orderCancelForm")
	public ModelAndView orderCancelForm( HttpServletRequest request, Model mdoel) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object>loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null) {
			mav.setViewName("member/login");
		} else {
			
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", loginUser.get("ID") );
			paramMap.put("ref_cursor", null);
			os.orderCancelForm( paramMap );
			ArrayList<HashMap<String, Object>> list 
				= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			mav.addObject("cancelList", list);
		int totalPrice =0;
			for( HashMap<String, Object> ovo : list ) {
				totalPrice += Integer.parseInt( ovo.get("QUANTITY").toString() )
						* Integer.parseInt( ovo.get("PRICE2").toString() ); 
			}
			mav.addObject("totalPrice", totalPrice); 
			mav.setViewName("order/orderCancel");
		}
		return mav;
	}

	@RequestMapping(value="/orderCancelDetail")
	public ModelAndView orderCancelDetail( HttpServletRequest request, Model model,
			@RequestParam(value="odseq", required=false) int odseq) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null) {
			mav.setViewName("member/login");
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("odseq", odseq);
			paramMap.put("ref_cursor", null);
			os.listOrderByOseq(paramMap);
			
			ArrayList<HashMap<String, Object>> orderListByOseq 
				= (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			
			int totalPrice = 0;
			for( HashMap<String, Object> order : orderListByOseq ) 
				totalPrice += Integer.parseInt( order.get("QUANTITY").toString() )
									* Integer.parseInt( order.get("PRICE2").toString() ); 
			mav.addObject("totalPrice", totalPrice);
			mav.addObject("orderList", orderListByOseq);
			mav.addObject("orderDetail", orderListByOseq.get(0));
			mav.setViewName("order/orderCancelDetail");
		}
		return mav;
	}


	@RequestMapping(value="/orderCancelUpdate")
	public ModelAndView orderCancelUpdate( HttpServletRequest request, Model model,
			@RequestParam(value="oseq",required = false)int oseq) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object>loginUser
			= (HashMap<String, Object>)session.getAttribute("loginUser");
		if( loginUser == null ) {
			mav.setViewName("member/login");
		} else {
			String[] odseqArr = request.getParameterValues("orderCancel");
			HashMap<String, Object>paramMap = new HashMap<String, Object>();
			
			mav.setViewName("redirect:/orderDetail");
			mav.addObject("message", "이미 배송이 시작된 상품은 주문취소가 불가능합니다.😥");
			mav.addObject("oseq", oseq);
			
			if(odseqArr==null) {
				return mav;
			}else {
				//여기서 result값 검사
				for(String odseq1:odseqArr) {
					paramMap.put("odseq", Integer.parseInt(odseq1));
					paramMap.put("result", 0);
					os.getResultByOdseq(paramMap);
					
					if(Integer.parseInt(paramMap.get("result").toString()) >= 2) {
						System.out.println("odseq="+odseq1 +"/ "
								+ "result = " + Integer.parseInt(paramMap.get("result").toString()));
						return mav;
					}
				}
				for(String odseq1:odseqArr) {
					paramMap.put("odseq", Integer.parseInt(odseq1));
					os.orderCancelUpdate(paramMap);
					mav.addObject("odseq", odseq1);
				}
				mav.setViewName("redirect:/orderCancelForm");
			}
		}
		return mav;
	}
	

	@RequestMapping(value="/orderInsertNow")
	public ModelAndView orderInsertNow(HttpServletRequest request, @RequestParam(value="pseq",required = false) int pseq,
			@RequestParam(value="quantity",required = false) int quantity){
		int oseq=0;
		ModelAndView mav =  new ModelAndView();
		 HttpSession session = request.getSession();
			HashMap<String, Object> loginUser =
	     	(HashMap<String, Object>)session.getAttribute("loginUser");

			if(loginUser==null) {
				mav.setViewName("member/login");
				return mav;
	
		}
			else {
				HashMap<String, Object> paramMap = new HashMap<String , Object>();
				paramMap.put("id", loginUser.get("ID"));
				paramMap.put("pseq", pseq);
				paramMap.put	("oseq", 0);
				paramMap.put("quantity", quantity);
				
				os.orderInsertNow(paramMap);
		//	quantity=Integer.parseInt(paramMap.get("quantity").toString());

				oseq=Integer.parseInt(paramMap.get("oseq").toString());
				System.out.println(oseq);
				   System.out.println(quantity  + pseq );

				
				mav.setViewName("redirect:/orderList?oseq=" +oseq);
			}
		
		return mav;
	}
		
	
}

