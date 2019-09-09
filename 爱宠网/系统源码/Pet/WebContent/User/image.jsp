<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,java.awt.*,java.awt.image.*,javax.imageio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%!
		//获取随机颜色
		public Color getColor(){
			Random random = new Random();
			//使用rgb()随机产生颜色
			int r = random.nextInt(256);
			int g = random.nextInt(256);
			int b = random.nextInt(256);
			
			return new Color(r,g,b);
		}
		
		//获取随机数字  产生一个4位数
		public String getNum(){
			String str = "";
			Random random = new Random();
			for(int i = 0;i < 4;i++){
				str += random.nextInt(10); //0-9
			}
			return str;
		}
%>
 
<%
	 	/* 清除缓存 */
	 	response.setHeader("pragma", "mo-cache");
		response.setHeader("cache-control", "no-cache");
		response.setDateHeader("expires", 0);
		//产生矩形框
		BufferedImage image = new BufferedImage(80,30,BufferedImage.TYPE_INT_RGB);
		//获取画笔工具
		Graphics g = image.getGraphics();
		//设置矩形框的颜色
		g.setColor(new Color(200,200,200));
		//设置坐标和宽高
		g.fillRect(0, 0, 80, 30);
			 	
		//随机产生干扰线
		for(int i = 0;i < 30;i++){
			Random random = new Random();
			int x = random.nextInt(80);
			int y = random.nextInt(30);
			int x1 = random.nextInt(x + 10);
			int y1 = random.nextInt(y + 10);
			//设置随机颜色
			g.setColor(getColor());
			//画出来
			g.drawLine(x, y, x1, y1);
		}
		
		//字的颜色和数字
		g.setFont(new Font("Microsoft YaHei",Font.BOLD,16));
		g.setColor(Color.BLACK);
		//获取随机数字
		String checkNum = getNum();
		
		//给字拼接空格
		StringBuffer sb = new StringBuffer();
		for(int i = 0;i < checkNum.length();i++){
			sb.append(checkNum.charAt(i) + " ");
		}
		//画出数字
		g.drawString(sb.toString(), 15, 20);
		//存入session域中
		session.setAttribute("CHECKNUM", checkNum); //例如1010
		//将图像以jpeg的形式通过字节流输出
		ImageIO.write(image, "jpeg", response.getOutputStream());
		//清除缓存
		out.clear();
		//放入body中
		out = pageContext.pushBody();
%>
</body>
</html>