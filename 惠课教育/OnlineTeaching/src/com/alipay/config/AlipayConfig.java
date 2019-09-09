package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092400586640";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQC+k3YEW0eg8wfETeTZ12ctH4m7l40EUmmm9ooOH+ylGIoXipXSoqxxI9xJN9XASDNbUALf8kQKNkbrzNHanpzBJa3H3iF3uEdGH0IkVxbWWF7fR4P0Z1ABn3GjOKkNfN7WvPPTuFqYl6DVejx5P3CTsMTIVi+xOeAWJ+4OJE89WfRrxV0EAEVkBx3vKNJA75Tx8VBIH1IhcXUY50+WMUWp7lg1h2nv9HaPmn75vtbAN2rjLcuwC92Ce1XBgocjOzgqoVhOdQV5mS8PXUCO/t5GYT2ySaRsUzNXflgOog0KXGIWj0hXy60XNGx223Anj0asFYQ9PuWmEneRTHTr7VN9AgMBAAECggEAaYi3Xgo+TD7JGkgYZxoFpNNGLn/qM25/21nDcbb0ESjZr9eqyA4VeEHnhxRIZkaVSgewz9sVGqKb+5Bc1bfoDn2TEo9L8UQ3E/nTYtRnbSNaxkKQLBPaFkv5Xe3OkA2KSVgxnhkE8mNlSVJ7kpky+lZ1Yot3tajbEunhxisNRmdH5BJqDOOSJck9+rnPPFuP7AXPYeAFy1zV15rwUFbJRcpcSPItoq+NFWoPrtyZuVbkOlL/3rFXx0hV0KB4EaiqNaIhn4KFSim1tNGE0x2ruarzw+2Pb20Yj6AhPJ0HhQgxGcG1hrM1AvaJdU3I4RzUoB+ZZ16gsN9EiL4cGhih8QKBgQD3VO9cef9qS+yDbPFnN5pu/nyaOeH/iLZ+6lZy2fpWtZKVX4yOgxCrI3ZRNzi8eGI2qR/TtfASrfQgTcXqgH3m7XXwYDU/HXwycFX8L3BN25lCZecNiVB1gtuWSHDFRZ3JLNAA3YRhHIlSgZgGK4jK+ATEuqosY3ICSzEG5NXkbwKBgQDFQU/2jkChPh1XlN5T4mdRLiHRZhQvyGygbn8zKiYbBfB4hVnBkuNJ0kmrZbiFEBpK/PkohimED6OV/8EtiTMBZp2n9+0Rvz3b35AZ4El46w79epfHv8s91vHPmDactgvWJ8X/5E64Mue71P1zwT19yNvVRYWvMNnsXywSLzy00wKBgQCpj/8xxSnINBkH2S5+9u3XXn0KNtirmYyT4hA2WR55R64g3gq8wToyOfOpplQtUdLzams5d6gJBl0xsGAZbtHh+bY7f5nBlXNKGR258MPrfLvLe5U2AIe6qGXm1+8IL7wG6cQIc9WHxkqW1+XjhQEZNYP/Y4G7QMourGIGOegx3QKBgFTYE+nsI/Z2/i32tW6FWoU7f4ZPDu3Cmp6jCIlcXsmO03EzgnjVknflQJS9ixGI7JZGm3EHzAGmrGlPear5cXvvxG5EIK9af+P8FEJdC508FdWHjpN3dpchxh7RzOO5FfxGXU8Ex6tJEg3jviS1AJsC8zOX1LmXHJUkFpO3x7fLAn9bH72XL9ZM9J2t05/bbiVWG8j+e7aNjAGVONm4zgt2/sSPzCI4DFKPNf6qnDPcdgflcM0l6h7tGq9CcUOc/QT9RTRpamnCktibfGL0A/TWB/ozfnfZMKjr2dNwjnVLRwcqjhNafyk/N8FvjiicusfrH0TsZL8ISPC4BfwIa8uC";
    
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvpN2BFtHoPMHxE3k2ddnLR+Ju5eNBFJppvaKDh/spRiKF4qV0qKscSPcSTfVwEgzW1AC3/JECjZG68zR2p6cwSWtx94hd7hHRh9CJFcW1lhe30eD9GdQAZ9xozipDXze1rzz07hamJeg1Xo8eT9wk7DEyFYvsTngFifuDiRPPVn0a8VdBABFZAcd7yjSQO+U8fFQSB9SIXF1GOdPljFFqe5YNYdp7/R2j5p++b7WwDdq4y3LsAvdgntVwYKHIzs4KqFYTnUFeZkvD11Ajv7eRmE9skmkbFMzV35YDqINClxiFo9IV8utFzRsdttwJ49GrBWEPT7lphJ3kUx06+1TfQIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/OnlineTeaching/teach_buy_success";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/OnlineTeaching/teach_buy_success";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

