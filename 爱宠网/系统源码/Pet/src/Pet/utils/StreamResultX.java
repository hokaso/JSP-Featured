package Pet.utils;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.StreamResult;

import com.opensymphony.xwork2.ActionInvocation;

/**
 * <p>在此感谢Jimmy Song
 * <br/>该类扩展了struts2中的result-type为stream的实体类，并重写了doExecute方法。
 * <br/>该类修正了源于ResultStream的一些错误处理，在文档下载取消时释放HttpResponse对象的引用。
 * <br/>防止java.lang.IllegalStateException异常抛出。
 * <br/>使用原有ResultStream进行文件下载时，如若点击取消，Socket并不会断开，流也没有关闭。
 * <br/>在JSP容器通过Response获取输出流之前，前面的流并没有关闭，所以会造成该异常的报出。
 *
 * @author Jimmy Song
 * @version 1.2 
 * @see https://github.com/41zone/StreamResultX
 */
 
/**
 * <p>借用Jimmy Song的StreamResultX，实现下载完之后删除文件
 *
 * @author ManerFan <a href="mailto:juniorfan@yeah.net"></a>
 */
public class StreamResultX extends StreamResult {
 
    private static final long serialVersionUID = -8275283556955657976L;
 
    /**
     * 文件路径
     */
    private String filePath;
 
    /**
     * 扩展重写StreamResult方法
     */
    protected void doExecute(String finalLocation, ActionInvocation invocation) throws Exception {
        resolveParamsFromStack(invocation.getStack(), invocation);
 
        OutputStream oOutput = null;
 
        /** 下载完成后需要删除的文件 */
        File delFile = null;
 
        try {
            String path = (String) invocation.getStack().findValue(
                    conditionalParse(filePath, invocation));
            if (null != path && !path.trim().isEmpty()) {
                delFile = new File(path);
            }
 
            if (inputStream == null) {
                // Find the inputstream from the invocation variable stack
                inputStream = (InputStream) invocation.getStack().findValue(
                        conditionalParse(inputName, invocation));
            }
 
            if (inputStream == null) {
                String msg = ("StreamResultX : Can not find a java.io.InputStream with the name ["
                        + inputName + "] in the invocation stack. " + "Check the <param name=\"inputName\"> tag specified for this action.");
                LOG.error(msg);
                throw new IllegalArgumentException(msg);
            }
 
            // Find the Response in context
            HttpServletResponse oResponse = (HttpServletResponse) invocation.getInvocationContext()
                    .get(HTTP_RESPONSE);
 
            // Set the content type
            if (contentCharSet != null && !contentCharSet.equals("")) {
                oResponse.setContentType(conditionalParse(contentType, invocation) + ";charset="
                        + contentCharSet);
            } else {
                oResponse.setContentType(conditionalParse(contentType, invocation));
            }
 
            // Set the content length
            if (contentLength != null) {
                String _contentLength = conditionalParse(contentLength, invocation);
                int _contentLengthAsInt = -1;
                try {
                    _contentLengthAsInt = Integer.parseInt(_contentLength);
                    if (_contentLengthAsInt >= 0) {
                        oResponse.setContentLength(_contentLengthAsInt);
                    }
                } catch (NumberFormatException e) {
                    LOG.warn("StreamResultX warn : failed to recongnize " + _contentLength
                            + " as a number, contentLength header will not be set", e);
                }
            }
 
            // Set the content-disposition
            if (contentDisposition != null) {
                oResponse.addHeader("Content-Disposition",
                        conditionalParse(contentDisposition, invocation));
            }
 
            // Set the cache control headers if neccessary
            if (!allowCaching) {
                oResponse.addHeader("Pragma", "no-cache");
                oResponse.addHeader("Cache-Control", "no-cache");
            }
            // Get the outputstream
            oOutput = oResponse.getOutputStream();
 
            if (LOG.isDebugEnabled()) {
                LOG.debug("StreamResultX : Streaming result [" + inputName + "] type=["
                        + contentType + "] length=[" + contentLength + "] content-disposition=["
                        + contentDisposition + "] charset=[" + contentCharSet + "]");
            }
 
            // Copy input to output
 
            byte[] oBuff = new byte[bufferSize];
            int iSize;
            try {
                LOG.debug("StreamResultX : Streaming to output buffer +++ START +++");
                while (-1 != (iSize = inputStream.read(oBuff))) {
                    oOutput.write(oBuff, 0, iSize);
                }
                LOG.debug("StreamResultX : Streaming to output buffer +++ END +++");
                // Flush
                oOutput.flush();
            } catch (Exception e) {
                LOG.warn("StreamResultX Warn : socket write error");
                if (oOutput != null) {
                    try {
                        oOutput.close();
                    } catch (Exception e1) {
                        oOutput = null;
                    }
                }
            } finally {
                if (inputStream != null)
                    inputStream.close();
                if (oOutput != null)
                    oOutput.close();
 
                if (null != delFile // 可以删除
                        && delFile.exists() // 文件存在
                        && delFile.isFile()) { // 是常规文件
                    boolean delSucc = delFile.delete();
                    LOG.debug("delete file [" + filePath + " ], status [" + delSucc + "]");
                }
            }
        } finally {
            if (inputStream != null)
                inputStream.close();
            if (oOutput != null)
                oOutput.close();
 
            if (null != delFile // 可以删除
                    && delFile.exists() // 文件存在
                    && delFile.isFile()) { // 是常规文件
                boolean delSucc = delFile.delete();
                LOG.debug("delete file [" + filePath + " ], status [" + delSucc + "]");
            }
        }
    }
 
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
