package com.tak.MemberShip;

import com.tak.login.Login;

public interface IMemberDAO {
	public void memberProc(Login login);
	public void InsertMember(Member member);
	public Member readMember(String id);
	public void updateMember(Member member);
	public void deleteMember(Member member);
	public void updatePw(Member member);
	public Member idCheck(String id);
//	public String findId(Member member);
	public Member readMemberByEmail(String email);
	public int countEmail(String email);
}
