package com.team.app.infra.code;

import java.util.List;

public interface CodeService {
    public List<Code> selectList(CodeVo vo);

    int selectOneCount(CodeVo vo);

    Code selectOne(CodeVo vo);

    int update(Code dto);

    int insert(Code dto);

    int uelete(CodeVo vo);
    
<<<<<<< HEAD
    List<Code> selectOpt();
    
=======
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
}
