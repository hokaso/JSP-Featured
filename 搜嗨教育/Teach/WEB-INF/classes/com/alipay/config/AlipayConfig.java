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
	public static String app_id = "2016092800617103";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDC6Q0sJrmjiu9vXisTyGastCkmdHPPwX2N7QOl4VQqhd7UtldaHDX6bilEyFzoO5AIskMbearY5xSSX+coiXvxGoMuS/4C45vCYELNRNSXkUYUlu9WVXhXZ0aKQ/7i2Peb/R2s4KJ09OEa4/9pyXtmkBZtgHEyQ9qfX8NK48+JYIln7diw1kPkGsg7w/oxqllZz/siqmGGItrYpU+W832Gt2afuQ+71ZgWy2M4GbUwY6egYIK/TmCcDFBvcyjnJRJa+/PGOqpXlwkM9WOBooKW0t6RHTqrxn987rgcV6zjtxPUKyk7WOILsPU+t1CWDHHdBSDlfZTi1z0HEwtK5M37AgMBAAECggEBAIreCnGLgbYAlgkN2bk1jdm8Xpk0XRMHc5H77R5xhUrqqFF7PI9KDDdJ54NHEdKwJTXc9C0OKWhyc1i6lXJvSewFDLOelvKuAdqiRNYFFUaLzZd71jf3m08CmOKIAYDUPs5Xr53tSjH0CrHjAaX4VEBFpoUL/xpl98yXKQgheUsRSuabltySpDZCuiUOoy9dRuKXggJtYIYpvNV+KASc74cDaRU8CgQ4VSWljdJV6dbVgZMEP25c0aJJBGOedjAHo4IG9jt2Qj4aEfoCjx3jLH5kLzJ5Nlr1ruuMSy9p6q+xcEIXdwnw+ve4SRzAQK3XsR363t0fwWAh2sdyqupqLhkCgYEA7EyYCPREwMQvOjcf5PWswqNh2/AgTKdtGBZoQQ4/ptMA4ELvByrb4x5Cwu6DkT2PQHHwnmFvD8GCUFzzufWP4PoXFmTmC9gqaOafd4YHkxV2MxbrtrEUYh3xzBq4butVg7S/EoIN6F57ENUpoSOHMJNdPFVM5OmhZ8nUxQp72yUCgYEA0ykVOqb8bhJsGRo4w8o9eIl4dAv7xPgBYIlNMd7pVlqovEwEZmqYXGkBfOigtyce/IOfHIWWSY+rmX0rINBLE2xcbw58Rsu4AA6JwmDVsNMs6FHgoaJCyQk+fXIGstWdeMqRuIOCHVC2OvdcBBOZDvhTowNYACKvX0dsCpVzSp8CgYEA376aywe4PirFaUMfESZLAjXACIhznQF/fCpjZw492RG8p5zZRhkgAgr6PieoLpNynBwHMYCir/GUGdIZ+b/6D5Xe3JaHeTmi1pdg8cTYUT4mILQYV3GPEmS2OoQmlOiCnWY88iJxVtB3iPW+KFVCwg0XYHSIjcxmx6bFsBmAM30CgYBIRQFNB6XRjmCM3tqat/b98B7XqNpMeY0PGy7eaKp3saOafnHrE4R97DpkI8INrUf/qJSmUFo1ZwSWDa7bFi77wNSJ9e021bZt3ovriPTaBgySnqNA7qXo5E8M5B/CyTWSB9KD0g6QNfWIjOxjQMnbw8XsPtK5iSV4eJtTq/6/hQKBgQCcbvsJi9wT+BPEDd6mjBhKmeHbmHr0TnabbgYbjE36t+/DRhR2aZn8YcR83RW//tX2dU7qD0/uj9MpTJRGr1q/WdM0l3vtHojDv4+M3+FveXDVu4uLnZOcN5clc3f8Xr6Rsh+0yIR6cQOAn1KNgVO+9DoeJr+B2lJwuirOVLGU9w==";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwukNLCa5o4rvb14rE8hmrLQpJnRzz8F9je0DpeFUKoXe1LZXWhw1+m4pRMhc6DuQCLJDG3mq2OcUkl/nKIl78RqDLkv+AuObwmBCzUTUl5FGFJbvVlV4V2dGikP+4tj3m/0drOCidPThGuP/acl7ZpAWbYBxMkPan1/DSuPPiWCJZ+3YsNZD5BrIO8P6MapZWc/7IqphhiLa2KVPlvN9hrdmn7kPu9WYFstjOBm1MGOnoGCCv05gnAxQb3Mo5yUSWvvzxjqqV5cJDPVjgaKCltLekR06q8Z/fO64HFes47cT1CspO1jiC7D1PrdQlgxx3QUg5X2U4tc9BxMLSuTN+wIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/Teach/check/paycoin";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/Teach/check/paycoin";

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

