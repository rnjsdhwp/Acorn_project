package com.kr.Region;

import java.util.List;

import com.jin.travel.Detail;

public interface IRegionService {

	List<Detail> selectDetail(String title);

	List<Detail> selectDetailLst(String gangnam);


}
