package com.tak.MemberShip;

import java.security.Provider.Service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

@Controller
@RequestMapping("membership")
public class MemberController {
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private IMemberService iMemberServ;
	
	
	@RequestMapping(value="memberProc")
	public String memberProc(Member member) {
		
		iMemberServ.memberProc(member);
		
		return "forward:/index?formPath=login";
	}
	@RequestMapping(value = "info")
	public String info(HttpSession session, Model model) {
		
		String id = (String) session.getAttribute("id");
		
		Member mem = iMemberServ.readMember(id);
		
		model.addAttribute("mem", mem);
		
		return "forward:/index?formPath=mypage";
	}
	
	@RequestMapping(value = "modify")
	public String modify(HttpSession session, Model model,Member member) {
		model.addAttribute("mem", iMemberServ.readMember((String)session.getAttribute("id")));
		
		logger.warn("controller -  modify : "+(String)session.getAttribute("id"));

		return "forward:/index?formPath=modify";
		
	}
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public String update(Member member, HttpSession session) {
		logger.warn("수정실행");
		iMemberServ.updateMember(member);
		logger.warn("수정완료");
		return "forward:/index?formPath=home";
		
	}
	@RequestMapping(value = "withdrawal", method=RequestMethod.GET)
	public String withdrawal(Member member, Model model) {
		
//		String id = (String) session.getAttribute("id");
//		if(id == null) {
//			return "forward:/index?formPath=mypage";
//		}
		logger.warn("탈퇴페이지 진입 id : " + member.getId());
		model.addAttribute("id",member.getId());
		
		return "forward:/index?formPath=withdrawal";
		
	}
	@RequestMapping(value = "delete")
	public String delete(Member member, HttpSession session) {
		String id = (String)session.getAttribute("id");
		member = iMemberServ.readMember(id); // 이 방법말고 다른 방법이 있는가.(서비스단을 너무 왔다갔다 거린다고 생각)
		
		logger.warn("Contrller 삭제 실행 id : " + member.getId());
		
		iMemberServ.deleteMember(member);
		
		session.invalidate();
		
		return "forward:/index?formPath=home";
	}
	//비번찾기
	
	@RequestMapping(value="findPw")
	public String findPw(@ModelAttribute Member member, HttpServletResponse response,Model model) throws Exception {
		String msg = iMemberServ.findpw(response, member);
		logger.warn(msg);
		model.addAttribute("msg", msg);
	
		return "forward:/index?formPath=login";


	}
	//아이디 찾기
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(@ModelAttribute Member member, HttpServletResponse response,Model model) throws Exception{
//		model.addAttribute("msg", model);
		
		String msg = iMemberServ.findId(response,member); 
		logger.warn(msg);
		model.addAttribute("msg", msg);
		
		return "forward:/index?formPath=login";
		
		
	}
	
}


//$.ajax({
//	url : "/MemberForm/forgot",
//	type : "POST",
//	data : {
//		id : $("#id").val()
//		email : $("#inputAddress2").val()
//	},
//	success : function(result){
//		alert(result);
//	},
//})
