package Pet.dao.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import Pet.dao.Mail;
@Repository
@SuppressWarnings("all")
public class MailDao extends HibernateDaoSupport implements Mail{
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void handelMail(String mail,String url) {
		InputStream is = this.getClass().getResourceAsStream("/mailInfo.properties");
    	Properties prop = new Properties();
    	try {
			prop.load(is);//加载资源文件
		} catch (IOException e1) {
			e1.printStackTrace();
		}
    	
        String msgText = "请点击下面的连接激活用户，如果不能点击请手动复制到地址栏中执行\n" + "http://localhost:8080/WEB7/Active_process.action"+url;
        String smtpHost = prop.get("smtpHost").toString();//SMTP服务器名
        String from = prop.get("mailName").toString();//发信人地址
        String pwd = prop.get("pwd").toString();//密码
        String to = mail;//收信人地址
        // 创建properties对象
        Properties props = new Properties();
        //创建邮件服务器
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.auth","true");
        //取得默认的Session
        Session session = Session.getDefaultInstance(props, null);

        // 创建一条信息，并定义发信人地址和收信人地址
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));

            InternetAddress[] address = {new InternetAddress(to)};

            message.setRecipients(Message.RecipientType.TO, address);

            message.setSubject("激活注册用户");//设定主题

            message.setSentDate(new Date());//设定发送时间

            message.setText(msgText);//把前面定义的msgText中的文字设定为邮件正文的内容

            message.saveChanges(); // implicit with send()
            //协意
            Transport transport = session.getTransport("smtp");
            //发信人地址，用户名，密码
            transport.connect(smtpHost, from, pwd);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }}
	}

