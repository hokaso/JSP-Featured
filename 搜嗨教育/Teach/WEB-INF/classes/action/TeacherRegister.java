package action;

import java.io.File;
import java.sql.Timestamp;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import bean.Teacher;
import work.RegisterWork;

public class TeacherRegister extends ActionSupport{
	private Teacher teacher;
	private File upload;//文件名
	private String uploadFileName;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public void SaveFile(){
		ActionContext act = ActionContext.getContext();
		String realpath = "E:/Myvideos/";
		if(upload!=null){
			File saveDir = new File(realpath);
			if(!saveDir.exists()){
				saveDir.mkdirs();
			}
				File saveFile =new File(saveDir,uploadFileName);
				try{
					FileUtils.copyFile(upload, saveFile);
				}catch(Exception e){
					e.printStackTrace();
				}
			
			act.put("message", "多文件上传成功");
		}
	}
	public String TeacherRegister(){
		SaveFile();
		Timestamp d = new Timestamp(System.currentTimeMillis());
		
		teacher.setTregisterTime(d);
		teacher.setTphone(uploadFileName);
		System.out.println(teacher.getTno()+" "+teacher.getTemail()+" "+teacher.getTpassword()+" "+teacher.getTemail()+" "+teacher.getTsex()+" "+teacher.getTphone()+" "+teacher.getTregisterTime());
		RegisterWork rw = new RegisterWork();
		boolean result = rw.TeacherRegister(teacher);
		if(result){
			return SUCCESS;
		}else{
			return "error";
		}
		
	}
}
