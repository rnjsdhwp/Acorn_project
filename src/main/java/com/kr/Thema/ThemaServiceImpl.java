package com.kr.Thema;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jin.travel.Detail;
import com.kr.Thema.*;

@Service
public class ThemaServiceImpl implements IThemaService{
	@Autowired IThemaDAO iThemaDao;
	@Override
	public List<Thema> selectThemaLst() {
		List<Thema> ThemaLst=iThemaDao.selectThemaLst();
		return ThemaLst;
	}
	@Override
	public List<Detail> selectDetail(String title) {
		List<Detail> detail=iThemaDao.selectDetail(title);
		return detail;
	}

}
