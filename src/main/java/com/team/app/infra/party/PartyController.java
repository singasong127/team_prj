package com.team.app.infra.party;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.app.infra.code.Code;
import com.team.app.infra.code.CodeServiceImpl;
import com.team.app.infra.code.CodeVo;
import com.team.app.infra.index.CurrentDt;
import com.team.app.infra.member.Member;
import com.team.app.infra.member.MemberServiceImpl;
import com.team.app.infra.member.MemberVo;
import com.team.app.infra.report.ReportVo;


@Controller
public class PartyController {
	@Autowired
	PartyServiceImpl service;
	@Autowired
	CodeServiceImpl cdService;
	@Autowired
	MemberServiceImpl memServie;
	
	  @RequestMapping(value="/ptlist") 
	  public String partyList(@ModelAttribute("vo") PartyVo vo, Model model, CodeVo cdVo) {
	  
	  vo.setPartyName(vo.getPartyName() == null ? "" : vo.getPartyName());
	  
	  vo.setParamsPaging(service.selectOneCount(vo));
	  

	  if(vo.getTotalRows() > 0) {
		  List<Party> list = service.selectList(vo);
		  model.addAttribute("list", list); 
		  // model.addAttribute("vo", vo); } 
		  
	  } else {
		  // by pass 
	  }
	  	
	  	return "admin/infra/party/partyList";
	  }
	 
	
	@RequestMapping(value="/ptform") 
	public String partyForm(@ModelAttribute PartyVo vo, ReportVo reVo, MemberVo meVo, CodeVo cdVo, Model model) { 
		Party party = service.selectOne(vo);
		reVo.setActor(meVo.getSeq());
		reVo.setActee(meVo.getSec_seq());
		
		List<Code> code = cdService.selectCodeName(cdVo); 
		List<Member> member = memServie.memberList(meVo); 
		
		model.addAttribute("member",member);
		model.addAttribute("code", code);
		model.addAttribute("item", party);
	  
		return "usr/infra/member/partyStatus"; 
	}
	 
	
	@RequestMapping(value="/ptupdate")
	public String partyUpdate(Party dto) {
		
		System.out.println("Update");
		
		service.update(dto);
		
		return "redirect:/ptlist";
	}
	
	@RequestMapping(value="/ptuelete")
	public String partyUelete(Party dto) {
		
		System.out.println("Uelete");
		
		service.uelete(dto);
		
		return "redirect:/ptlist";
	}
	
	
	@RequestMapping(value="/ptinsert")
	public String partyInsert(Party dto, PartyVo vo, CurrentDt dt) {
		dto.setMadeTime(dt.getNowDt());
		dto.setPartyLeader(vo.getPartyLeader());
		
		System.out.println("partyLeader: " + dto.getPartyLeader());
		
		service.insert(dto);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/newChallger")
	public String newParty(Model model, @ModelAttribute PartyVo vo, CodeVo cdVo, 
			HttpSession session) throws Exception {
		
		vo.setPartyLeader( (String)session.getAttribute("sessionSeq") );
		
		System.out.println("partyLeader: " + vo.getPartyLeader());
		System.out.println("partyLocation: " + vo.getPartyLocation());
		
		Party party = service.selectOne(vo);
		List<Code> code = cdService.selectCodeName(cdVo);
		model.addAttribute("code", code);
		model.addAttribute("party", party);
		
		return "usr/infra/member/newParty";
	}
	
//	@ResponseBody
//    @RequestMapping(value="/newChallger/post", method=RequestMethod.POST)
//    public Map<String, Object> postNewParty(@RequestBody Map<String, Object> location,
//    		HttpServletRequest request) throws Exception {
//    	Map<String, Object> returnMap = new HashMap<String, Object>();
//    	
//    	System.out.println("Location: " + location.get("location"));
//    	
//    	returnMap.put("lo", location.get("location"));
//    	returnMap.put("rt", "success");
//    	return returnMap;
//    }
	
	
}
