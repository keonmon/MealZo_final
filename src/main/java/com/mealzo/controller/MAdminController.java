package com.mealzo.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mealzo.dto.AdminPaging;
import com.mealzo.dto.MAdminVO;
import com.mealzo.dto.MAskVO;
import com.mealzo.dto.MEventVO;
import com.mealzo.dto.MNoticeVO;
import com.mealzo.dto.MProductVO;
import com.mealzo.dto.MQnaVO;
import com.mealzo.service.MAdminService;
import com.mealzo.service.MEventService;
import com.mealzo.service.MMemberService;
import com.mealzo.service.MNoticeService;
import com.mealzo.service.MOrderService;
import com.mealzo.service.MProductService;
import com.mealzo.service.MQnaService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MAdminController {

	@Autowired
	MProductService ps;

	@Autowired
	MAdminService as;

	@Autowired
	MOrderService os;
	
	@Autowired
	MQnaService qs;

	@Autowired
	MEventService es;

    @Autowired
    MNoticeService ns;
    
    @Autowired
    MMemberService ms;

	@Autowired
	ServletContext context;
	

	@RequestMapping("admin")
	public ModelAndView adminLoginForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("admin/adminLogin");
		} else {
			mav.setViewName("redirect:/adminProductList");
		}
		return mav;
	}

	@RequestMapping("adminLogin")
	public ModelAndView adminLogin(HttpServletRequest request, @ModelAttribute("avo") @Valid MAdminVO madminvo,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminLogin");

		if (result.getFieldError("id") != null)
			mav.addObject("msg", result.getFieldError("id").getDefaultMessage());
		else if (result.getFieldError("pwd") != null)
			mav.addObject("msg", result.getFieldError("pwd").getDefaultMessage());
		else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", madminvo.getId());
			paramMap.put("ref_cursor", null);
			as.getAdmin(paramMap);

			ArrayList<HashMap<String, Object>> list 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			if (list.size() == 0) {
				mav.addObject("msg", "존재하지 않는 밀조왕입니다.🤷‍♂️");
				return mav;
			}

			HashMap<String, Object> resultMap = list.get(0);
			if (resultMap.get("PWD") == null) {
				mav.addObject("msg", "로그인 오류 - 담당자에게 문의");
			} else if (madminvo.getPwd().equals(resultMap.get("PWD"))) {
				HttpSession session = request.getSession();
				session.setAttribute("loginAdmin", resultMap);
				mav.setViewName("redirect:/adminProductList");
			} else {
				mav.addObject("msg", "저런~ 비밀번호가 틀렸어유!🤦‍♂️");
			}
		}
		return mav;
	}

	@RequestMapping("adminLogout")
	public String adminLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/admin";
	}
	


	@RequestMapping("adminProductList")
	public ModelAndView adminProductList(HttpServletRequest request,
			@RequestParam(value = "sub", required = false) String sub,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {

			// String sub = request.getParameter("sub");
			if (sub != null && sub.equals("y")) {
				session.removeAttribute("key");
				session.removeAttribute("page");
			}

			page = 1;
			key = "";
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			} else if (session.getAttribute("page") != null) {
				page = (int) session.getAttribute("page");
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

			AdminPaging paging = new AdminPaging();
			paging.setPage(page);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("key", key);
			paramMap.put("tableName", "mproduct");
			paramMap.put("culumnName", "name");
			paramMap.put("cnt", 0);
			as.getAllcountAdmin(paramMap);

			
			paging.setTotalCount((int) paramMap.get("cnt"));
			mav.addObject("paging", paging);
			
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			ps.listProduct(paramMap);

			ArrayList<HashMap<String, Object>> mproductList 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			mav.addObject("mproductList", mproductList);
			mav.addObject("key", key);
			
			mav.setViewName("admin/product/productList");
		}
		return mav;
	}

	@RequestMapping("adminOrderList")
	public ModelAndView adminOrderList(HttpServletRequest request,
			@RequestParam(value = "sub", required = false) String sub,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {

			// String sub = request.getParameter("sub");
			if (sub != null && sub.equals("y")) {
				session.removeAttribute("key");
				session.removeAttribute("page");
			}

			page = 1;
			key = "";
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			} else if (session.getAttribute("page") != null) {
				page = (int) session.getAttribute("page");
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

			AdminPaging paging = new AdminPaging();
			paging.setPage(page);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("key", key);
			paramMap.put("tableName", "morder_view");
			paramMap.put("culumnName", "oseq");
			paramMap.put("cnt", 0);
			as.getAllcountAdmin(paramMap);

			paging.setTotalCount((int) paramMap.get("cnt"));
			request.setAttribute("paging", paging);

			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			os.listOrder(paramMap);

			ArrayList<HashMap<String, Object>> orderList 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			System.out.println(orderList);
			request.setAttribute("morderList", orderList);
			request.setAttribute("key", key);

			mav.setViewName("admin/order/morderList");
		}
		return mav;
	}


	@RequestMapping(value = "adminReviewForm"/* , method=RequestMethod.POST */)
	public ModelAndView adminReviewForm(Model model, HttpServletRequest request,
			@RequestParam(value = "sub", required = false) String sub,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key) {// 여기에 네임 적어야하낭

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin 
			= (HashMap<String, Object>) session.getAttribute("loginAdmin");

		if (loginAdmin == null) {
			mav.setViewName("admin/adminLogin");
			return mav;
		} else {

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
			AdminPaging paging = new AdminPaging();
			paging.setPage(page);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();

			paramMap.put("key", key);
			paramMap.put("tableName", "mreview_view");
			paramMap.put("culumnName", "name");
			paramMap.put("cnt", 0);
			as.getAllcountAdmin(paramMap);

			System.out.println(paramMap.get("cnt"));

			int cnt = Integer.parseInt(paramMap.get("cnt").toString());
			paging.setTotalCount(cnt);
			paging.paging(); // 이거 확인 하기 위에랑 다르게 ㅈ거어서 여기서 빨간줄 나와서 바꾼거거든요 건희님껏두 함 봐주세요 페이징저렁 ㄸㅎ깥은
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());

			paramMap.put("ref_cursor_review", null);
			as.adminlistReview(paramMap);
			System.out.println(cnt);
			ArrayList<HashMap<String, Object>> reviewList 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor_review");
			mav.addObject("paging", paging);
			mav.addObject("reviewList", reviewList);
			mav.setViewName("admin/qna/reviewList");

		}
		return mav;
	}

	@RequestMapping("/adminReviewDelete")
	public String adminReviewDelete(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin = (HashMap<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			return "admin/adminLogin";
		} else {
			String[] rseqArr = request.getParameterValues("rseq");
          HashMap<String, Object> paramMap =new  HashMap<String, Object>();
         for(String rseq:rseqArr) {
        	 paramMap.put("rseq", rseq);
          as.deleteReview(paramMap);
         }
      }
    return "redirect:/adminReviewForm";
  }

	
	@RequestMapping("adminProductWriteForm")
	public ModelAndView adminProductWriteForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		if( session.getAttribute("loginAdmin") == null ) {
			mav.setViewName("redirect:/admin");
		}else {
			/*
			String [] kindList = { "","한식", "중식", "양식" };
			mav.addObject("kindList", kindList); 
			*/
			mav.setViewName("admin/product/productWriteForm");
		}
		return mav;
	}
	
	
	@RequestMapping(value="fileup")
	@ResponseBody
	public Map<String, Object> fileup(Model model, HttpServletRequest request){
		String savePath = context.getRealPath("/images");
		HashMap<String,Object> resultMap = new HashMap<String, Object>();
		try {
			MultipartRequest multi = new MultipartRequest(
				request, savePath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy()
			);
			
			resultMap.put("STATUS", 1);
			resultMap.put("FILENAME", multi.getFilesystemName("image"));
			resultMap.put("FILENAME1", multi.getFilesystemName("image1"));
			resultMap.put("FILENAME2", multi.getFilesystemName("image2"));
		}catch(IOException e) { e.printStackTrace();}
		
		return resultMap;
	}
	
	@RequestMapping("/adminAskForm")
	public ModelAndView adminAskForm(HttpServletRequest request ,
			@RequestParam(value = "sub", required = false) String sub,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key
		/*	@RequestParam("arseq") String arseq*/) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin = (HashMap<String, Object>) session.getAttribute("loginAdmin");


		if (loginAdmin == null) {
			mav.setViewName("admin/adminLogin");
			return mav;
		} else {
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
			
			AdminPaging paging = new AdminPaging();
			paging.setPage(page);
			HashMap<String, Object> paramMap = new HashMap<String,Object>();
			paramMap.put("key", key);
			paramMap.put("tableName", "ask_view");
			paramMap.put("culumnName", "pname");
			paramMap.put("culumnName", "content_a");
			paramMap.put("cnt", 0);
			as.getAllcountAdminAsk(paramMap);
			
			
			System.out.println(paramMap.get("cnt"));

			int cnt = Integer.parseInt(paramMap.get("cnt").toString());
			paging.setTotalCount(cnt);
			paging.paging(); // 이거 확인 하기 위에랑 다르게 ㅈ거어서 여기서 빨간줄 나와서 바꾼거거든요 건희님껏두 함 봐주세요 페이징저렁 ㄸㅎ깥은
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());

			paramMap.put("ref_cursor_ask", null);
			as.adminlistAsk(paramMap);
			System.out.println(cnt);
			ArrayList<HashMap<String, Object>> askList 
			= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor_ask");
			mav.addObject("paging", paging);
			mav.addObject("askList", askList);
			mav.setViewName("admin/qna/askList");

		}
			return mav;
	}
  
  
	@RequestMapping("/adminAskDetail")
	public ModelAndView adminAskDetail(HttpServletRequest request, @RequestParam("aseq") int aseq) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin 
			= (HashMap<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			mav.setViewName("admin/adminLogin");
			return mav;
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("aseq", aseq);
			paramMap.put("ref_cusor", null);
			as.getAdminAsk(paramMap);
		

			ArrayList<HashMap<String, Object>> getAdminAsk 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			mav.addObject("dto", getAdminAsk.get(0));

			mav.setViewName("admin/qna/askDetil");

		}
		return mav;
	}

	
	@RequestMapping(value="adminProductWrite", method=RequestMethod.POST)
	public ModelAndView adminProductWrite(HttpServletRequest request,
				@ModelAttribute("pvo") @Valid MProductVO pvo, BindingResult result ) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/product/productWriteForm");
		if(result.getFieldError("name")!=null) {
			mav.addObject("message", result.getFieldError("name").getDefaultMessage());
			return mav;
		}else if(result.getFieldError("kind")!=null) {
			mav.addObject("message", result.getFieldError("kind").getDefaultMessage());
			return mav;
		}else if(result.getFieldError("price1")!=null) {
			mav.addObject("message", "원가를 입력하세요");
			return mav;
		}else if(result.getFieldError("price2")!=null) {
			mav.addObject("message", "판매가를 입력하세요");
			return mav;
		}else if(result.getFieldError("image")!=null) {
			mav.addObject("message", result.getFieldError("image").getDefaultMessage());
			return mav;
		}
		
		HttpSession session = request.getSession();
		if( session.getAttribute("loginAdmin") == null ) {
			mav.setViewName("redirect:/admin");
		}else {
			
			HashMap<String,Object> paramMap = new HashMap<String,Object>();
			paramMap.put("kind", pvo.getKind());
			paramMap.put("name", pvo.getName());
			paramMap.put("bestyn", pvo.getBestyn());
			paramMap.put("useyn", pvo.getUseyn());
			paramMap.put("content", pvo.getContent());
			paramMap.put("price1", pvo.getPrice1());
			paramMap.put("price2", pvo.getPrice2());
			paramMap.put("image", pvo.getImage());
			paramMap.put("image1", pvo.getImage1());
			paramMap.put("image2", pvo.getImage2());
			
			ps.insertProduct(paramMap);
			
			mav.setViewName("redirect:/adminProductList");

		}
		return mav;
	}
	

	@RequestMapping("adminProductUpdateForm")
	public ModelAndView adminProductUpdateForm(HttpServletRequest request, 
			@RequestParam("pseq") int pseq) {

		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {

			// 상품정보 가져오기 (프로시저에서 replyCnt 추가)
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("pseq", pseq);
			paramMap.put("ref_cursor", null);

			ps.getProduct(paramMap);

			ArrayList<HashMap<String, Object>> mproductVOList 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			HashMap<String, Object> resultMap = mproductVOList.get(0);
			MProductVO pvo = new MProductVO();
			pvo.setPseq(Integer.parseInt(resultMap.get("PSEQ").toString()));
			pvo.setKind(resultMap.get("KIND").toString());
			pvo.setName(resultMap.get("NAME").toString());
			pvo.setBestyn((String) resultMap.get("BESTYN"));
			pvo.setUseyn((String) resultMap.get("USEYN"));
			pvo.setContent(resultMap.get("CONTENT").toString());
			pvo.setPrice1(Integer.parseInt(resultMap.get("PRICE1").toString()));
			pvo.setPrice2(Integer.parseInt(resultMap.get("PRICE2").toString()));
			pvo.setImage(resultMap.get("IMAGE").toString());

			// 이미지 가져오기
			paramMap.put("ref_cursor_Image1", null);
			paramMap.put("ref_cursor_Image2", null);
			ps.getImages(paramMap);

			ArrayList<HashMap<String, Object>> image1List 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor_Image1");
			ArrayList<HashMap<String, Object>> image2List 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor_Image2");
			HashMap<String, Object> mpdimg1 = image1List.get(0);
			HashMap<String, Object> mpdimg2 = image2List.get(0);
			pvo.setImage1((String) mpdimg1.get("IMAGE"));
			pvo.setImage2((String) mpdimg2.get("IMAGE"));

			mav.addObject("pvo", pvo);

			mav.setViewName("admin/product/productUpdateForm");
		}
		return mav;
	}

	@RequestMapping(value = "adminProductUpdate", method = RequestMethod.POST)
	public ModelAndView adminProductUpdate(HttpServletRequest request, 
			@ModelAttribute("pvo") @Valid MProductVO pvo,
			BindingResult result) {
		ModelAndView mav = new ModelAndView();
		// System.out.println(pvo.getImage() + " " + pvo.getImage1() + " " + pvo.getImage2());
		mav.setViewName("admin/product/productUpdateForm");
		if (result.getFieldError("name") != null) {
			mav.addObject("message", result.getFieldError("name").getDefaultMessage());
			return mav;
		} else if (result.getFieldError("kind") != null) {
			mav.addObject("message", result.getFieldError("kind").getDefaultMessage());
			return mav;
		} else if (result.getFieldError("price1") != null) {
			mav.addObject("message", "원가를 입력하세요");
			return mav;
		} else if (result.getFieldError("price2") != null) {
			mav.addObject("message", "판매가를 입력하세요");
			return mav;
		} else if (result.getFieldError("image") != null) {
			mav.addObject("message", result.getFieldError("image").getDefaultMessage());
			return mav;
		}

		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
			System.out.println("byn:"+pvo.getBestyn() + "/uyn:"+pvo.getUseyn());
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("pseq", pvo.getPseq());
			paramMap.put("kind", pvo.getKind());
			paramMap.put("name", pvo.getName());
			paramMap.put("bestyn", pvo.getBestyn());
			paramMap.put("useyn", pvo.getUseyn());
			paramMap.put("content", pvo.getContent());
			paramMap.put("price1", pvo.getPrice1());
			paramMap.put("price2", pvo.getPrice2());
			paramMap.put("image", pvo.getImage());
			paramMap.put("image1", pvo.getImage1());
			paramMap.put("image2", pvo.getImage2());

			ps.updateProduct(paramMap);

			mav.setViewName("redirect:/adminProductList");

		}

		return mav;
	}
	
	@RequestMapping(value="/adminAskRepSave"  /*, method = RequestMethod.POST */)
	public String adminAskForm(HttpServletRequest request,
			 @ModelAttribute("dto") @Valid MAskVO maskvo, BindingResult result,
			 @RequestParam("aseq") int aseq,
			 @RequestParam("content_r") String content_r, Model model
			 ){
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin 
			= (HashMap<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			return "admin/adminLogin";
		}else if (result.getFieldError("content_r") != null) {
			model.addAttribute("message", "답글을 작성해주세요 ");
			model.addAttribute("aseq", aseq);
			   return "admin/qna/askDetil";
			}
	HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("aseq", aseq);
		paramMap.put("content_r", content_r);
		as.adminAskReply(paramMap);
		
		return "redirect:/adminAskDetail?aseq=" + aseq;
		
	}
	
	@RequestMapping("/adminAskUpdate")
	public ModelAndView adminAskUpdate(HttpServletRequest request,
		 @RequestParam("aseq") int aseq,
		 @RequestParam("content_r") String content_r,
		 @ModelAttribute("dto") @Valid MAskVO maskvo, BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin 
			= (HashMap<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
		mav.setViewName( "admin/adminLogin");
		return mav;
		}else if (result.getFieldError("content_r") != null) {
			mav.addObject("message", "답글을 작성해주세요 ");
			mav.addObject("aseq", aseq);
			mav.setViewName("admin/qna/askDetil");
			return mav;
		}
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("aseq", maskvo.getAseq());
		paramMap.put("content_r", maskvo.getContent_r());
		as.adminAskUpdate(paramMap);
		
		mav.addObject("aseq", aseq);
		mav.setViewName("redirect:/adminAskDetail");
		return mav;
	}
	
	
	@RequestMapping("adminProductDelete")
	public ModelAndView adminProductDelete(HttpServletRequest request,
			@RequestParam("pseq")int pseq) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
			// mpdimg mpdimg2 mproduct 순서로 해당 pseq 레코드를 삭제해야함
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("pseq", pseq);
			ps.deleteProduct(paramMap);
			
			mav.setViewName("redirect:/adminProductList");
		}
		return mav;
	}
	
	@RequestMapping("adminOrderSave")
	public ModelAndView adminOrderSave(HttpServletRequest request,
			@RequestParam("selectedIndex")int selectedIndex,
			@RequestParam("result")String[] odseqArr) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			for(String odseq : odseqArr) {
				paramMap.put("odseq", Integer.parseInt( odseq ));
				paramMap.put("selectedIndex", selectedIndex);
				os.updateOrderResult(paramMap);
			}
			mav.setViewName("redirect:/adminOrderList");
		}
		return mav;
	}
	

	@RequestMapping("adminQnaList")
	public ModelAndView adminQnaList(HttpServletRequest request,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
    HashMap<String, Object> loginAdmin 
        = (HashMap<String, Object>) session.getAttribute("loginAdmin");
    if (loginAdmin == null) {
    mav.setViewName("admin/adminLogin");
    return mav;
    } else {
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
			
			AdminPaging paging = new AdminPaging();
			paging.setPage(page);;
			HashMap<String, Object> paramMap = new HashMap<String,Object>();
			paramMap.put("key", key);
			paramMap.put("tableName", "mqna");
			paramMap.put("culumnName", "subject");
	     	paramMap.put("culumnName", "id");
			paramMap.put("cnt", 0);
			as.getAllcountAdmin(paramMap);
			
			
			System.out.println(paramMap.get("cnt" + "확인"));

			int cnt = Integer.parseInt(paramMap.get("cnt").toString());
			paging.setTotalCount(cnt);
			paging.paging(); // 이거 확인 하기 위에랑 다르게 ㅈ거어서 여기서 빨간줄 나와서 바꾼거거든요 건희님껏두 함 봐주세요 페이징저렁 ㄸㅎ깥은
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());

			paramMap.put("ref_cursor_qna", null);
			as.adminlistQna(paramMap);
			System.out.println(cnt);
			ArrayList<HashMap<String, Object>> qnaList
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor_qna");
			mav.addObject("paging", paging);
			mav.addObject("mqnaList", qnaList);
			mav.setViewName("admin/qna/qnaList");
			
		//	System.out.println(qnaList);

		}
			return mav;
	}      
      
      

                                   
	@RequestMapping("adminEventList")
	public ModelAndView adminEventList(HttpServletRequest request,
			@RequestParam(value = "sub", required = false) String sub,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
    

		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");

		} else {
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
			AdminPaging paging = new AdminPaging();
			paging.setPage(page);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("key", key);
			paramMap.put("tableName", "mevent");
			paramMap.put("culumnName", "title");
			paramMap.put("cnt", 0);
			as.getAllcountAdmin(paramMap);

			System.out.println("cnt: " + paramMap.get("cnt"));
			
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
			System.out.println(eventList);
			
			mav.setViewName("admin/customerCenter/adminEventList");
		}
		return mav;
	}



	
	// VO에 담아서 소문자로 뿌려지도록 한다.
	@RequestMapping("adminQnaDetail")
	public ModelAndView adminqnadetail(@RequestParam("qseq") int qseq, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin 
			= (HashMap<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			mav.setViewName("admin/adminLogin");
			return mav;
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("qseq", qseq);
			paramMap.put("ref_cursor", null);
			qs.getQna(paramMap);

			ArrayList<HashMap<String, Object>> list 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			mav.addObject("mqnaVO", list.get(0));
			mav.setViewName("admin/qna/qnaDetil");

			// request.setAttribute("message", message);
		}
		return mav;
	}

	// jsp에 소문자로 담기니까 키값을 jsp와 일치시킨다.
	@RequestMapping("/adminQnaRepSave")
	public ModelAndView admin_qna_repSave(HttpServletRequest request, @RequestParam("qseq") String qseq,
			@RequestParam("reply") String reply, @ModelAttribute("qvo") @Valid MQnaVO qvo, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin 
			= (HashMap<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			mav.setViewName("admin/adminLogin");
			return mav;
		} else if (result.getFieldError("reply") != null) {
			mav.addObject("message", result.getFieldError("reply").getDefaultMessage());
			mav.addObject("qseq", qseq);
			mav.setViewName("admin/qna/qnaDetil");
			return mav;
		}
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		// paramMap.put("qseq", qseq);
		paramMap.put("qseq", qvo.getQseq());
		paramMap.put("reply", qvo.getReply());

		as.admininsertQna(paramMap);

		mav.addObject("qseq", qseq);
		mav.setViewName("redirect:/adminQnaDetail");

		return mav;
	}



	@RequestMapping("adminNoticeInsertForm")
	public ModelAndView adminNoticeInsertForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {

			mav.setViewName("admin/customerCenter/adminNoticeInsert");
		}
		return mav;
	}
  
	@RequestMapping("adminNoticeInsert")
	public ModelAndView adminNoticeInsert(HttpServletRequest request,
				@ModelAttribute("nvo") @Valid MNoticeVO nvo, BindingResult result) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("subject:" + nvo.getSubject() + "/ content:" + nvo.getContent());
		System.out.println("IMAGE1:" + nvo.getImage1());
		
		mav.setViewName("admin/customerCenter/adminNoticeInsert");
		if(result.getFieldError("subject")!=null) {
			System.out.println("subject:" + nvo.getSubject() + "/ content:" + nvo.getContent());
			mav.addObject("message", result.getFieldError("subject").getDefaultMessage());
			return mav;
		}else if(result.getFieldError("content")!=null) {
			System.out.println("subject:" + nvo.getSubject() + "/ content:" + nvo.getContent());
			mav.addObject("message", result.getFieldError("content").getDefaultMessage());
			return mav;
		}
		
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin 
			= (HashMap<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			mav.setViewName("admin/adminLogin");
			return mav;
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("subject", nvo.getSubject());
			paramMap.put("useyn", nvo.getUseyn());
			paramMap.put("content", nvo.getContent());
			paramMap.put("image1", nvo.getImage1());
			ns.insertNotice(paramMap);
			
			mav.setViewName("redirect:/adminNoticeList");
		}
		return mav;
	}
	
	
	@RequestMapping("adminNoticeDetail")
	public ModelAndView adminNoticeDetail(HttpServletRequest request, 
			@RequestParam("nseq") int nseq) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("nseq", nseq);
			paramMap.put("ref_cursor", null);

			ns.getNoticeOne(paramMap);

			ArrayList<HashMap<String, Object>> MNoticeVOList 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			HashMap<String, Object> resultMap = MNoticeVOList.get(0);
			
			MNoticeVO nvo = new MNoticeVO();
			nvo.setNseq(nseq);
			nvo.setSubject(resultMap.get("SUBJECT").toString());
			nvo.setIndate((Timestamp)resultMap.get("INDATE"));
			nvo.setUseyn((String) resultMap.get("USEYN"));
			nvo.setContent(resultMap.get("CONTENT").toString());
			nvo.setImage1((String) resultMap.get("IMAGE1"));

			mav.addObject("nvo", nvo);
			
			mav.setViewName("admin/customerCenter/adminNoticeDetail");
		}
		return mav;
	}
	
	
	@RequestMapping("adminNoticeUpdate")
	public ModelAndView adminNoticeUpdate(HttpServletRequest request, 
			@ModelAttribute("nvo") @Valid MNoticeVO nvo, BindingResult result,
			/* @RequestParam("oldImage") int oldImage, */
			@RequestParam(value="nseq",required=false) Integer nseq) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("subject:" + nvo.getSubject() + "/ content:" + nvo.getContent());
		System.out.println("IMAGE1:" + nvo.getImage1() + "/ nseq:" + nseq);
		
		mav.setViewName("admin/customerCenter/adminNoticeDetail");
		if(result.getFieldError("subject")!=null) {
			System.out.println("subject:" + nvo.getSubject() + "/ content:" + nvo.getContent());
			mav.addObject("message", result.getFieldError("subject").getDefaultMessage());
			return mav;
		}else if(result.getFieldError("content")!=null) {
			System.out.println("subject:" + nvo.getSubject() + "/ content:" + nvo.getContent());
			mav.addObject("message", result.getFieldError("content").getDefaultMessage());
			return mav;
		}
		
		HttpSession session = request.getSession();
		HashMap<String, Object> loginAdmin 
			= (HashMap<String, Object>) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			mav.setViewName("admin/adminLogin");
			return mav;
		} else {
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("nseq", nseq);
			paramMap.put("subject", nvo.getSubject());
			paramMap.put("useyn", nvo.getUseyn());
			paramMap.put("content", nvo.getContent());
			paramMap.put("image1", nvo.getImage1());
			ns.updateNotice(paramMap);
			
			mav.setViewName("redirect:/adminNoticeList");
		}
		return mav;
	}

	
  
  @RequestMapping("adminNoticeList")
  public ModelAndView adminNoticeList(HttpServletRequest request,
          @RequestParam(value = "sub", required = false) String sub,
          @RequestParam(value = "page", required = false) Integer page,
          @RequestParam(value = "key", required = false) String key) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = request.getSession();
      if (session.getAttribute("loginAdmin") == null) {
          mav.setViewName("redirect:/admin");
      } else {
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
          AdminPaging paging = new AdminPaging();
          paging.setPage(page);
          HashMap<String, Object> paramMap = new HashMap<String, Object>();
          paramMap.put("key", key);
          paramMap.put("tableName", "notice");
          paramMap.put("culumnName", "subject");
          paramMap.put("cnt", 0);
          as.getAllcountAdmin(paramMap);

          System.out.println("cnt: " + paramMap.get("cnt"));    // <<< 게시물 개수 카운트된 수 확인
          
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
          
          System.out.println(noticeList);            // <<< 조회된 게시물리스트
          
          mav.setViewName("admin/customerCenter/adminNoticeList");
      }
      return mav;
  
  }

  @RequestMapping("/adminEventDetail")
  public ModelAndView admineventdetail(HttpServletRequest request,
		  @RequestParam("eseq") int eseq) {
	  ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
			return mav;
		} else {
			HashMap<String, Object> paramMap =new HashMap<String, Object>();
			paramMap.put("eseq",eseq);
			paramMap.put("ref_cursor_event", null);
			as.getEvent(paramMap);
			
			ArrayList<HashMap<String, Object>> list
			=(ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor_event");
			HashMap<String, Object> resultMap = list.get(0);
			MEventVO evo = new MEventVO();
			evo.setEseq(Integer.parseInt(resultMap.get("ESEQ").toString()));
			evo.setTitle(resultMap.get("TITLE").toString());
			evo.setContent(resultMap.get("CONTENT").toString());
			//evo.setImage1(resultMap.get("IMAGE1").toString());
			//evo.setImage2(resultMap.get("IMAGE2").toString());
			evo.setSubtitle(resultMap.get("SUBTITLE").toString());
			evo.setWritedate((Timestamp) resultMap.get("WRITEDATE"));
			evo.setStartdate((Timestamp) resultMap.get("STARTDATE"));
			evo.setEnddate((Timestamp) resultMap.get("ENDDATE"));
			
			paramMap.put("ref_cursor_image1",null);

			as.getImgesEvent(paramMap);
			
			ArrayList<HashMap<String, Object>> image1List 
			= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor_image1");
			
		HashMap<String, Object> mevimg1 = image1List.get(0);
		evo.setImage1((String) mevimg1.get("IMAGE1"));
		evo.setImage2((String) mevimg1.get("IMAGE2"));
		
			
			mav.addObject("evo",evo);
	//		mav.addObject("eseq",eseq);
			mav.setViewName("admin/customerCenter/adminEventDetail");
		}

	  return mav;
	  
  }


  @RequestMapping("/adminEventUpdate")
  public ModelAndView admineventupdate(HttpServletRequest request,
		  @RequestParam("eseq") int eseq,
		  /*@RequestParam("startTime") String startTime,
		  @RequestParam("endTime")  String  endTime,
		  @RequestParam("startDate")  String startDate,
		  @RequestParam("endDate")  String  endDate,*/
	//	  @RequestParam("writedate") String writedate,
		  @ModelAttribute("evo") @Valid MEventVO evo, BindingResult result) {
	  ModelAndView mav = new ModelAndView();
	  
	 
	/*  mav.addObject("estartDate", startDate + " " + startTime + ":00");
	  mav.addObject("eendDate", endDate + " " + endTime + ":59");
	*/
	  String startDate = request.getParameter("startDate") + " " + request.getParameter("startTime")+":00";
	  String endDate = request.getParameter("endDate") + " " + request.getParameter("endTime")+":59";
	  
	 System.out.println(startDate +"~"+ endDate);
	//String estartDate = evo.getStartdate() + "~" + getParameter("startTime");
	//String eendDate = evo.getEnddate() + "~" + getParameter("endTime");
	  
		
		mav.setViewName("admin/customerCenter/adminEventDetail");
	  if(result.getFieldError("title") !=null) {
		  mav.addObject("message", result.getFieldError("title").getDefaultMessage());
	 return mav;
	  }else if (result.getFieldError("content") !=null) {
		  mav.addObject("message", result.getFieldError("content").getDefaultMessage());
			 return mav;
	  }else if (result.getFieldError("image1") !=null) {
		  mav.addObject("message", result.getFieldError("image1").getDefaultMessage());
			 return mav;
	  }else if (result.getFieldError("image2") !=null) {
		  mav.addObject("message", result.getFieldError("image2").getDefaultMessage());
			 return mav;
	  }else if (result.getFieldError("subtitle") !=null) {
		  mav.addObject("message", result.getFieldError("subtitle").getDefaultMessage());
			 return mav;
	/*  }else if (result.getFieldError("startdate") !=null) {
		  mav.addObject("message", result.getFieldError("startdate").getDefaultMessage());
			 return mav;
	  }else if (result.getFieldError("enddate") !=null) {
		  mav.addObject("message", result.getFieldError("enddate").getDefaultMessage());
			 return mav; */
	  }
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		}else {
			System.out.println("이벤트" + evo.getTitle());
			HashMap<String, Object> paramMap = new HashMap<String , Object>();
			paramMap.put("eseq", evo.getEseq());
			paramMap.put("title", evo.getTitle());
			paramMap.put("content", evo.getContent());
			paramMap.put("image1", evo.getImage1());
			paramMap.put("image2", evo.getImage2());
			paramMap.put("subtitle", evo.getSubtitle());
			paramMap.put("startdate", evo.getStartdate());
			paramMap.put("enddate", evo.getEnddate());
		//	paramMap.put("writedate" ,evo.getWritedate());
			as.eventUpdate(paramMap);
			
			mav.addObject("eseq", eseq);
			evo.setStartdate(Timestamp.valueOf(startDate));
			evo.setEnddate(Timestamp.valueOf(endDate));
			mav.addObject(evo);
			//mav.addObject("endDate", Timestamp.valueOf(endDate));
			mav.setViewName("redirect:/adminEventDetail");
			
		}
	  return mav;
  }
  



	@RequestMapping("adminNoticeSave")
	public ModelAndView adminNoticeSave(HttpServletRequest request, 
			@RequestParam("selectedIndex")String selectedIndex,
			@RequestParam("checkBox_nseq")String[] nseqArr) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			for(String nseq : nseqArr) {
				paramMap.put("nseq", Integer.parseInt( nseq ));
				paramMap.put("selectedIndex", selectedIndex);
				ns.updateNoticeUseyn(paramMap);
			}
			mav.setViewName("redirect:/adminNoticeList");
		}
		return mav;
	}
	

	@RequestMapping("adminMemberList")
	public ModelAndView adminMemberList(HttpServletRequest request,
			@RequestParam(value = "sub", required = false) String sub,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {

			// String sub = request.getParameter("sub");
			if (sub != null && sub.equals("y")) {
				session.removeAttribute("key");
				session.removeAttribute("page");
			}

			page = 1;
			key = "";
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			} else if (session.getAttribute("page") != null) {
				page = (int) session.getAttribute("page");
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

			AdminPaging paging = new AdminPaging();
			paging.setPage(page);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("key", key);
			paramMap.put("tableName", "mmember");
			paramMap.put("culumnName", "name");
			paramMap.put("cnt", 0);
			as.getAllcountAdmin(paramMap);

			
			paging.setTotalCount((int) paramMap.get("cnt"));
			mav.addObject("paging", paging);
			
			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			ms.listMember(paramMap);

			ArrayList<HashMap<String, Object>> memberList 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			System.out.println(memberList);
			mav.addObject("memberList", memberList);
			mav.addObject("key", key);
			
			mav.setViewName("admin/member/mmemberList");
		}
		return mav;
	}
	
	
	@RequestMapping("adminMemberSave")
	public ModelAndView adminMemberSave(HttpServletRequest request, 
			@RequestParam("selectedIndex")String selectedIndex,
			@RequestParam("useyn")String[] idArr) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			for(String id : idArr) {
				paramMap.put("id", id);
				paramMap.put("selectedIndex", selectedIndex);
				ms.updateMemberResult(paramMap);
			}
			mav.setViewName("redirect:/adminMemberList");
		}
		return mav;
	}
	

	@RequestMapping("adminProductSave")
	public ModelAndView adminProductSave(HttpServletRequest request,
			@RequestParam("selectedIndex") String selectedIndex, @RequestParam("checkBox_pseq") String[] pseqArr) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			for (String pseq : pseqArr) {
				// mdao.updateMemberResult(name, selectedIndex);
				paramMap.put("pseq", Integer.parseInt(pseq));
				paramMap.put("selectedIndex", selectedIndex);
				ps.updateProductUseyn(paramMap);
			}
			mav.setViewName("redirect:/adminProductList");
		}
		return mav;
	}

	@RequestMapping("/adminEventInsertForm")
	public ModelAndView adminEventinsertform(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {

			mav.setViewName("admin/customerCenter/adminEventInsertForm");
		}
		return mav;
	}
        
	@RequestMapping("adminBannerList")
	public ModelAndView adminBannerList(HttpServletRequest request,
			@RequestParam(value = "sub", required = false) String sub,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "key", required = false) String key,
			@RequestParam(value = "message", required = false) String message ) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
	
			// String sub = request.getParameter("sub");
			if (sub != null && sub.equals("y")) {
				session.removeAttribute("key");
				session.removeAttribute("page");
			}
	
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
	
			paramMap.put("ref_cursor", null);
			as.getBannerList(paramMap);
			
			ArrayList<HashMap<String, Object>> bannerList 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			System.out.println(bannerList);
			request.setAttribute("bannerList", bannerList);
			mav.addObject("message", message);
			
			mav.setViewName("admin/banner/adminBannerList");
		}
		return mav;
	}
	
	
	@Transactional(rollbackFor = Exception.class)
	@RequestMapping("bannerSave")
	public ModelAndView bannerSave(HttpServletRequest request,
		@RequestParam(value = "num", required = false) int[] numArr,
		@RequestParam(value = "name", required = false) String[] nameArr,
		@RequestParam(value = "image", required = false) String[] imageArr,
		@RequestParam(value = "url", required = false) String[] urlArr) {
	
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		if (session.getAttribute("loginAdmin") == null) {
			mav.setViewName("redirect:/admin");
		} else {
			/*
			System.out.println(numArr[0]);
			System.out.println(nameArr[0]);
			System.out.println(imageArr[0]);
			System.out.println(urlArr[0]);
			*/
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			
			// 모든 배너 삭제
			as.deleteBanner();
			
			// 넘어온 배열 파라미터로 배너 재배치하는 반복문
			for(int i = 0; i< numArr.length; i++) {
				paramMap.put("num", numArr[i]);
				paramMap.put("name", nameArr[i]);
				paramMap.put("image", imageArr[i]);
				paramMap.put("url", urlArr[i]);
				as.insertBanner(paramMap);
			}
			mav.addObject("message","배너 설정이 완료되었습니다.");
			mav.setViewName("redirect:/adminBannerList");
		}
		return mav;
	}
	
	@RequestMapping("imageLoad")
	public String imageLoad(HttpServletRequest request,
		@RequestParam(value = "num", required = false) int num) {
		request.setAttribute("num", num);
		return "admin/banner/imageLoad";
	}
	

    @RequestMapping("/adminEventInsert")
    public ModelAndView adminEventinsert(HttpServletRequest request, @RequestParam("startTime") String startTime,
    		@RequestParam("endTime") String endTime, 
    		@RequestParam("startdate") String startdate,  
    		@RequestParam("enddate") String enddate, 
    		@ModelAttribute("evo") @Valid MEventVO evo, BindingResult result	) {
    	
    	ModelAndView mav= new ModelAndView();
    	 mav.setViewName("admin/customerCenter/adminEventInsertForm");
   	  if(result.getFieldError("title") !=null) {
   		  mav.addObject("message", result.getFieldError("title").getDefaultMessage());
   	 return mav;
   	  }else if (result.getFieldError("content") !=null) {
   		  mav.addObject("message", result.getFieldError("content").getDefaultMessage());
   			 return mav;
   	  }else if (result.getFieldError("image1") !=null) {
   		  mav.addObject("message", result.getFieldError("image1").getDefaultMessage());
   			 return mav;
   	  }else if (result.getFieldError("image2") !=null) {
   		  mav.addObject("message", result.getFieldError("image2").getDefaultMessage());
   			 return mav;  
   	  }else if (result.getFieldError("subtitle") !=null) {
   		  mav.addObject("message", result.getFieldError("subtitle").getDefaultMessage());
   			 return mav;
/*	 }else if (result.getFieldError("startdate") !=null) {
   		  mav.addObject("message", result.getFieldError("startdate").getDefaultMessage());
   			 return mav;
   	  }else if (result.getFieldError("enddate") !=null) {
   		  mav.addObject("message", result.getFieldError("enddate").getDefaultMessage());
   			 return mav;  */
   	  }
   		HttpSession session = request.getSession();
   		if (session.getAttribute("loginAdmin") == null) {
   			mav.setViewName("redirect:/admin");
   		}else {
   			HashMap<String, Object> paramMap = new HashMap<String, Object>();
   			paramMap.put("eseq", evo.getEseq());
			paramMap.put("title", evo.getTitle());
			paramMap.put("content", evo.getContent());
			paramMap.put("image1", evo.getImage1());
			paramMap.put("image2", evo.getImage2());
			paramMap.put("subtitle", evo.getSubtitle());
			paramMap.put("startdate", evo.getStartdate());
			paramMap.put("enddate", evo.getEnddate());
			
			as.eventInsert(paramMap);
			
		//	mav.addObject("eseq", evo.getEseq());
			mav.addObject("endTime", endTime);
			mav.addObject("startTime", startTime);
			mav.setViewName("redirect:/adminEventList");
   		}
    	
    	return mav;
    	
    }
    
    
    @RequestMapping("/adminEventDelete")
    public ModelAndView adminEventDelete(HttpServletRequest request, 
    		@RequestParam("eseq") int eseq) {
    	ModelAndView mav= new ModelAndView();
    	HttpSession session = request.getSession();
   		if (session.getAttribute("loginAdmin") == null) {
   			mav.setViewName("redirect:/admin");
   			return mav;
   		}else {
   			HashMap<String , Object>paramMap = new HashMap<String, Object>();
   			paramMap.put("eseq", eseq);
   			as.eventDelete(paramMap);
   		
    	mav.setViewName("redirect:/adminEventList");
    	
   		}
   		return mav;
    	
    }

}

