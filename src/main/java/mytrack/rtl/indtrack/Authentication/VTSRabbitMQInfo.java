package mytrack.rtl.indtrack.Authentication;



public class VTSRabbitMQInfo {
	
	private final String brokerServer;
	private final int brokerPort;
	private final String userName;
	private final String password;
	private final String virtualHost;
	
	public VTSRabbitMQInfo(String brokerServer, int port, String userName, String password, String virtualHost) {
		this.brokerPort = port;
		this.brokerServer = brokerServer;
		this.userName = userName;
		this.password = password;
		this.virtualHost = virtualHost;
	}

	public String getBrokerServer() {
		return brokerServer;
	}

	public int getBrokerPort() {
		return brokerPort;
	}

	public String getUserName() {
		return userName;
	}

	public String getPassword() {
		return password;
	}

	public String getVirtualHost() {
		return virtualHost;
	}
}
