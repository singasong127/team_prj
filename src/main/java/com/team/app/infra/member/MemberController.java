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
		return "";
	}
	
//	상세
	@RequestMapping(value="/memberOne")
	public String memberOne(MemberVo vo, Model model) {
		Member member = service.memberOne(vo);
		model.addAttribute("member", member);
		return "";
	}
	
//	정보변경
	@RequestMapping(value="/memberUpdate")
	public String memberUpdate(Member dto) {
		service.memberUpdate(dto);
		return "";
	}
	
//	uelete?
	@RequestMapping(value="/memberUelete")
	public String memberUelete(Member dto, MemberVo vo) {
		service.memberUelete(dto);
		return "";
	}
	
	@RequestMapping(value="/memberDelete")
	public String memberDelete(Member dto) {
		
		return"";
	}
}
