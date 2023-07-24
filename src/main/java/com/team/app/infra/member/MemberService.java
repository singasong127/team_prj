package com.team.app.infra.member;

import java.util.List;

public interface MemberService {

	List<Member> memberList(MemberVo vo);
	
	public Member memberOne(MemberVo vo);

	public int memberOneCount(MemberVo vo);
	
	public int newMemberJoin(MemberVo vo);
	
	public int memberUpdate(MemberVo vo);
	
	public int memberUelete(MemberVo vo);
	
	public int memberExcute(MemberVo vo);
	
}
