package Pojo;

public class teach {

	private String teach_id;
	private String junior_id;
	private int course_id;
	private String college_id;
	private String teach_statue;
	private String score_statue;
	private int college_score;

	public String getTeach_id() {
		return teach_id;
	}

	public String getJunior_id() {
		return junior_id;
	}

	public void setJunior_id(String junior_id) {
		this.junior_id = junior_id;
	}

	public int getCourse_id() {
		return course_id;
	}

	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}

	public String getCollege_id() {
		return college_id;
	}

	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}

	public String getTeach_statue() {
		return teach_statue;
	}

	public void setTeach_statue(String teach_statue) {
		this.teach_statue = teach_statue;
	}

	public String getScore_statue() {
		return score_statue;
	}

	public void setScore_statue(String score_statue) {
		this.score_statue = score_statue;
	}

	public int getCollege_score() {
		return college_score;
	}

	public void setCollege_score(int college_score) {
		this.college_score = college_score;
	}

	public void setTeach_id(String teach_id) {
		this.teach_id = teach_id;
	}

	@Override
	public String toString() {
		return "teach [teach_id=" + teach_id + ", junior_id=" + junior_id + ", course_id=" + course_id + ", college_id="
				+ college_id + ", teach_statue=" + teach_statue + ", score_statue=" + score_statue + ", college_score="
				+ college_score + "]";
	}

	
}
