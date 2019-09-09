package Pet. utils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.dispatcher.multipart.JakartaMultiPartRequest;
import org.apache.struts2.dispatcher.multipart.MultiPartRequest;

import com.opensymphony.xwork2.LocaleProvider;
import com.opensymphony.xwork2.inject.Inject;
import com.opensymphony.xwork2.util.LocalizedTextUtil;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

import Pet.entity.UploadStatus;
 
public class MyMultiPartRequest implements MultiPartRequest {
    static final Logger LOG = LoggerFactory.getLogger(JakartaMultiPartRequest.class);
    protected Map<String, List<FileItem>> files = new HashMap();
    protected Map<String, List<String>> params = new HashMap();
    protected List<String> errors = new ArrayList();
    protected long maxSize;
    private Locale defaultLocale;
 
    public MyMultiPartRequest() {
        this.defaultLocale = Locale.ENGLISH;
    }
 
    @Inject("struts.multipart.maxSize")
    public void setMaxSize(String maxSize) {
        this.maxSize = Long.parseLong(maxSize);
    }
 
    @Inject
    public void setLocaleProvider(LocaleProvider provider) {
        this.defaultLocale = provider.getLocale();
    }
 
    public void parse(HttpServletRequest request, String saveDir) throws IOException {
        String errorMessage;
        try {
            this.setLocale(request);
            this.processUpload(request, saveDir);
        } catch (SizeLimitExceededException var5) {
            if(LOG.isWarnEnabled()) {
                LOG.warn("Request exceeded size limit!", var5, new String[0]);
            }
 
            errorMessage = this.buildErrorMessage(var5, new Object[]{Long.valueOf(var5.getPermittedSize()), Long.valueOf(var5.getActualSize())});
            if(!this.errors.contains(errorMessage)) {
                this.errors.add(errorMessage);
            }
        } catch (Exception var6) {
            if(LOG.isWarnEnabled()) {
                LOG.warn("Unable to parse request", var6, new String[0]);
            }
 
            errorMessage = this.buildErrorMessage(var6, new Object[0]);
            if(!this.errors.contains(errorMessage)) {
                this.errors.add(errorMessage);
            }
        }
 
    }
 
    protected void setLocale(HttpServletRequest request) {
        if(this.defaultLocale == null) {
            this.defaultLocale = request.getLocale();
        }
 
    }
 
    protected String buildErrorMessage(Throwable e, Object[] args) {
        String errorKey = "struts.messages.upload.error." + e.getClass().getSimpleName();
        if(LOG.isDebugEnabled()) {
            LOG.debug("Preparing error message for key: [#0]", new String[]{errorKey});
        }
 
        return LocalizedTextUtil.findText(this.getClass(), errorKey, this.defaultLocale, e.getMessage(), args);
    }
 
    protected void processUpload(HttpServletRequest request, String saveDir) throws FileUploadException, UnsupportedEncodingException {
        Iterator i$ = this.parseRequest(request, saveDir).iterator();
 
        while(i$.hasNext()) {
            FileItem item = (FileItem)i$.next();
            if(LOG.isDebugEnabled()) {
                LOG.debug("Found item " + item.getFieldName(), new String[0]);
            }
 
            if(item.isFormField()) {
                this.processNormalFormField(item, request.getCharacterEncoding());
            } else {
                this.processFileField(item);
            }
        }
 
    }
 
    protected void processFileField(FileItem item) {
        if(LOG.isDebugEnabled()) {
            LOG.debug("Item is a file upload", new String[0]);
        }
 
        if(item.getName() != null && item.getName().trim().length() >= 1) {
            Object values;
            if(this.files.get(item.getFieldName()) != null) {
                values = (List)this.files.get(item.getFieldName());
            } else {
                values = new ArrayList();
            }
 
            ((List)values).add(item);
            this.files.put(item.getFieldName(), (List<FileItem>) values);
        } else {
            LOG.debug("No file has been uploaded for the field: " + item.getFieldName(), new String[0]);
        }
    }
 
    protected void processNormalFormField(FileItem item, String charset) throws UnsupportedEncodingException {
        if(LOG.isDebugEnabled()) {
            LOG.debug("Item is a normal form field", new String[0]);
        }
 
        Object values;
        if(this.params.get(item.getFieldName()) != null) {
            values = (List)this.params.get(item.getFieldName());
        } else {
            values = new ArrayList();
        }
 
        if(charset != null) {
            ((List)values).add(item.getString(charset));
        } else {
            ((List)values).add(item.getString());
        }
 
        this.params.put(item.getFieldName(), (List<String>) values);
        item.delete();
    }
 
    protected List<FileItem> parseRequest(HttpServletRequest servletRequest, String saveDir) throws FileUploadException {
        UploadStatus status = new UploadStatus(); // 上传状态
        UploadListener listner = new UploadListener(status); // 监听器
        servletRequest.getSession().setAttribute("uploadStatus", status); // 把状态放到session里去
 
        DiskFileItemFactory fac = createDiskFileItemFactory(saveDir);
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setSizeMax(maxSize);
        upload.setProgressListener(listner);// 添加监听器
 
        return upload.parseRequest(createRequestContext(servletRequest));
    }
 
