package com.tak.MemberShip;

import javax.servlet.http.HttpServletResponse;

public interface IMemberService {
	
	//회원가입
	public String memberProc(Member member);

	//정보불러오기(마이페이지)
	public Member readMember(String id);
	
	//정보수정
	public void updateMember(Member member);

	public void deleteMember(Member member);
	
	// 이메일 전송
	public void sendEmail(Member member, String div) throws Exception;
	
	//비밀번호 찾기
	public String findpw(HttpServletResponse resp, Member member) throws Exception;

	public String findId(HttpServletResponse response, Member member) throws Exception;

	void sendId(Member member, String div) throws Exception;
	
	public Member readMemberByEmail(String email);
}
