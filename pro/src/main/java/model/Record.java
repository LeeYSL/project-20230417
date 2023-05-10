package model;

public class Record {
	private int recordNum;
	private String teamName;
	private int level;
	private int gameNum;
	private int gameWin;
	private int gameLose;
	private int winPoint;
	private String leagueYear;
	private String leagueName;
	private String teamImg;
	
	public String getTeamImg() {
		return teamImg;
	}
	public void setTeamImg(String teamImg) {
		this.teamImg = teamImg;
	}
	public int getRecordNum() {
		return recordNum;
	}
	public void setRecordNum(int recordNum) {
		this.recordNum = recordNum;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getGameNum() {
		return gameNum;
	}
	public void setGameNum(int gameNum) {
		this.gameNum = gameNum;
	}
	public int getGameWin() {
		return gameWin;
	}
	public void setGameWin(int gameWin) {
		this.gameWin = gameWin;
	}
	public int getGameLose() {
		return gameLose;
	}
	public void setGameLose(int gameLose) {
		this.gameLose = gameLose;
	}
	public int getWinPoint() {
		return winPoint;
	}
	public void setWinPoint(int winPoint) {
		this.winPoint = winPoint;
	}
	public String getLeagueYear() {
		return leagueYear;
	}
	public void setLeagueYear(String leagueYear) {
		this.leagueYear = leagueYear;
	}
	public String getLeagueName() {
		return leagueName;
	}
	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}
	
	@Override
	public String toString() {
		return "Record [recordNum=" + recordNum + ", teamName=" + teamName + ", level=" + level + ", gameNum=" + gameNum
				+ ", gameWin=" + gameWin + ", gameLose=" + gameLose + ", winPoint=" + winPoint + ", leagueYear="
				+ leagueYear + ", leagueName=" + leagueName + "]";
	}
}
