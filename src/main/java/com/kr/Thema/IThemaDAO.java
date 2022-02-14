package com.kr.Thema;

import java.util.List;

import com.jin.travel.Detail;
import com.kr.Thema.*;

public interface IThemaDAO {

	List<Thema> selectThemaLst();

	List<Detail> selectDetail(String title);

}
