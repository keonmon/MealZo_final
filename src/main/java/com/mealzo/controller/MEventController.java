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
import com.mealzo.service.MEventService;

@Controller
public class MEventController {

	@Autowired
	MEventService es;
	
	@Autowired
	MAdminService as;
	
	@RequestMapping("eventList")
	  public ModelAndView eventList(HttpServletRequest request,
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
	          key = "";
	          if (request.getParameter("page") != null) {
	              page = Integer.parseInt(request.getParameter("page"));
	              session.setAttribute("page", page);
	          } else if (session.getAttribute("page") != null) {
	              page = (Integer) session.getAttribute("page");
	          } else {
	              page = 1;
	              session.removeAttribute("page");

	          }
	          if (request.getParameter("key") != null) {
	              key = request.getParameter("key");
	              session.setAttribute("key", key);
	          } else if (session.getAttribute("key") != null) {
	              key = (String) session.getAttribute("key");
	          } else {
	              session.removeAttribute("key");
	              key = "";
	          }
	          Paging paging = new Paging();
	          paging.setPage(page);
	          HashMap<String, Object> paramMap = new HashMap<String, Object>();
	          paramMap.put("key", key);
	          paramMap.put("tableName", "mevent");
	          paramMap.put("culumnName", "eseq");
	          paramMap.put("cnt", 0);
	          as.getAllcountAdmin(paramMap);
	          
	          paging.setTotalCount((int) paramMap.get("cnt"));
	          mav.addObject("paging", paging);
	          
	          paramMap.put("startNum",paging.getStartNum());
	          paramMap.put("endNum",paging.getEndNum());
	          paramMap.put("ref_cursor", null);
	          es.geteventList(paramMap);
	          
	          ArrayList<HashMap<String, Object>> eventList 
	              = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
	          mav.addObject("eventListVO", eventList);
	          mav.addObject("key", key); 
	          mav.setViewName("customerCenter/eventList");
	      return mav;
	  }
	
	@RequestMapping("eventDetail")
	  public ModelAndView eventDetail(HttpServletRequest request,
			  @RequestParam("eseq") String eseq) {
	      ModelAndView mav = new ModelAndView();
	     
	      HashMap<String, Object> paramMap = new HashMap<String, Object>();
	      //meventVO evo = edao.geteventOne(eseq);
	      paramMap.put("eseq", eseq);
	      
	      es.geteventOne( paramMap );
	      
	      ArrayList< HashMap<String, Object> >list 
			= (ArrayList< HashMap<String, Object>>)paramMap.get("ref_cursor");
	      HashMap<String, Object> evo = list.get(0);
	      
	      mav.addObject("eventVO", evo);     
	      mav.setViewName("customerCenter/eventDetail");
	      
	      return mav;      
	  }
}
