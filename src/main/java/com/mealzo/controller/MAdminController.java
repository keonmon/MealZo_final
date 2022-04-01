package com.mealzo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
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
import com.mealzo.dto.MProductVO;
import com.mealzo.service.MAdminService;
import com.mealzo.service.MOrderService;
import com.mealzo.service.MProductService;
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

			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
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
			request.setAttribute("paging", paging);

			paramMap.put("startNum", paging.getStartNum());
			paramMap.put("endNum", paging.getEndNum());
			paramMap.put("ref_cursor", null);
			ps.listProduct(paramMap);

			ArrayList<HashMap<String, Object>> mproductList = (ArrayList<HashMap<String, Object>>) paramMap
					.get("ref_cursor");
			System.out.println(mproductList);
			request.setAttribute("mproductList", mproductList);
			request.setAttribute("key", key);

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

			ArrayList<HashMap<String, Object>> orderList = (ArrayList<HashMap<String, Object>>) paramMap
					.get("ref_cursor");
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
			ArrayList<HashMap<String, Object>> reviewList = (ArrayList<HashMap<String, Object>>) paramMap
					.get("ref_cursor_review");
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

			ArrayList<HashMap<String, Object>> mproductVOList = (ArrayList<HashMap<String, Object>>) paramMap
					.get("ref_cursor");
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

			ArrayList<HashMap<String, Object>> image1List = (ArrayList<HashMap<String, Object>>) paramMap
					.get("ref_cursor_Image1");
			ArrayList<HashMap<String, Object>> image2List = (ArrayList<HashMap<String, Object>>) paramMap
					.get("ref_cursor_Image2");
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
		System.out.println(pvo.getImage() + " " + pvo.getImage1() + " " + pvo.getImage2());
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
	
	
}
