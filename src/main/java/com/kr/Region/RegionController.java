package com.kr.Region;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jin.travel.Detail;



@Controller
@RequestMapping(value="region")
public class RegionController {
	private static final Logger logger = LoggerFactory.getLogger(RegionController.class);
	@Autowired private IRegionService iRegionServ;
	
	@RequestMapping(value="detail")
	public String detail(Model model,Detail detail,@RequestParam (value="title",defaultValue = "") String title) {
		logger.warn("컨텐츠클릭");
		
		logger.warn(title);
		
		
		List<Detail> detailLst=iRegionServ.selectDetail(title);
		model.addAttribute("detailLst",detailLst);
		
		return "forward:/index?formPath=detail";
	}

	
}
