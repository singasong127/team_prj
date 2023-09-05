package com.team.app.infra.code;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CodeServiceImpl implements CodeService{
    @Autowired
    CodeDao dao;


    @Override
    public List<Code> selectList(CodeVo vo) {
        return dao.selectList(vo);
    }

    @Override
    public int selectOneCount(CodeVo vo) {
        return dao.selectOneCount(vo);
    }

    @Override
    public Code selectOne(CodeVo vo) {
        return dao.selectOne(vo);
    }

    @Override
    public int update(Code dto) {
        return dao.update(dto);
    }

    @Override
    public int insert(Code dto) {
        return dao.insert(dto);
    }

    @Override
    public int uelete(CodeVo vo) {
        return dao.uelete(vo);
    }

	@Override
	public List<Code> selectCodeName(CodeVo vo) {
		return dao.selectCodeName(vo);
	}

	@Override
	public List<Code> selectPartyStatus(CodeVo vo) {
		return dao.selectPartyStatus(vo);
	}

}
