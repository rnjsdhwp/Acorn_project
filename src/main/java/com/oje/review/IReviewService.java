package com.oje.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface IReviewService {
	List<Review> ReadReview(String searchOp, String search, int currentPage, String sortOp);
	void writeProc(Review review, HttpServletRequest req);
	Map<String, Object> DetailRead(String writeNo);
	void updateReview(Review review, String pno);
	void deleteReview(String pno);
	String getNavi(HttpServletRequest req, List<Review> reviewLst, String sortOp);
}
