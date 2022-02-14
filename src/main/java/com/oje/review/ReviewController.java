package com.oje.review;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("review")
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	@Autowired private IReviewService iReviewServ;

	@RequestMapping(value = "reviewList")
	public String reviewList(Model model,
			@RequestParam(value="search", defaultValue = "") String search, 
			@RequestParam(value="searchOp", defaultValue = "" ) String searchOp,
			HttpServletRequest req) {
		int currentPage = 1;
		String sortOp = req.getParameter("sortOp");
		if(sortOp==null) {
			sortOp = "recent";
		}
		List<Review> reviewLst = iReviewServ.ReadReview(searchOp, search, currentPage, sortOp);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", search);
		model.addAttribute("searchOp", searchOp);
		model.addAttribute("sortOp", sortOp);
		model.addAttribute("reviewLst", reviewLst);
		model.addAttribute("navi", iReviewServ.getNavi(req, reviewLst, sortOp));
		return "forward:/index?formPath=review";
	}
	
	@RequestMapping(value="pageProc")
	public String pageProc(Model model, @RequestParam int currentPage, 
			@RequestParam(value="search", defaultValue = "") String search, 
			@RequestParam(value="searchOp", defaultValue = "" ) String searchOp,
			HttpServletRequest req) {
		String sortOp = req.getParameter("sortOp");
		if(sortOp==null) {
			sortOp = "recent";
		}
		List<Review> reviewLst = iReviewServ.ReadReview(searchOp, search, currentPage, sortOp);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", search);
		model.addAttribute("searchOp", searchOp);
		model.addAttribute("sortOp", sortOp);
		model.addAttribute("reviewLst", reviewLst);
		model.addAttribute("navi", iReviewServ.getNavi(req, reviewLst, sortOp));
		return "forward:/index?formPath=review";
	}
	
	@RequestMapping(value = "write")
	public String write() {
		return "forward:/index?formPath=write";
	}
	
	@RequestMapping(value = "writeProc")
	public String writeProc(Review review, HttpServletRequest req) {
		iReviewServ.writeProc(review, req);
		return "forward:/review/reviewList";
	}
	
	@RequestMapping(value="detailRead")
	public String detailRead(Model model, @RequestParam("writeNo") String writeNo, 
			@RequestParam int currentPage,
			@RequestParam(value="search", defaultValue = "") String search,
			@RequestParam(value="searchOp", defaultValue = "") String searchOp,
			@RequestParam(value="sortOp", defaultValue = "recent") String sortOp) {
		Map<String, Object> returnMap = iReviewServ.DetailRead(writeNo);
		
		logger.warn(search);
		logger.warn(searchOp);
		logger.warn(sortOp);
		model.addAttribute("searchWord", search);
		model.addAttribute("searchOp", searchOp);
		model.addAttribute("sortOp", sortOp);
		model.addAttribute("currentPage", currentPage);
		
		model.addAttribute("review", returnMap.get("review"));
		model.addAttribute("attachFileMap", returnMap.get("attachFileMap"));
		return "forward:/index?formPath=viewReview";
	}
	
	@RequestMapping(value="reply")
	public String reply(Model model, @RequestParam("pno") String pno) {
		model.addAttribute("pno", pno);
		return "forward:/index?formPath=write";
	}
	
	@RequestMapping(value="update")
	public String update(Model model, Review review, @RequestParam("pno") String pno) {
		model.addAttribute("review", review);
		model.addAttribute("pno", pno);
		model.addAttribute("update", "update");
		return "forward:/index?formPath=write";
	}
	
	@RequestMapping(value="updateReview")
	public String updateReview(Review review, @RequestParam("pno") String pno) {
		iReviewServ.updateReview(review, pno);
		return "forward:/review/reviewList";
	}
	
	@RequestMapping(value="deleteReview")
	public String deleteReview(@RequestParam("pno") String pno) {
		iReviewServ.deleteReview(pno);
		return "forward:/review/reviewList";
	}
	
	@RequestMapping(value="cancel")
	public String cancel() {
		logger.warn("cancel");
		return "forward:/review/reviewList";
	}
	
	@RequestMapping(value="searchReview")
	public String searchReview(Model model, 
			@RequestParam("search") String search, @RequestParam("searchOp") String searchOp) {
		model.addAttribute("searchOp", searchOp);
		model.addAttribute("search", search);
		return "forward:/review/reviewList";
	}
}
