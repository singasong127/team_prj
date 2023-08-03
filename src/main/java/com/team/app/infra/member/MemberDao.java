package com.team.app.infra.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import com.team.app.infra.upload.Upload;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.team.app.infra.member.MemberMapper";
	
	public List<Member> memberList(MemberVo vo){
		return sqlSession.selectList(namespace + ".memberList", vo);
	}
	
	public Member memberOne(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".memberOne", vo);
	}
	
	public int memberOneCount(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".memberOneCount", vo);
	}
	
	public int newMemberJoin(Member dto) {
		return sqlSession.insert(namespace + ".newMemberJoin", dto);
	}
	
	public int newAdminJoin(Member dto) {
		return sqlSession.insert(namespace + ".newAdminJoin", dto);
	}
	
	public int memberUpdate(Member dto) {
		return sqlSession.update(namespace + ".memberUpdate", dto);
	}
	
	public int memberUelete(Member dto) {
		return sqlSession.update(namespace + ".memberUelete" , dto);
	}
	
	public int memberExcute(Member dto) {
		return sqlSession.delete(namespace + ".memberExcute", dto);
	}
	
	public Member usrLogin(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".usrLogin", vo);
	}

    public int insertUploaded(Member dto) { return sqlSession.insert(namespace + ".insertUploaded",dto);
    }

	public List<Upload> selectListUpload(Member dto) {return sqlSession.selectList(namespace+".selectListUpload",dto);}

	public int deleteUpload(Member dto) {return sqlSession.delete(namespace+".deleteUpload",dto);}
}
