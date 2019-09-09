package Pet.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 分页Bean
 */
public class PageBean<T> implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int currentPage;
    private int pageCount;
    private List<T> list;
    private int pageSize;
    private int totalSize;


    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(int totalSize) {
        this.totalSize = totalSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
