package com.team.app.infra.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ChatController {
    @Autowired
    ChatDao dao;
    @ResponseBody
    @RequestMapping("/chat.json")
    public List<ChatVo> list(){
        return dao.list();

    }

    @RequestMapping(value="/chat/insert",method= RequestMethod.POST)
    public int insert(ChatVo vo){
        dao.insert(vo);
        int last=dao.last();
        System.out.println("..............."+last);
        return last;
    }
    @RequestMapping(value="/chat/delete",method=RequestMethod.POST)
    public void delete(int id){
        dao.delete(id);
    }

}
