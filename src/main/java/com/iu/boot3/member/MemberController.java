package com.iu.boot3.member;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@ModelAttribute("member")
	public String getMember() {
		return "member";
	}
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("join")
	public void join()throws Exception{}
	
	@PostMapping("join")
	public String join(MemberVO memberVO) throws Exception{
		
		int result = memberService.join(memberVO);
		return "redirect:../";
	}
	
	@GetMapping("login")
	public String login() throws Exception{
		String path = "member/login";
		return path;
	}
	
	@PostMapping("login")
	public String login(MemberVO memberVO, String remember, RedirectAttributes result, HttpServletResponse response, HttpSession session)throws Exception{
		
		if(remember != null&& remember.equals("1")) {
			Cookie cookie = new Cookie("remember", memberVO.getId());
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("remember", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		memberVO = memberService.login(memberVO);
		
		String path = "redirect:./login";
		result.addFlashAttribute("result", "0");
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			result.addFlashAttribute("result", "1");
			path = "redirect:../";
		}
		
		return path;

	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	@GetMapping("myPage")
	public ModelAndView myPage(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO=(MemberVO)session.getAttribute("member");
		memberVO = memberService.myPage(memberVO);
		mv.setViewName("member/myPage");
		mv.addObject("dto",memberVO);
		
		return mv;
	}
	
	@PostMapping("update")
	public String update(MemberVO memberVO, HttpSession session) throws Exception{
		int result = memberService.update(memberVO);
		return "redirect:./myPage";
	}
	
	@GetMapping("update")
	public ModelAndView update(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO=memberService.myPage(memberVO);
		mv.setViewName("member/update");
		mv.addObject("member",memberVO);
		return mv;
	}
	
	@GetMapping("delete")
	public String delete(HttpSession session, MemberVO memberVO) throws Exception{
		int result = memberService.delete(memberVO);
		session.invalidate();
		return "redirect:../";
	}
	
}
