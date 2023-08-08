package com.team.app.infra.chat;

import java.util.List;

public interface ChatDao {
    public List<ChatVo> list();
    public void insert(ChatVo vo);

    public void delete(int id);

    public int last();
}
