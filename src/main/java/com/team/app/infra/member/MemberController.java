package com.team.app.infra.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value="/memberList")
	public String memberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception{
		
		vo.setNickname(vo.getNickname() == null ? "" : vo.getNickname());
		vo.setParamsPaging(service.memberOneCount(vo));
		
		if(vo.getTotalRows() > 0) {
			List<Member> list = service.memberList(vo);
			model.addAttribute("list",list);
		}else {
			
		}
		return "admin/infra/member/memberList";
	}
	
//	맴버 생성(관리자용)
	@RequestMapping(value="/memberInsert")
	public String memberInsertPage() {
		return "admin/infra/member/memberInsert";
	}
	
	@RequestMapping(value="/adminMakeMember")
	public String memberInesrt(Member dto) {
		service.newAdminJoin(dto);
		
		return "redirect:/memberList";
	}
	
//	회원가입 (유저용)
	@RequestMapping(value="/memberJoin")
	public String memberJoin(Member dto) {
		service.newMemberJoin(dto);
		return "redirect:/";
	}
//	상세
	@RequestMapping(value="/memberOne")
	public String memberOne(MemberVo vo, Model model) {
		Member member = service.memberOne(vo);
		model.addAttribute("member", member);
		return "admin/infra/member/memberForm";
	}
	
//	정보변경
	@RequestMapping(value="/memberUpdate")
	public String memberUpdate(Member dto) {
		service.memberUpdate(dto);
		return "redirect:/memberList";
	}
	
//	uelete?
	@RequestMapping(value="/memberUelete")
	public String memberUelete(Member dto, MemberVo vo) {
		service.memberUelete(dto);
		return "redirect:/memberList";
<<<<<<< HEAD
<<<<<<< HEAD
	}

	//	uelete?
	@RequestMapping(value="/memberNoUelete")
	public String memberNoUelete(Member dto, MemberVo vo) {
		service.memberNoUelete(dto);
		return "redirect:/memberList";
=======
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
=======
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
	}
	
	@RequestMapping(value="/memberDelete")
	public String memberDelete(Member dto) {
		service.memberExcute(dto);
		return"/memberList";
	}
}
