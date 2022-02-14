package com.kr.Thema;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jin.travel.Detail;
import com.kr.Region.IRegionService;
import com.kr.Region.RegionController;

@Controller
@RequestMapping(value="thema")
public class ThemaController {
	private static final Logger logger = LoggerFactory.getLogger(RegionController.class);
	private IThemaService iThemaServ;
	@RequestMapping(value="detail")
	public String detail(Model model,Detail detail,@RequestParam (value="title",defaultValue = "") String title) {
//		logger.warn("themaController/detail");
//		logger.warn(title);
//		List<Detail> detailLst=iThemaServ.selectDetail(title);
//		model.addAttribute("detailLst",detailLst);
		return "forward:/index?formPath=themaDetail";
	}
	
}