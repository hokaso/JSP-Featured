package Pet.entity;


public class UploadStatus {
    private long bytesRead;//已经上传的字节数，单位：字节
    private long contentLength;//所有文件总长度，单位：字节
    private int items;//正在上传的第几个文件
    private long startTime = System.currentTimeMillis();//开始上传的时间,用于计算上传速度
 
    public long getBytesRead() {
        return bytesRead;
    }
 
    public void setBytesRead(long bytesRead) {
        this.bytesRead = bytesRead;
    }
 
    public long getContentLength() {
        return contentLength;
    }
 
    public void setContentLength(long contentLength) {
        this.contentLength = contentLength;
    }
 
    public int getItems() {
        return items;
    }
 
    public void setItems(int items) {
        this.items = items;
    }
 
    public long getStartTime() {
        return startTime;
    }
 
    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }
}