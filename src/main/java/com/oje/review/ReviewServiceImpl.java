package com.oje.review;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oje.Common.reviewTools;

@Service
public class ReviewServiceImpl implements IReviewService{
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	@Autowired private IReviewDAO iReviewDAO;
	private final String UPLOADPATH = "/resources/upload/";
	private final int PAGEBLOCK = 4;
	
	@Override
	public List<Review> ReadReview(String searchOp, String search, int currentPage, String sortOp) {
		List<Review> list = null;
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		
		reviewMap.put("start", 1+(PAGEBLOCK*(currentPage-1)));
		reviewMap.put("end", PAGEBLOCK*currentPage);
		
		reviewMap.put("search", search);
		
		logger.warn(sortOp);
		reviewMap.put("sortOp", sortOp);
		
		if(searchOp.equals("")) {
			list = iReviewDAO.ReadReview(reviewMap);
		}else if(searchOp.equals("전체")) {
			list = iReviewDAO.ReadReviewAll(reviewMap);
		}else if(searchOp.equals("제목")) {
			list = iReviewDAO.ReadReviewTitle(reviewMap);
		}else if(searchOp.equals("작성자")) {
			list = iReviewDAO.ReadReviewId(reviewMap);
		}
		
		return list;
	}

	@Override
	public void writeProc(Review review, HttpServletRequest req) {
		Date writedate = new Date(System.currentTimeMillis());
		review.setWritedate(writedate);
		logger.warn("req : "+req.getParameter("id"));
		logger.warn("req : "+req.getParameter("uploadFile"));
		iReviewDAO.writeProc(review);
		
		Map<String, String> fileMap = Upload(req);
		if(fileMap.get("systemFile") != null) {
			logger.warn("1 : ");
			fileMap.put("fno", String.valueOf(review.getNo()));
			iReviewDAO.AttachFile(fileMap);
		}
		
		String pno = req.getParameter("pno");
		if(!"".equals(pno)) {
			Map<String, Integer> replyMap = new HashMap<String, Integer>();
			replyMap.put("no", review.getNo());
			replyMap.put("pno", Integer.parseInt(pno));
			
			iReviewDAO.InsertReply(replyMap);
		}
	}

	private Map<String, String> Upload(HttpServletRequest req) {
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)req;
		Iterator<String> iterator = multiRequest.getFileNames();
		MultipartFile multipartFile = null;
		Map<String, String> fileMap = new HashMap<String, String>();
		
		while(iterator.hasNext()){
			String fieldName = iterator.next();
			multipartFile = multiRequest.getFile(fieldName);
	        
			if(multipartFile.isEmpty() == false){
				String originFile = multipartFile.getOriginalFilename();
				String filePath = multiRequest.getSession().getServletContext().getRealPath("/");
				InputStream stream = getStream(multipartFile);
				String systemFile = DownloadFile(stream, filePath, originFile);
				
				fileMap.put("originFile", originFile);
				fileMap.put("systemFile", systemFile);
				
				logger.warn("filePath : "+filePath);
			}
			
		}
		return fileMap;
	}

	private InputStream getStream(MultipartFile multipartFile) {
		InputStream stream = null;
		try {
			stream = multipartFile.getInputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return stream;
	}

	private String DownloadFile(InputStream stream, String filePath, String fileName) {
		String systemFile = fileName+System.currentTimeMillis();
		File file = new File(filePath+UPLOADPATH+systemFile);
		try {
			Files.copy(stream, file.toPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return systemFile;
	}

	@Override
	public Map<String, Object> DetailRead(String writeNo) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, String> attachFileMap = iReviewDAO.DetailReadAttach(writeNo);
		Review review = iReviewDAO.DetailRead(writeNo);
		
		returnMap.put("review", review);
		returnMap.put("attachFileMap", attachFileMap);
		
		Map<String, Integer> hitsMap = new HashMap<String, Integer>();
		int no = Integer.parseInt(writeNo);
		hitsMap.put("no", no);
		iReviewDAO.Hits(hitsMap);
		return returnMap;
	}

	@Override
	public void updateReview(Review review, String pno) {
		Date writedate = new Date(System.currentTimeMillis());
		review.setWritedate(writedate);
		review.setNo(Integer.parseInt(pno));
		iReviewDAO.updateReview(review);
	}

	@Override
	public void deleteReview(String pno) {
		iReviewDAO.deleteReview(Integer.parseInt(pno));
	}

	@Override
	public String getNavi(HttpServletRequest req, List<Review> reviewLst, String sortOp) {
		String currentPageStr = req.getParameter("currentPage");
		int currentPage = 1;
		int totalPage = 0;
		String search = req.getParameter("search");
		String searchOp = req.getParameter("searchOp");
		
		if(search == null) {
			search =  "";
		}
		if(searchOp == null) {
			searchOp =  "";
		}
		String url = req.getContextPath() + "/review/pageProc?searchOp="+searchOp
						+ "&search="+search+"&sortOp="+sortOp+"&currentPage=";
		
		if(currentPageStr != null)
			currentPage = Integer.parseInt(currentPageStr);

		if(searchOp.equals("")) {
			totalPage = iReviewDAO.reviewCnt(search);
		}else if(searchOp.equals("전체")) {
			totalPage = iReviewDAO.reviewCnt(search);
		}else if(searchOp.equals("제목")) {
			totalPage = iReviewDAO.reviewTitleCnt(search);
		}else if(searchOp.equals("작성자")) {
			totalPage = iReviewDAO.reviewIdCnt(search);
		}
		
		int readNum = totalPage;
		for(Review lst : reviewLst) {
			lst.setRnum(readNum-(PAGEBLOCK*(currentPage-1)));
			readNum--;
		}
		
		return reviewTools.getNavi(currentPage, PAGEBLOCK, totalPage, url);
	}
}
