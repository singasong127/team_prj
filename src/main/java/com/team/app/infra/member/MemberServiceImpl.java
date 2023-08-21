package com.team.app.infra.member;

import java.io.File;
import java.util.List;
import java.util.UUID;

import com.team.app.infra.upload.Constants_b;
import com.team.app.infra.upload.Upload;
import com.team.app.infra.upload.UtilDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	@Override
	public List<Member> memberList(MemberVo vo) {
		return dao.memberList(vo);
	}

	@Override
	public Member memberOne(MemberVo vo) {
		return dao.memberOne(vo);
	}

	@Override
	public int memberOneCount(MemberVo vo) {
		return dao.memberOneCount(vo);
	}

	@Override
	public int newMemberJoin(Member dto) throws Exception {
		return dao.newMemberJoin(dto);
	}

	@Override
	public int newAdminJoin(Member dto) throws Exception {
		dao.newAdminJoin(dto);
		uploadFiles(dto.getUploadImgProfile(), dto, "uploadList", dto.getUploadImgProfileType(), dto.getUploadImgProfileMaxNumber());
		return 1;
	}

	@Override
	public int memberUpdate(Member dto) throws Exception {
		dao.memberUpdate(dto);
		//UPLOAD IMG
		dao.deleteUpload(dto);
		uploadFiles(dto.getUploadImgProfile(), dto, "uploadList", dto.getUploadImgProfileType(), dto.getUploadImgProfileMaxNumber());
		//UPLOAD IMG


		return 1;
	}

	@Override
	public int memberUelete(Member dto) {
		return dao.memberUelete(dto);
	}


//	@Override
//	public int memberExcute(Member dto) {
//		return dao.memberExcute(dto);
//	}

	@Override
	public Member usrLogin(MemberVo vo) {
		return dao.usrLogin(vo);
	}

	/**
	 * @param multipartFiles: 프로필 사진 array
	 * @param dto: 업로드용 dto 요소들
	 * @param tableName: 들어갈 업로드테이블 이름 (mysql)
	 * @param type: 여기선 1번(프로필)
	 * @param maxNumber: 여기선 1 (최대 1장)
	 */
	@Override
	public void uploadFiles(MultipartFile[] multipartFiles, Member dto, String tableName, int type, int maxNumber) throws Exception {
		for(int i=0; i<multipartFiles.length; i++) {

			if(!multipartFiles[i].isEmpty()) {

				String className = dto.getClass().getSimpleName().toString().toLowerCase();
				String fileName = multipartFiles[i].getOriginalFilename();
				String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				String uuid = UUID.randomUUID().toString();
				String uuidFileName = uuid + "." + ext;
				String pathModule = className;
				String nowString = UtilDateTime.nowString();
				String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10);
				String path = Constants_b.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
//          String path = Constants.UPLOAD_PATH_PREFIX  + "/";
				String pathForView = Constants_b.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";

				File uploadPath = new File(path);

				if (!uploadPath.exists()) {
					uploadPath.mkdirs();
				} else {
					// by pass
				}

				multipartFiles[i].transferTo(new File(path + uuidFileName));

				dto.setPath(pathForView);
				dto.setOriginalName(fileName);
				dto.setUuidName(uuidFileName);
				dto.setExt(ext);
				dto.setSize(multipartFiles[i].getSize());

				dto.setTableName(tableName);
				dto.setType(type);
				dto.setDefaultNy(dto.getDefaultNy());
//          dto.setSort(maxNumber + i);
				dto.setPseq(dto.getSeq());

				dao.insertUploaded(dto);

			}
		}
	}

	/**
	 * 업로드 테이블에서 SELECT
	 * @param dto: Member' seq
	 * @return: SELECT * FROM uploadList WHERE pseq = #{seq}
	 */
	@Override
	public List<Upload> selectListUpload(Member dto) {
		return dao.selectListUpload(dto);
	}

	/**
	 * @param dto: member's seq
	 * @return: DELETE FROM uploadList WHERE pseq = #{seq}
	 */
	@Override
	public int deleteUpload(Member dto) {
		return dao.deleteUpload(dto);
	}

	/**
	 * 아이디 중복체크
	 * @param vo: email from 'UsrJoin.jsp'
	 * @return: if duplicated, return fail vice versa
	 */
	@Override
	public int selectOneCheckId(MemberVo vo) {
		return dao.selectOneCheckId(vo);
	}


}
