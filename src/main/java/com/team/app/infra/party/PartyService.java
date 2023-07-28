package com.team.app.infra.party;

import java.util.List;


public interface PartyService {
	
	public int selectOneCount(PartyVo vo);
	
	public List<Party> selectList(PartyVo vo);
	
	public Party selectOne(PartyVo vo);
	
	public int update(Party dto);
	
	public int uelete(Party dto);
	
	public int insert(Party dto);
}
