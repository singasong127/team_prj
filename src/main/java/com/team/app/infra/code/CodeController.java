package com.team.app.infra.code;

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
    CodeGroupServiceImpl cgService;
    @RequestMapping("/cdlist")
    public String selectList(@ModelAttribute("vo") CodeVo vo, Model model){
        vo.setShKey(vo.getShKey() == null ? "" : vo.getShKey());
        vo.setParamsPaging(cdService.selectOneCount(vo));
        //

        if(vo.getTotalRows() > 0) {
            List<Code> list = cdService.selectList(vo);
            model.addAttribute("list", list);
        } else {
//			by pass
        }
        return "admin/infra/code/codeList";
    }
}
