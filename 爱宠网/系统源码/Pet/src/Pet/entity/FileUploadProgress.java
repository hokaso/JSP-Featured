package Pet.entity;

public class FileUploadProgress {
		
	 private long startTime = System.currentTimeMillis();//开始时间
	    private long totalLength=1;//文件上传的总长度
	    private long currentLength=0;//当前文件上传的长度
	    private boolean flag;//是否上传完成

	    public long getTotalLength() {
	        return totalLength;
	    }

	    public void setTotalLength(long totalLength) {
	        this.totalLength = totalLength;
	    }

	    public long getCurrentLength() {
	        return currentLength;
	    }

	    public void setCurrentLength(long currentLength) {
	        this.currentLength = currentLength;
	    }

	    public boolean isFlag() {
	        return flag;
	    }

	    public void setFlag(boolean flag) {
	        this.flag = flag;
	    }

	    public long getStartTime() {
	        return startTime;
	    }

	    public void setStartTime(long startTime) {
	        this.startTime = startTime;
	    }

	    public FileUploadProgress(){
	        super();
	    }
}
