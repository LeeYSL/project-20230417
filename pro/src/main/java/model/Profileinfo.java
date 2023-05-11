package model;

public class Profileinfo {
		private String name;
		private String position;
		private String num;
		private String birthday;
		private String school;
		private String height;
		private String numposition;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getPosition() {
			return position;
		}
		public void setPosition(String position) {
			this.position = position;
		}
		public String getNum() {
			return num;
		}
		public void setNum(String num) {
			this.num = num;
		}
		public String getBirthday() {
			return birthday;
		}
		public void setBirthday(String birthday) {
			this.birthday = birthday;
		}
		public String getSchool() {
			return school;
		}
		public void setSchool(String school) {
			this.school = school;
		}
		public String getHeight() {
			return height;
		}
		public void setHeight(String height) {
			this.height = height;
		}
		public String getNumposition() {
			return numposition;
		}
		public void setNumposition(String numposition) {
			this.numposition = numposition;
		}
		@Override
		public String toString() {
			return "Profileinfo [name=" + name + ", position=" + position + ", num=" + num + ", birthday=" + birthday
					+ ", school=" + school + ", height=" + height + ", numposition=" + numposition + "]";
		}


	}
