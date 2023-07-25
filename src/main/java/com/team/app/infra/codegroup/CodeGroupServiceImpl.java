package com.team.app.infra.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.app.infra.codegroup.CodeGroup;
import com.team.app.infra.codegroup.CodeGroupDao;
import com.team.app.infra.codegroup.CodeGroupVo;

@Service
public class CodeGroupServiceImpl implements CodeGroupService {
	
	@Autowired
	CodeGroupDao dao;
	
	@Override
	public int selectOneCount(CodeGroupVo vo) {
		
		return dao.selectOneCount(vo);
	}
	
	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) {
		
		List<CodeGroup> aaa = dao.selectList(vo);
		
		return aaa;
	}

	@Override
	public CodeGroup selectOne(CodeGroupVo vo) {
		
		return dao.selectOne(vo);
	}

	@Override
	public int update(CodeGroup dto) {
		
		return dao.update(dto);
	}

	@Override
	public int delete(CodeGroup dto) {

		return dao.delete(dto);
	}

	@Override
	public int insert(CodeGroup dto) {
		
		return dao.insert(dto);
	}

	@Override
	public int uelect(CodeGroup dto) {
		return dao.uelect(dto);
	}
	
}
