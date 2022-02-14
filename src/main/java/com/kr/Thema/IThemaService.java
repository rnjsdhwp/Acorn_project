package com.kr.Thema;

import java.util.List;

import com.jin.travel.Detail;
import com.kr.Thema.*;

public interface IThemaService {

	List<Thema> selectThemaLst();

	List<Detail> selectDetail(String title);

}
