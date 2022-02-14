package com.tak.MemberShip;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.jin.travel.HomeController;
import com.tak.login.Login;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

@Service
public class MemberServiceImpl implements IMemberService{
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	@Autowired
	private IMemberDAO iMemberDao;
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public String memberProc(Member member) {
		
		Login login = member;
		login.setPw(member.getPw());
		
		iMemberDao.memberProc(login);
		iMemberDao.InsertMember(member);
		return "";
	}

	@Override
	public Member readMember(String id) {
		Member member = null;
		
		try {
			member = iMemberDao.readMember(id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		logger.warn("serviceimpl - readMember : " + member.getId());
		return member;
	}
	@Override
	public Member readMemberByEmail(String email) {
		Member member = null;
		try {
			member = iMemberDao.readMember(email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		logger.warn("serviceimpl - redMemberBbyEmail"+member.getEmail());
		return member;
	}

	@Override
	public void updateMember(Member member) {
		try {
			iMemberDao.updateMember(member);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteMember(Member member) {
		try {
			iMemberDao.deleteMember(member);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendEmail(Member member, String div) throws Exception {
		

		// 보내는 사람 EMail, 제목, 내용
		String from = "dbsdbxkrzz@naver.com";
		String subject = "";
		String content = "";
		String to = member.getEmail();
		logger.warn("이메일전송");
		if(div.equals("findpw")) {
			subject = "같이가자 임시 비밀번호 입니다.";
			content += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			content += "<h3 style='color: blue;'>";
			content += member.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			content += "<p>임시 비밀번호 : ";
			content += member.getPw() + "</p></div>";
		}

		try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            
            mailSender.send(mail);
            logger.warn(member.getId());
            logger.warn(member.getEmail());
        } catch(Exception e) {
            e.printStackTrace();
        }
		
	
	}
	
	

	@Override
	public String findpw(HttpServletResponse resp, Member member) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
//		Member mem = iMemberDao.readMember(member.getId());
		int result = iMemberDao.countEmail(member.getEmail());
		String msg = "";
//		PrintWriter out = resp.getWriter();
		// 가입된 아이디가 없으면
		if(iMemberDao.readMember(member.getId()) == null) {
			msg = "가입된 아이디가 없습니다.";
			return msg;
		}
		// 가입된 이메일이 아니면
		else if(result == 0) {
			msg = "등록되지 않은 이메일 입니다.";
			return msg;
		}else {
			// 임시 비밀번호 생성
			msg = "이메일 발송 완료";
			String pw = "";
			for (int i = 0; i < 6; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setPw(pw);
			// 비밀번호 변경
			iMemberDao.updatePw(member);
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findpw");
			return msg;
		}
	}

	@Override
	public String findId(HttpServletResponse resp, Member member) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		int result = iMemberDao.countEmail(member.getEmail());
		
		PrintWriter out = resp.getWriter();
		String msg = "";
		if(result > 0) {
			sendId(member, "findid");
			msg = "이메일 발송 완료";
			return msg;
		}else {
			msg = "등록되지 않은 이메일 입니다.";
			return msg;
//			out.print("이메일로 아이디를 발송하였습니다.");
//			out.close();
		}
		
			
		
	}

	@Override
	public void sendId(Member member, String div) throws Exception {
				member = iMemberDao.readMemberByEmail(member.getEmail()); // 이게 과연 효율적인가 ?
				String from = "dbsdbxkrzz@gmail.com";
				String subject = "";
				String content = "";
				String to = member.getEmail();
				logger.warn("이메일전송");
				if(div.equals("findid")) {
					subject = "같이가자 아이디 입니다.";
					content += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					content += "<h3 style='color: blue;'>";
					content += "같이가자 가입 아이디 입니다.</h3>";
					content += "<p>아이디 : ";
					content += member.getId() + "</p></div>";
				}

				try {
		            MimeMessage mail = mailSender.createMimeMessage();
		            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");

		            
		            mailHelper.setFrom(from);
		            mailHelper.setTo(to);
		            mailHelper.setSubject(subject);
		            mailHelper.setText(content, true);

		            
		            mailSender.send(mail);
		            
		        } catch(Exception e) {
		            e.printStackTrace();
		        }
				logger.warn(member.getEmail()); 
				
	}

	

}
