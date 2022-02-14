package com.tak.MemberShip;

import com.tak.login.Login;

//회원 정보 
public class Member extends Login{

 // 아이디 
// private String id;

 // 이름 
 private String name;

 // 이메일 
 private String email;

 // 관심지역 
 private String interestedRegion;

 // 우편번호 
 private String zipcode;

 // 주소 
 private String addr1;

 // 상세주소 
 private String addr2;

// public String getId() {
//     return id;
// }
//
// public void setId(String id) {
//     this.id = id;
// }

 public String getName() {
     return name;
 }

 public void setName(String name) {
     this.name = name;
 }

 public String getEmail() {
     return email;
 }

 public void setEmail(String email) {
     this.email = email;
 }

 public String getinterestedRegion() {
     return interestedRegion;
 }

 public void setinterestedRegion(String interestedRegion) {
     this.interestedRegion = interestedRegion;
 }

 public String getZipcode() {
     return zipcode;
 }

 public void setZipcode(String zipcode) {
     this.zipcode = zipcode;
 }

 public String getAddr1() {
     return addr1;
 }

 public void setAddr1(String addr1) {
     this.addr1 = addr1;
 }

 public String getAddr2() {
     return addr2;
 }

 public void setAddr2(String addr2) {
     this.addr2 = addr2;
 }

}