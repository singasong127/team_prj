package com.team.app.infra.index;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.app.infra.code.Code;
import com.team.app.infra.code.CodeServiceImpl;
import com.team.app.infra.code.CodeVo;
import com.team.app.infra.party.Party;
import com.team.app.infra.party.PartyServiceImpl;
import com.team.app.infra.party.PartyVo;

@Controller
public class IndexController {
	
	@Autowired
	PartyServiceImpl service;
	@Autowired
	CodeServiceImpl cdService;
	
    @RequestMapping(value="/")
    public String index(Model model, PartyVo vo, CodeVo cdVo) {
    	
    	service.selectList(vo);
//    	service.selectOne(vo);
    	System.out.println("voPartySport" + vo.getPartySport());
    	System.out.println("voPartyName"+ vo.getPartyName());
    	System.out.println(vo.getPlayDt());
    	
    	List<Party> list = service.selectList(vo);
    	List<Code> cdList = cdService.selectCodeName(cdVo);
    	model.addAttribute("list", list);
    	model.addAttribute("code", cdList);
    	
    	System.out.println(vo.getPartyGen());
    	
//    	Party item = service.selectOne(vo);
//    	model.addAttribute("item", item);
    	
        return "usr/infra/index/index";
    }
    
    @RequestMapping(value="/findmap")
    public String findMap(Model model, PartyVo vo) {
    	
    	return "usr/infra/include/map";
    }
    
    @ResponseBody
    @RequestMapping(value="/findmap/submit", method=RequestMethod.POST)
    public Map<String, Object> submitFindMap(@RequestBody Map<String, Object> location, 
    		Model model, RedirectAttributes rttr) throws Exception {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
    	
    	String lo = (String)location.get("location");
    	
    	rttr.addAttribute("url", "redirect:/newChallger/post");
    	
    	if(lo != null) {
    		model.addAttribute("location", lo);
    		returnMap.put("location", model.getAttribute("location"));
    		returnMap.put("url", rttr.getAttribute("url"));
    		returnMap.put("rt", "success");
    		System.out.println("Location: " + model.getAttribute("location"));
    	} else {
    		returnMap.put("rt", "fail");
    	}
    	
    	return returnMap;
    }
    

    @RequestMapping(value = "/chat", method = RequestMethod.GET)
    public String chat() {
        return "chat";
    }


    @GetMapping("/three")
    public String indexy(){
        return "index";
    }



}
