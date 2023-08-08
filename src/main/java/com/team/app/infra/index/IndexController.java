package com.team.app.infra.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.team.app.infra.party.Party;
import com.team.app.infra.party.PartyServiceImpl;
import com.team.app.infra.party.PartyVo;


@Controller
public class IndexController {
	
	@Autowired
	PartyServiceImpl service;
	
    @GetMapping("/")
    public String index(@ModelAttribute Party party, Model model, PartyVo vo) {
    	
    	service.selectList(vo);
    	// service.selectOne(vo);
    	
    	List<Party> list = service.selectList(vo);
    	model.addAttribute("list", list);
    	
//    	Party item = service.selectOne(vo);
//    	model.addAttribute("item", item);
    	
        return "usr/infra/index/index";
    }
    
    @GetMapping("/findmap")
    public String findMap() {
    	return "usr/infra/include/map";
    }
    
   
}
