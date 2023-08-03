package com.team.app.infra.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.team.app.infra.upload.Upload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	
//	-------------------------------------------------관리단----------------------------------------------------
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
	
//	유저
	@RequestMapping(value="/memberInsert")
	public String memberInsertPage() {
		return "admin/infra/member/memberInsert";
	}
	
//	관리자
	@RequestMapping(value="/adminMakeMember")
	public String memberInesrt(Member dto) throws Exception {
		service.newAdminJoin(dto);
		
		return "redirect:/memberList";
	}
	
//	상세
	@RequestMapping(value="/memberOne")
	public String memberOne(Member dto,MemberVo vo, Model model) {
		Member member = service.memberOne(vo);
		model.addAttribute("member", member);

		List<Upload> uploadList = service.selectListUpload(dto);
		model.addAttribute("listUploaded",uploadList);
		return "admin/infra/member/memberForm";
	}


//	정보변경
	@RequestMapping(value="/memberUpdate")
	public String memberUpdate(Member dto) throws Exception {
		service.memberUpdate(dto);
		return "redirect:/memberList";
	}
	
//	uelete?
	@RequestMapping(value="/memberUelete")
	public String memberUelete(Member dto, MemberVo vo) {
		service.memberUelete(dto);
		return "redirect:/memberList";
	}
	
//	DB에서 맴버 삭제 기능()
//	@RequestMapping(value="/memberDelete")
//	public String memberDelete(Member dto) {
//		service.memberExcute(dto);
//		return"/memberList";
//	}

//	그냥 경로(파티 창 들어가는거 확인 작업)
	@RequestMapping(value="/PartyTest")
	public String partyTest() {
		return "usr/infra/member/partyStatus";
	}
	
//	-------------------------------------------------/관리단----------------------------------------------------
	
	
//	로그인 페이지로
	@RequestMapping(value="/LoginPage")
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("usr/infra/member/UsrLogin");
		
		return mav;
	}
	
	
//	-------------------------------------------------유저단----------------------------------------------------
//	회원가입 페이지
	 @RequestMapping("/usr_jonin")
	    public ModelAndView getReadyToTheNextBattle() {
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("usr/infra/member/UsrJoin");
	    	return mav;
	    }
	 
//		회원가입 (유저용)
		@RequestMapping(value="/memberJoin")
		public String memberJoin(Member dto) throws Exception {
			service.newMemberJoin(dto);
			return "redirect:/";
		}
		
//		로그인
		@ResponseBody
		@RequestMapping(value="/usrLogin")
		public Map<String, Object> loginP(MemberVo vo, HttpSession httpSession){
			Map<String , Object> returnMap = new HashMap<String, Object>();
			
			Member rtMember = service.usrLogin(vo);
			
			if(rtMember != null) {
				httpSession.setMaxInactiveInterval(60*10);
				httpSession.setAttribute("sessionId", vo.getEmail());
				httpSession.setAttribute("sessionProfilePath",rtMember.getPath());
				httpSession.setAttribute("sessionProfileName",rtMember.getUuidName());
				httpSession.setAttribute("sessionSeq",rtMember.getSeq());
				returnMap.put("rtMember", rtMember);
				returnMap.put("rt", "success");
			}else {
				returnMap.put("rt", "fail");
			}
			
			return returnMap;
		}
		
//		로그아웃
		@RequestMapping(value="/usrLogout")
		public String logoutP(HttpSession httpSesssion){
			
			httpSesssion.invalidate();
			
			return "redirect:/";
		}
//	-------------------------------------------------/유저단----------------------------------------------------
}
