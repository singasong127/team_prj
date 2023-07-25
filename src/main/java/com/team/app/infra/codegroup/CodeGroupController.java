package com.team.app.infra.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.app.infra.codegroup.CodeGroup;
import com.team.app.infra.codegroup.CodeGroupVo;

@Controller
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping("/cglist")
    public String codeGroupList(CodeGroupVo vo, Model model){
		
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
		
	    return "admin/infra/codeGroup/codeGroupList";
	}
	
	@RequestMapping(value="/cgform")
	public String codeGroupForm(CodeGroupVo vo, Model model) {
		CodeGroup codeGroup = service.selectOne(vo);
		
		model.addAttribute("item", codeGroup);
		
		return "xdm/infra/codegroup/codeGroupForm";
	}
	
	@RequestMapping(value="/cgupdate")
	public String codeGroupUpdate(CodeGroup dto) {
		
		System.out.println("Update");
		
		service.update(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cguelect")
	public String codeGroupUelect(CodeGroup dto) {
		
		System.out.println("Uelect");
		
		service.uelect(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cgdelete")
	public String codeGroupDelete(CodeGroup dto) {
		
		System.out.println("Deleted");
		
		service.delete(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cginsert")
	public String codeGroupInsert(CodeGroup dto) {
		
		System.out.println("Inserted");
		
		service.insert(dto);
		
		return "redirect:/cglist";
	}
	
}
