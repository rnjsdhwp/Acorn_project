package com.kr.Region;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jin.travel.Detail;
@Service
public class RegionServiceImpl implements IRegionService{
	@Autowired IRegionDAO iRegionDao;
	@Override
	public List <Detail> selectDetail(String title) {
		List<Detail> detail=iRegionDao.selectDetail(title);
		return detail;
		
		
	}
	@Override
	public List<Detail> selectDetailLst(String gangnam) {
		List<Detail> detail=iRegionDao.selectDetailLst(gangnam);
		return detail;
	}

}
