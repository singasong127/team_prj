package com.team.app.infra.party;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartyServiceImpl implements PartyService {
	
	@Autowired
	PartyDao dao;
	
	@Override
	public int selectOneCount(PartyVo vo) {
		return dao.selectOneCount(vo);
	}

	@Override
	public List<Party> selectList(PartyVo vo) {
		
		List<Party> partyList = dao.selectList(vo);
		
		return partyList;
	}

	@Override
	public Party selectOne(PartyVo vo) {
		return dao.selectOne(vo);
	}
	
	@Override
	public List<Party> selectMyParty(PartyVo vo) {
		return dao.selectMyParty(vo);
	}

	@Override
	public int update(Party dto) {
		return dao.update(dto);
	}

	@Override
	public int uelete(Party dto) {
		return dao.uelete(dto);
	}

	@Override
	public int insert(Party dto) {
		return dao.insert(dto);
	}



}