    protected ServletFileUpload createServletFileUpload(DiskFileItemFactory fac) {
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setSizeMax(this.maxSize);
        return upload;
    }
 
    protected DiskFileItemFactory createDiskFileItemFactory(String saveDir) {
        DiskFileItemFactory fac = new DiskFileItemFactory();
        fac.setSizeThreshold(0);
        if(saveDir != null) {
            fac.setRepository(new File(saveDir));
        }
 
        return fac;
    }
 
    public Enumeration<String> getFileParameterNames() {
        return Collections.enumeration(this.files.keySet());
    }
 
    public String[] getContentType(String fieldName) {
        List items = (List)this.files.get(fieldName);
        if(items == null) {
            return null;
        } else {
            ArrayList contentTypes = new ArrayList(items.size());
            Iterator i$ = items.iterator();
 
            while(i$.hasNext()) {
                FileItem fileItem = (FileItem)i$.next();
                contentTypes.add(fileItem.getContentType());
            }
 
            return (String[])contentTypes.toArray(new String[contentTypes.size()]);
        }
    }
 
    public File[] getFile(String fieldName) {
        List items = (List)this.files.get(fieldName);
        if(items == null) {
            return null;
        } else {
            ArrayList fileList = new ArrayList(items.size());
 
            File storeLocation;
            for(Iterator i$ = items.iterator(); i$.hasNext(); fileList.add(storeLocation)) {
                FileItem fileItem = (FileItem)i$.next();
                storeLocation = ((DiskFileItem)fileItem).getStoreLocation();
                if(fileItem.isInMemory() && storeLocation != null && !storeLocation.exists()) {
                    try {
                        storeLocation.createNewFile();
                    } catch (IOException var8) {
                        if(LOG.isErrorEnabled()) {
                            LOG.error("Cannot write uploaded empty file to disk: " + storeLocation.getAbsolutePath(), var8, new String[0]);
                        }
                    }
                }
            }
 
            return (File[])fileList.toArray(new File[fileList.size()]);
        }
    }
 
    public String[] getFileNames(String fieldName) {
        List items = (List)this.files.get(fieldName);
        if(items == null) {
            return null;
        } else {
            ArrayList fileNames = new ArrayList(items.size());
            Iterator i$ = items.iterator();
 
            while(i$.hasNext()) {
                FileItem fileItem = (FileItem)i$.next();
                fileNames.add(this.getCanonicalName(fileItem.getName()));
            }
 
            return (String[])fileNames.toArray(new String[fileNames.size()]);
        }
    }
 
    public String[] getFilesystemName(String fieldName) {
        List items = (List)this.files.get(fieldName);
        if(items == null) {
            return null;
        } else {
            ArrayList fileNames = new ArrayList(items.size());
            Iterator i$ = items.iterator();
 
            while(i$.hasNext()) {
                FileItem fileItem = (FileItem)i$.next();
                fileNames.add(((DiskFileItem)fileItem).getStoreLocation().getName());
            }
 
            return (String[])fileNames.toArray(new String[fileNames.size()]);
        }
    }
 
    public String getParameter(String name) {
        List v = (List)this.params.get(name);
        return v != null && v.size() > 0?(String)v.get(0):null;
    }
 
    public Enumeration<String> getParameterNames() {
        return Collections.enumeration(this.params.keySet());
    }
 
    public String[] getParameterValues(String name) {
        List v = (List)this.params.get(name);
        return v != null && v.size() > 0?(String[])v.toArray(new String[v.size()]):null;
    }
 
    public List<String> getErrors() {
        return this.errors;
    }
 
    private String getCanonicalName(String filename) {
        int forwardSlash = filename.lastIndexOf("/");
        int backwardSlash = filename.lastIndexOf("\\");
        if(forwardSlash != -1 && forwardSlash > backwardSlash) {
            filename = filename.substring(forwardSlash + 1, filename.length());
        } else if(backwardSlash != -1 && backwardSlash >= forwardSlash) {
            filename = filename.substring(backwardSlash + 1, filename.length());
        }
 
        return filename;
    }
 
    protected RequestContext createRequestContext(final HttpServletRequest req) {
        return new RequestContext() {
            public String getCharacterEncoding() {
                return req.getCharacterEncoding();
            }
 
            public String getContentType() {
                return req.getContentType();
            }
 
            public int getContentLength() {
                return req.getContentLength();
            }
 
            public InputStream getInputStream() throws IOException {
                ServletInputStream in = req.getInputStream();
                if(in == null) {
                    throw new IOException("Missing content in the request");
                } else {
                    return req.getInputStream();
                }
            }
        };
    }
 
    public void cleanUp() {
        Set names = this.files.keySet();
        Iterator i$ = names.iterator();
 
        while(i$.hasNext()) {
            String name = (String)i$.next();
            List items = (List)this.files.get(name);
            Iterator i$1 = items.iterator();
 
            while(i$1.hasNext()) {
                FileItem item = (FileItem)i$1.next();
                if(LOG.isDebugEnabled()) {
                    String msg = LocalizedTextUtil.findText(this.getClass(), "struts.messages.removing.file", Locale.ENGLISH, "no.message.found", new Object[]{name, item});
                    LOG.debug(msg, new String[0]);
                }
 
                if(!item.isInMemory()) {
                    item.delete();
                }
            }
        }
 
    }
}
