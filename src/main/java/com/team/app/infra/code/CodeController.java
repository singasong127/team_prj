package com.team.app.infra.code;

import com.team.app.infra.codegroup.CodeGroup;
import com.team.app.infra.codegroup.CodeGroupServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CodeController {
    @Autowired
    CodeServiceImpl cdService;
    @Autowired
    CodeGroupServiceImpl cgService;
    @RequestMapping("/codeList")
    public String selectList(CodeVo vo, Model model){
        vo.setShKey(vo.getShKey() == null ? "" : vo.getShKey());
        vo.setParamsPaging(cdService.selectOneCount(vo));
        model.addAttribute("vo",vo);
        //

        if(vo.getTotalRows() > 0) {
            List<Code> list = cdService.selectList(vo);
            model.addAttribute("list", list);
        } else {
//			by pass
        }
        return "admin/infra/code/codeList";
    }
    @RequestMapping("/codeForm")
    public String codeForm(CodeVo vo, Model model){
        Code dto = cdService.selectOne(vo);
        model.addAttribute("item", dto);
        return "admin/infra/code/codeForm";
    }
    @RequestMapping("/codeForm/update")
    public String codeUpdate(Code dto){
        cdService.update(dto);
        System.out.println();
        return "redirect:/codeList";
    }

    @RequestMapping("/codeForm/insert")
    public String codeInsert(Code dto){
        cdService.insert(dto);
        return "redirect:/codeList";
    }

    @RequestMapping("/codeForm/uelete")
    public String codeDelete(CodeVo vo){
        cdService.uelete(vo);
        return "redirect:/codeList";
    }

    //CodeGroup SELECT OPTION
    //CodeGroup SELECT OPTION
    @ModelAttribute("optList")
    public List<CodeGroup> codeGroupOptList() {
        return cgService.selectOpt();
    }
    //CodeGroup SELECT OPTION
    //CodeGroup SELECT OPTION



}// End of the Controller
