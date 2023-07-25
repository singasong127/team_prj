package com.team.app.infra.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	@Override
	public List<Member> memberList(MemberVo vo) {
		return dao.memberList(vo);
	}

	@Override
	public Member memberOne(MemberVo vo) {
		return dao.memberOne(vo);
	}

	@Override
	public int memberOneCount(Member dto) {
		return dao.memberOneCount(dto);
	}

	@Override
	public int newMemberJoin(Member dto) {
		return dao.newMemberJoin(dto);
	}

	@Override
	public int newAdminJoin(Member dto) {
		return dao.newAdminJoin(dto);
	}

	@Override
	public int memberUpdate(Member dto) {
		return dao.memberUpdate(dto);
	}

	@Override
	public int memberUelete(Member dto) {
		return memberUelete(dto);
	}

	@Override
	public int memberExcute(Member dto) {
		return memberExcute(dto);
	}


	
}
