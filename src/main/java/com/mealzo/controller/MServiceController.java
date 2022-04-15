package com.mealzo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mealzo.dto.Paging;
import com.mealzo.service.MAdminService;
import com.mealzo.service.MNoticeService;

@Controller
public class MServiceController {

	@Autowired
	MNoticeService ns;
	
	@Autowired
	MAdminService as;
	
	@RequestMapping(value = "/company")
	public String company() {
		return "service/company";
	}
	
	@RequestMapping(value = "/agreement")
	public String agreement() {
		return "service/agreement";
	}
		
	@RequestMapping(value = "/privacy")
	public String privacy() {
		return "service/privacy";
	}
	
	@RequestMapping("noticeList")
	  public ModelAndView noticeList(HttpServletRequest request,
	          @RequestParam(value = "sub", required = false) String sub,
	          @RequestParam(value = "page", required = false) Integer page,
	          @RequestParam(value = "key", required = false) String key) {
	      ModelAndView mav = new ModelAndView();
	      HttpSession session = request.getSession();

	          if (request.getParameter("sub") != null) {
	              session.removeAttribute("page");
	              session.removeAttribute("key");
	          }
	          page = 1;
	          if (request.getParameter("page") != null) {
	              page = Integer.parseInt(request.getParameter("page"));
	              session.setAttribute("page", page);
	          } else if (session.getAttribute("page") != null) {
	              page = (Integer) session.getAttribute("page");
	          } else {
	              page = 1;
	              session.removeAttribute("page");

	          }
	          Paging paging = new Paging();
	          paging.setPage(page);
	          HashMap<String, Object> paramMap = new HashMap<String, Object>();
	          paramMap.put("cnt", 0);
	          ns.getAllCountNotice(paramMap);
	          
	          paging.setTotalCount((int) paramMap.get("cnt"));
	          mav.addObject("paging", paging);
	          
	          paramMap.put("startNum",paging.getStartNum());
	          paramMap.put("endNum",paging.getEndNum());
	          paramMap.put("ref_cursor", null);
	          ns.getNoticeList(paramMap);
	          
	          ArrayList<HashMap<String, Object>> noticeList 
	              = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
	          mav.addObject("noticeList", noticeList);
	          mav.addObject("key", key); 
	          
	          mav.setViewName("customerCenter/noticeList");
	      return mav;
	  }
	
	@RequestMapping("noticeDetail")
	  public ModelAndView noticeDetail(HttpServletRequest request,
			  @RequestParam("nseq") String nseq) {
	      ModelAndView mav = new ModelAndView();
	     
	      HashMap<String, Object> paramMap = new HashMap<String, Object>();
	      //noticeVO nvo = ndao.getNoticeOne(nseq);	
	      paramMap.put("nseq", nseq);
	      
	      ns.getNoticeOne( paramMap );
	      
	      ArrayList< HashMap<String, Object> >list 
			= (ArrayList< HashMap<String, Object>>)paramMap.get("ref_cursor");
	      HashMap<String, Object> nvo = list.get(0);
	      
	      mav.addObject("noticeVO", nvo);     
	      mav.setViewName("customerCenter/noticeDetail");
	      return mav;
	  }


}
