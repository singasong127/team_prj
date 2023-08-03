package com.team.app.infra.member;

import com.team.app.infra.upload.Upload;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface MemberService {

	List<Member> memberList(MemberVo vo);
	
	public Member memberOne(MemberVo vo);

	public int memberOneCount(MemberVo vo);
	
	public int newMemberJoin(Member dto) throws Exception;
	
	public int newAdminJoin(Member dto) throws Exception;
	
	public int memberUpdate(Member dto) throws Exception;
	
	public int memberUelete(Member dto);
	
//	public int memberExcute(Member dto);
	
	public Member usrLogin(MemberVo vo);

	/**
	 * @param multipartFiles
	 * @param dto
	 * @param tableName
	 * @param type
	 * @param maxNumber
	 * @throws Exception
	 */
	 void uploadFiles(MultipartFile[] multipartFiles, Member dto, String tableName, int type, int maxNumber) throws Exception;

	/**
	 * @param dto: member's seq
	 * @return: SELECT * FROM uploadList WHERE pseq = #{seq}
	 */
	List<Upload> selectListUpload(Member dto);

	int deleteUpload(Member dto);

}//END OF MemberService
