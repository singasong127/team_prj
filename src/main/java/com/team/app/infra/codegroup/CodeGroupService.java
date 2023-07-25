package com.team.app.infra.codegroup;

import java.util.List;

import com.team.app.infra.codegroup.CodeGroup;
import com.team.app.infra.codegroup.CodeGroupVo;

public interface CodeGroupService {
	
	public int selectOneCount(CodeGroupVo vo);
	
	public List<CodeGroup> selectList(CodeGroupVo vo);
	
	public CodeGroup selectOne(CodeGroupVo vo);
	
	public int update(CodeGroup dto);
	
	public int uelect(CodeGroup dto);
	
	public int delete(CodeGroup dto);
	
	public int insert(CodeGroup dto);
	
}	
