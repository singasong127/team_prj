package com.team.app.infra.member;

import java.util.List;

public interface MemberService {

	List<Member> memberList(MemberVo vo);
	
	public Member memberOne(MemberVo vo);

	public int memberOneCount(MemberVo vo);
	
	public int newMemberJoin(Member dto);
	
	public int newAdminJoin(Member dto);
	
	public int memberUpdate(Member dto);
	
	public int memberUelete(Member dto);

	public int memberNoUelete(Member dto);
	
//	public int memberExcute(Member dto);
	
	public Member usrLogin(MemberVo vo);
	
}
