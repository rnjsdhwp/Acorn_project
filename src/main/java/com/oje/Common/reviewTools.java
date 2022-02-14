package com.oje.Common;

public class reviewTools {
	public static String getNavi(int currentPage, int pageBlock, int totalPage, String url) {
		int blockCnt = totalPage/pageBlock;
		int totalBlock = blockCnt/5;
		int currentBlock = (currentPage-1)/5 + 1;
		int blockLoc = (currentBlock*5)-4;
		String result = "";
		
		if(totalPage % pageBlock > 0) 
			blockCnt++;
		if(blockCnt%5 > 0)
			totalBlock++;
		
		if(currentBlock != 1)	
			result+="<a href='"+url+(blockLoc-1)+"'> [이전] </a>";
		
		for(int i=blockLoc; i<=blockLoc+4; i++) {
			if(currentPage == i)	
				result += "<b>";
			result += "<a href='" + url + i + "'> " + i + " </a>";
			if(currentPage == i)	
				result += "</b>";
			
			if(i==blockCnt)
				break;
		}
		
		if(currentBlock != totalBlock) 	
			result += "<a href='" + url + (blockLoc+5) + "'> [다음] </a>";
		
		return result;
	}
}
