package com.team.app.infra.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import com.team.app.infra.index.CurrentDt;
import com.team.app.infra.upload.Upload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.app.infra.upload.Upload;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
	@Autowired
	KakaoAPI kakaoAPI;

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
	public String memberInsertUsr(Member dto, CurrentDt dt) {
		dto.setSignUpDt(dt.getNowDt());
		
		return "admin/infra/member/memberInsert";
	}

	@ResponseBody
	@RequestMapping(value= "/idCheck", method = RequestMethod.POST)
	public Map<String,Object> idCheck(MemberVo vo){
		System.out.println("heyheyheyheyheyhehyehyehyheyhe");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int rtNum = service.selectOneCheckId(vo);
			System.out.println("@@@@@@@@@@@@2진행시켜!");
			System.out.println(rtNum);
			System.out.println("@@@@@@@@@@@@2진행시켜!");
		if (rtNum == 0) {
			returnMap.put("rt","available");
		}else{
			returnMap.put("rt","unavailable");
		}
		System.out.println(returnMap);
		return returnMap;
	}
	@ResponseBody
	@RequestMapping(value= "/nicknameCheck", method = RequestMethod.POST)
	public Map<String,Object> nicknameCheck(MemberVo vo){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int rtNumNick = service.selectOneCheckNickname(vo);
		if (rtNumNick == 0) {
			returnMap.put("rt","available");
		}else{
			returnMap.put("rt","unavailable");
		}
		System.out.println(returnMap);
		return returnMap;
	}

//SIGNUP ID DUPLICATION CHECK
//SIGNUP ID DUPLICATION CHECK




//	관리자
	@RequestMapping(value="/adminMakeMember")
	public String memberInsertXdm(Member dto) throws Exception {
		service.newAdminJoin(dto);
		
		return "redirect:/memberList";
	}
	
//	상세
	@RequestMapping(value="/memberOne")
	public String memberOne(Member dto, MemberVo vo, Model model) {
		Member member = service.memberOne(vo);
		model.addAttribute("member", member);

		List<Upload> uploadList = service.selectListUpload(dto);
		model.addAttribute("listUploaded",uploadList);
		return "admin/infra/member/memberForm";
	}



//	정보변경
	@RequestMapping(value="/memberUpdate")
	public String memberUpdate(Member dto, CurrentDt dt) throws Exception {
		dto.setUptProfileDt(dt.getNowDt());
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


//	-------------------------------------------------/관리단----------------------------------------------------
	
	
//	로그인 페이지로
	@RequestMapping(value="/LoginPage")
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("usr/infra/member/UsrLogin");
		
		return mav;
	}
	
	
//	-------------------------------------------------유저단----------------------------------------------------
//	회원가입 페이지(유저용)
	 @RequestMapping("/usrJoin")
	    public ModelAndView getReadyToTheNextBattle() {
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("usr/infra/member/UsrJoin");
	    	return mav;
	    }

	 
//		회원가입 (유저용)
		@RequestMapping(value="/memberJoin")
		public String memberJoin(Member dto, CurrentDt dt) throws Exception {
			dto.setSignUpDt(dt.getNowDt());
			
			service.newMemberJoin(dto);
			return "redirect:/LoginPage";
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
				httpSession.setAttribute("sessionNickName", rtMember.getNickname());
				httpSession.setAttribute("sessionProfilePath",rtMember.getPath());
				httpSession.setAttribute("sessionProfileName",rtMember.getUuidName());
				httpSession.setAttribute("sessionSeq",rtMember.getSeq());
				httpSession.setAttribute("sessionType",rtMember.getMemType());
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
		//kakao login
	@RequestMapping(value="/login/kakao")
	public String login(@RequestParam("code") String code, HttpSession session) {
		System.out.println("code : " + code);

		String access_Token = kakaoAPI.getAccessToken(code);
		System.out.println("access_Token : " + access_Token);

		HashMap<String, Object> userInfo = kakaoAPI.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);

		//    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("nickname") != null) {
			session.setAttribute("userId", userInfo.get("nickname"));
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("userProfile", userInfo.get("profile_image"));
			session.setAttribute("sessionId", userInfo.get("nickname"));
		}

		return "redirect:/";
	}




//		회원정보
	@RequestMapping(value="/memberOneUser")
	public String memberOneUser(Member dto, MemberVo vo, Model model) throws Exception {
		Member member = service.memberOne(vo);
		model.addAttribute("member", member);

		List<Upload> uploadList = service.selectListUpload(dto);
		model.addAttribute("listUploaded",uploadList);
		return "usr/infra/member/UsrInfo";
	}

//	-------------------------------------------------/유저단----------------------------------------------------
	
//	카카오 로그인 API
	
	@RequestMapping(value="/login")
	public String KakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
		 System.out.println("code : " + code);

	        String access_Token = kakaoAPI.getAccessToken(code);
	        System.out.println("access_Token : " + access_Token);
	        
	        HashMap<String, Object> userInfo = kakaoAPI.getUserInfo(access_Token);
	        System.out.println("login Controller : " + userInfo);

	        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	        if (userInfo.get("email") != null) {
	        	session.setMaxInactiveInterval(60*10);
	            session.setAttribute("sessionId", userInfo.get("email"));
	            session.setAttribute("sessionNickName", userInfo.get("nickname"));
	            session.setAttribute("access_Token", access_Token);
	            
	            System.out.println(userInfo.get("email"));
	            System.out.println(session.getAttribute("sessionId"));
	            System.out.println(session.getAttribute("access_Token"));
	        }
		
		
		return "/";
	}
	
//	@RequestMapping(value="")
//	public String kakaoLogout(HttpSession session) {
//		String access_Token  = (String)session.getAttribute("access_Token");
//		
//		if(access_Token != null && !"".equals(access_Token)) {
//			kakaoAPI.kakaoLogout(access_Token);
//			session.removeAttribute(access_Token);
//			session.removeAttribute("userId");
//			session.removeAttribute("userNick");
//		}else {
//			System.out.println("access_Token is null");
//		}
//		
//		return "redirect:/";
//	}
}
