package WebSocket;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;
//该类可以使在websocket中获取HttpSession
public class GetHttpSessionConfigurator extends Configurator {
@Override
public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
	
	 HttpSession httpSession=(HttpSession) request.getHttpSession();
     sec.getUserProperties().put(HttpSession.class.getName(),httpSession);
}
}
