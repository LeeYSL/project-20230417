package model;

public class Game {
	private String homeTeam;
	private String awayTeam;
	private int homeWin;
	private int awayWin;
	private String gameDay;
	private String homeImg;
	private String awayImg;
	
	public String getHomeTeam() {
		return homeTeam;
	}
	public void setHomeTeam(String homeTeam) {
		this.homeTeam = homeTeam;
	}
	public String getAwayTeam() {
		return awayTeam;
	}
	public void setAwayTeam(String awayTeam) {
		this.awayTeam = awayTeam;
	}
	public int getHomeWin() {
		return homeWin;
	}
	public void setHomeWin(int homeWin) {
		this.homeWin = homeWin;
	}
	public int getAwayWin() {
		return awayWin;
	}
	public void setAwayWin(int awayWin) {
		this.awayWin = awayWin;
	}
	public String getGameDay() {
		return gameDay;
	}
	public void setGameDay(String gameDay) {
		this.gameDay = gameDay;
	}
	
	public String getHomeImg() {
		return homeImg;
	}
	public void setHomeImg(String homeImg) {
		this.homeImg = homeImg;
	}
	public String getAwayImg() {
		return awayImg;
	}
	public void setAwayImg(String awayImg) {
		this.awayImg = awayImg;
	}
	@Override
	public String toString() {
		return "game [homeTeam=" + homeTeam + ", awayTeam=" + awayTeam + ", homeWin=" + homeWin + ", awayWin=" + awayWin
				+ ", gameDay=" + gameDay + "]";
	}

}
