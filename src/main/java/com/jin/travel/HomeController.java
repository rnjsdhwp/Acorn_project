package com.jin.travel;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kr.Region.IRegionService;
import com.kr.Thema.IThemaService;
import com.kr.Thema.Thema;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired private IRegionService iRegionServ;
	@Autowired private IThemaService iThemaServ;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public String index(Locale locale, Model model) {
		logger.warn("HomeController 접속성공");
		model.addAttribute("formPath","home");
		return "index";
	}
	@RequestMapping(value = "index")
	public String index(Model model,@RequestParam("formPath") String formPath) {
		model.addAttribute("formPath",formPath);
		return "index";
	}
	@RequestMapping(value = "home")
	public String home() {
		
		return "home";
	}
	@RequestMapping(value = "login")
	public String login() {
		
		return "MemberForm/login";
	}
	@RequestMapping(value="membership")
	public String membership() {
		
		return "MemberForm/join";
	}
	@RequestMapping(value="mypage")
	public String myPage() {
		
		return "MemberForm/mypage";
	}
	@RequestMapping(value="modify")
	public String modify() {
		
		return "MemberForm/modify";
	}
	@RequestMapping(value="withdrawal")
	public String withdrawal() {
		
		return "MemberForm/withdrawal";
	}
	@RequestMapping(value="forgot")
	public String forgot() {
		
		return "MemberForm/forgot";
	}
	// Region / Thema
	@RequestMapping(value = "region")
	public String region(Model model,Detail detail,@RequestParam(value="selected", defaultValue = "") String selected) {
		logger.warn("지역별클릭");
		String gangnam = "강남";
		logger.warn(selected);
		if(selected!=null)
			gangnam=selected;
	
		
		List<Detail> detailLst=iRegionServ.selectDetailLst(gangnam);
		model.addAttribute("detailLst",detailLst);
		return "region/region";
	}
	@RequestMapping(value = "thema")
	public String thema(Model model,Thema thema) {
		logger.warn("테마별클릭");
		List<Thema> ThemaLst=iThemaServ.selectThemaLst();
		logger.warn(thema.getThematitle());
		model.addAttribute("ThemaLst",ThemaLst);
		return "thema/thema";
	}
	@RequestMapping(value = "detail")
	public String detail() {
		
		return "detail";
	}
	@RequestMapping(value = "themaDetail")
	public String themadetail(Model model,Detail detail,@RequestParam(value="title", defaultValue = "") String title) {
		logger.warn("테마디테일클릭");
		List<Detail> detailLst=iThemaServ.selectDetail(title);
		model.addAttribute("detailLst",detailLst);
		return "thema/themaDetail";
	}
	@RequestMapping(value = "review")
	public String review() {//지워도될듯?
		return "review/reviewList";
	}
	@RequestMapping(value = "write")
	public String write() {
		return "review/writeReview";
	}
	@RequestMapping(value = "viewReview")
	public String viewReview() {
		return "review/viewReview";
	}

}
