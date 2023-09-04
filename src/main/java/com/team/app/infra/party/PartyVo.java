package com.team.app.infra.party;

public class PartyVo {
	private String seq;
	private String delNy; 
	private String partyType;
	private String partySport;
	private String partyName; 
	private String playerNum; 
	private String playerMax; 
	private String playDt;
	private String playTimeStart; 
	private String playTimeEnd; 
	private String partyLeader; 
	private String partyDesc; 
	private String toolNy; 
	private String partyGen;
	private String partyAge;
	private String madeTime;
	private String partyLocation;
	
	private String mpSeq;
	private String nowStatus;
	private String myName;
	private String leaderName;
	private String mpName;
	private String mpDelNy;
	private String endDt;
	
	private int thisPage = 1;									// 현재 페이지
//	private int rowNumToShow = Constants.ROW_NUM_TO_SHOW;		// 화면에 보여줄 데이터 줄 갯수 - 오라클
//	private int pageNumToShow = Constants.PAGE_NUM_TO_SHOW;		// 화면에 보여줄 페이징 번호 갯수 - 오라클
	
	private int rowNumToShow = 5;		// 화면에 보여줄 데이터 줄 갯수
	private int pageNumToShow = 5;		// 화면에 보여줄 페이징 번호 갯수

	private int totalRows;										// 전체 데이터 갯수
	private int totalPages;										// 전체 페이지 번호
	private int startPage;										// 시작 페이지 번호
	private int endPage;										// 마지막 페이지 번호
	
	private int startRnumForOracle = 1;							// 쿼리 시작 row
	private int endRnumForOracle;								// 쿼리 끝 row
	private Integer RNUM;

	private int startRnumForMysql = 0;	
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getDelNy() {
		return delNy;
	}
	public void setDelNy(String delNy) {
		this.delNy = delNy;
	}
	public String getPartyType() {
		return partyType;
	}
	public void setPartyType(String partyType) {
		this.partyType = partyType;
	}
	public String getPartySport() {
		return partySport;
	}
	public void setPartySport(String partySport) {
		this.partySport = partySport;
	}
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	public String getPlayerNum() {
		return playerNum;
	}
	public void setPlayerNum(String playerNum) {
		this.playerNum = playerNum;
	}
	public String getPlayerMax() {
		return playerMax;
	}
	public void setPlayerMax(String playerMax) {
		this.playerMax = playerMax;
	}
	public String getPlayDt() {
		return playDt;
	}
	public void setPlayDt(String playDt) {
		this.playDt = playDt;
	}
	public String getPlayTimeStart() {
		return playTimeStart;
	}
	public void setPlayTimeStart(String playTimeStart) {
		this.playTimeStart = playTimeStart;
	}
	public String getPlayTimeEnd() {
		return playTimeEnd;
	}
	public void setPlayTimeEnd(String playTimeEnd) {
		this.playTimeEnd = playTimeEnd;
	}
	public String getPartyLeader() {
		return partyLeader;
	}
	public void setPartyLeader(String partyLeader) {
		this.partyLeader = partyLeader;
	}
	public String getPartyDesc() {
		return partyDesc;
	}
	public void setPartyDesc(String partyDesc) {
		this.partyDesc = partyDesc;
	}
	public String getToolNy() {
		return toolNy;
	}
	public void setToolNy(String toolNy) {
		this.toolNy = toolNy;
	}
	public String getPartyGen() {
		return partyGen;
	}
	public void setPartyGen(String partyGen) {
		this.partyGen = partyGen;
	}
	public String getPartyAge() {
		return partyAge;
	}
	public void setPartyAge(String partyAge) {
		this.partyAge = partyAge;
	}
	public String getMadeTime() {
		return madeTime;
	}
	public void setMadeTime(String madeTime) {
		this.madeTime = madeTime;
	}
	public String getPartyLocation() {
		return partyLocation;
	}
	public void setPartyLocation(String partyLocation) {
		this.partyLocation = partyLocation;
	}
	public String getMpSeq() {
		return mpSeq;
	}
	public void setMpSeq(String mpSeq) {
		this.mpSeq = mpSeq;
	}
	public String getNowStatus() {
		return nowStatus;
	}
	public void setNowStatus(String nowStatus) {
		this.nowStatus = nowStatus;
	}
	public String getMyName() {
		return myName;
	}
	public void setMyName(String myName) {
		this.myName = myName;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	public String getMpName() {
		return mpName;
	}
	public void setMpName(String mpName) {
		this.mpName = mpName;
	}
	public String getMpDelNy() {
		return mpDelNy;
	}
	public void setMpDelNy(String mpDelNy) {
		this.mpDelNy = mpDelNy;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}
	public int getRowNumToShow() {
		return rowNumToShow;
	}
	public void setRowNumToShow(int rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}
	public int getPageNumToShow() {
		return pageNumToShow;
	}
	public void setPageNumToShow(int pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartRnumForOracle() {
		return startRnumForOracle;
	}
	public void setStartRnumForOracle(int startRnumForOracle) {
		this.startRnumForOracle = startRnumForOracle;
	}
	public int getEndRnumForOracle() {
		return endRnumForOracle;
	}
	public void setEndRnumForOracle(int endRnumForOracle) {
		this.endRnumForOracle = endRnumForOracle;
	}
	public Integer getRNUM() {
		return RNUM;
	}
	public void setRNUM(Integer rNUM) {
		RNUM = rNUM;
	}
	public int getStartRnumForMysql() {
		return startRnumForMysql;
	}
	public void setStartRnumForMysql(int startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
	}
	
	
	public void setParamsPaging(int totalRows) {
		
		//		setThisPage(3);

		setTotalRows(totalRows);

		if (getTotalRows() == 0) {
			setTotalPages(1);
		} else {
			setTotalPages(getTotalRows() / getRowNumToShow());
		}

		if (getTotalRows() % getRowNumToShow() > 0) {
			setTotalPages(getTotalPages() + 1);
		}

		if (getTotalPages() < getThisPage()) {
			setThisPage(getTotalPages());
		}
		
		setStartPage(((getThisPage() - 1) / getPageNumToShow()) * getPageNumToShow() + 1);

		setEndPage(getStartPage() + getPageNumToShow() - 1);

		if (getEndPage() > getTotalPages()) {
			setEndPage(getTotalPages());
		}
		
		setEndRnumForOracle((getRowNumToShow() * getThisPage()));
		setStartRnumForOracle((getEndRnumForOracle() - getRowNumToShow()) + 1);
		if (getStartRnumForOracle() < 1) setStartRnumForOracle(1);
		
		if (thisPage == 1) {
			setStartRnumForMysql(0);
		} else {
			setStartRnumForMysql((getRowNumToShow() * (getThisPage()-1)));
		}
		
		System.out.println("getThisPage():" + getThisPage());
		System.out.println("getTotalRows():" + getTotalRows());
		System.out.println("getRowNumToShow():" + getRowNumToShow());
		System.out.println("getTotalPages():" + getTotalPages());
		System.out.println("getStartPage():" + getStartPage());
		System.out.println("getEndPage():" + getEndPage());		
		System.out.println("getStartRnumForOracle():" + getStartRnumForOracle());
		System.out.println("getEndRnumForOracle():" + getEndRnumForOracle());
		System.out.println("getStartRnumForMysql(): " + getStartRnumForMysql());
		
	}
}
