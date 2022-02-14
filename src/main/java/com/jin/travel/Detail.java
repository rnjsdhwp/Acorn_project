package com.jin.travel;

import java.sql.Date;

//상세페이지 
public class Detail {

 // 글번호 
 private Integer no;

 // 제목 
 private String title;

 // 작성일 
 private Date writedate;

 // 요약 
 private String title1;

 public String getTitle1() {
	return title1;
}

public void setTitle1(String title1) {
	this.title1 = title1;
}
private String img;
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
private String thema;
public String getThema() {
	return thema;
}

public void setThema(String thema) {
	this.thema = thema;
}
// 위치 
 private String location;

 // 전화번호 
 private String tel;

 // 이용료 
 private String cost;

 // 이용시간 
 private String hours;

 // 홈페이지 
 private String homepage;

 // 내용 
 private String contents;

 public Integer getNo() {
     return no;
 }

 public void setNo(Integer no) {
     this.no = no;
 }

 public String getTitle() {
     return title;
 }

 public void setTitle(String title) {
     this.title = title;
 }

 public Date getWritedate() {
     return writedate;
 }

 public void setWritedate(Date writedate) {
     this.writedate = writedate;
 }



 public String getLocation() {
     return location;
 }

 public void setLocation(String location) {
     this.location = location;
 }

 public String getTel() {
     return tel;
 }

 public void setTel(String tel) {
     this.tel = tel;
 }

 public String getCost() {
     return cost;
 }

 public void setCost(String cost) {
     this.cost = cost;
 }

 public String getHours() {
     return hours;
 }

 public void setHours(String hours) {
     this.hours = hours;
 }

 public String getHomepage() {
     return homepage;
 }

 public void setHomepage(String homepage) {
     this.homepage = homepage;
 }

 public String getContents() {
     return contents;
 }

 public void setContents(String contents) {
     this.contents = contents;
 }

 
}