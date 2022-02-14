package com.oje.review;

import java.util.List;
import java.util.Map;

public interface IReviewDAO {
	List<Review> ReadReview(Map<String, Object> reviewMap);
	List<Review> ReadReviewAll(Map<String, Object> reviewMap);
	List<Review> ReadReviewTitle(Map<String, Object> reviewMap);
	List<Review> ReadReviewId(Map<String, Object> reviewMap);
	void writeProc(Review review);
	void AttachFile(Map<String, String> fileMap);
	Map<String, String> DetailReadAttach(String writeNo);
	Review DetailRead(String writeNo);
	void Hits(Map<String, Integer> hitsMap);
	void InsertReply(Map<String, Integer> replyMap);
	void updateReview(Review review);
	void deleteReview(int pno);
	int reviewCnt(String search);
	int reviewTitleCnt(String search);
	int reviewIdCnt(String search);
}
