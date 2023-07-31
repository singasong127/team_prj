package com.team.app.infra.code;

import org.springframework.stereotype.Service;

import java.util.List;

public interface CodeService {
    public List<Code> selectList(CodeVo vo);

    int selectOneCount(CodeVo vo);

    Code selectOne(CodeVo vo);

    int update(Code dto);

    int insert(Code dto);

    int uelete(CodeVo vo);
}
