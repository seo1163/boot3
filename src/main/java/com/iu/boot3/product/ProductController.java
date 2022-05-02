package com.iu.boot3.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.boot3.member.MemberVO;
import com.iu.boot3.util.Pager;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "product";
	}
	
	
	
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(ProductFilesVO productFilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println(productFilesVO.getFileNum());
		int result = productService.setFileDelete(productFilesVO);
		
		
		mv.setViewName("common/result");
		mv.addObject("result",result);
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ProductVO productVO)throws Exception{
		//parameter는 productNum
		//모든 구매자가 보는 페이지
		ModelAndView mv = new ModelAndView();
		productVO = productService.getDetail(productVO);
		mv.setViewName("product/detail");
		mv.addObject("vo",productVO);
		return mv;
	}
	
	@GetMapping("manageDetail")
	public ModelAndView getManageDetail(ProductVO productVO)throws Exception{
		//판매자가 보는 페이지
		//parameter는 productNum		
		ModelAndView mv = new ModelAndView();
		productVO=productService.getDetail(productVO);
		mv.setViewName("product/manageDetail");
		mv.addObject("vo",productVO);
		return mv;
	}
	
	
	@PostMapping("add")
	public ModelAndView setAdd(ProductVO productVO, MultipartFile [] files, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO =(MemberVO)session.getAttribute("member");
		productVO.setId(memberVO.getId());
		

		int result = productService.setAdd(productVO, files);
		mv.setViewName("common/result");
		mv.addObject("result", result);
		return mv;
	}
	@GetMapping("ajaxList")
	public ModelAndView getAjaxList(Pager pager, HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		pager.setId(memberVO.getId());		
		List<ProductVO> ar = productService.getList(pager);
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("common/productList");
		return mv;
		
	}
	
	@GetMapping("add")
	public ModelAndView setAdd()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/add");
		return mv;
	}
	
	@GetMapping("list")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar = productService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("product/list");
		return mv;
	}
	
	@GetMapping("manage")
	public ModelAndView manage(Pager pager,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		pager.setId(memberVO.getId());
		List<ProductVO>ar=productService.getList(pager);
		mv.addObject("list",ar);
		
		mv.setViewName("product/manage");
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(ProductVO productVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		productVO = productService.getDetail(productVO);
		mv.setViewName("product/update");
		mv.addObject("vo", productVO);
		return mv;
	}
	@PostMapping("update")
	public ModelAndView setUpdate(ProductVO productVO, MultipartFile [] files) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("POST UPDATE");
		int result = productService.setUpdate(productVO, files);
		if(result>0) {
			
			mv.setViewName("redirect:./manage");
		}else {
			mv.setViewName("common/getResult");
			mv.addObject("msg","Update Faile");
			mv.addObject("path","./manageDetail?productNum="+productVO.getProductNum());
		}
		return mv;
	}
}