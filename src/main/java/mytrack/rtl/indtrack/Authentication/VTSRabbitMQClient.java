package mytrack.rtl.indtrack.Authentication;


import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rabbitmq.client.AMQP;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.Consumer;
import com.rabbitmq.client.DefaultConsumer;
import com.rabbitmq.client.Envelope;
import com.rabbitmq.client.MessageProperties;




/**
 * Create the object of this class 
 ** We will bring the message configuration into this constructure later
 *  VTSRabbitMQClient vtsRabbitMQClient = new VTSRabbitMQClient();
 *  while (1) {
 *  	vtsRabbitMQClient.publishMessage(publishMessageJsonString)
 *  }
 *  done...No closing of the client until the client is dead 
 * @author tchahand
 *
 */

public class VTSRabbitMQClient {

	public final static Logger logger = LoggerFactory.getLogger(VTSRabbitMQClient.class);
	private Channel clientChannel;
	private Connection clientConnection;
	private final String defaultExchangeName = "defaultExchangeName";
	private final String defaultRoutingKey = "deviceIncomingData";
	private String queueName;
	
	/* 
	 * serverHost - provide the server host nmae/ip so that client can connect to it
	 * queueName - provide the queue name where we are going to publish the message or read the message from 
	 */
	public VTSRabbitMQClient() {
		queueName = null;
	}
	
	public boolean initializeClient(VTSRabbitMQInfo rabbitMQInfo) {
		return initializeClient(rabbitMQInfo.getBrokerServer(), rabbitMQInfo.getBrokerPort(), 
				rabbitMQInfo.getUserName(), rabbitMQInfo.getPassword(), rabbitMQInfo.getVirtualHost());
	}
	
	public Channel getClientChannel() {
		return clientChannel;
	}
	
	public boolean initializeClient(String brokerHost, int brokerPort, 
			String userName, String password, String virtualHost) {
		
		  ConnectionFactory factory = new ConnectionFactory();
		  factory.setRequestedHeartbeat(5);
		  
		  factory.setHost(brokerHost);
		  factory.setPort(brokerPort);
		  factory.setUsername(userName);
		  factory.setPassword(password);
		  factory.setVirtualHost(virtualHost);
		  
		  factory.setAutomaticRecoveryEnabled(true);
		  factory.setNetworkRecoveryInterval(10000);
		  
		  try {
		   clientConnection = factory.newConnection(); // Each client will have connection to server 
		   clientChannel = clientConnection.createChannel();
		   System.out.println("connection established");
		  } catch (Exception ex) {
		   logger.error("Couldn't established the RabbitMQClient connection !!! ex={} ", ex.getMessage(), ex);
		   return false;
		  }
	
		return true;
	}
	
	public int publishMessage(String jsonMessage,String queuename) {
		try {
			clientChannel.basicPublish(""/* No Exchange*/, queuename,  
					MessageProperties.PERSISTENT_TEXT_PLAIN, jsonMessage.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int startConsumer(Consumer consumer) {
		if (queueName == null) {
			logger.error("Please initiate the client initialization with queueName before consuming Messages");
			return -1;
		}
		
		try {
			clientChannel.basicConsume(queueName, false, consumer);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
