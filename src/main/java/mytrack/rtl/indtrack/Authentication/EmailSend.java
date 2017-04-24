package mytrack.rtl.indtrack.Authentication;



import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class EmailSend {
	
	 
 public void sendHtmlEmail(String to) throws AddressException,
	            MessagingException {
	 
	 System.out.println("in send mail");
	 
	 
	 Properties props = new Properties();
	 
	 
	
	 props.put("mail.smtp.auth", "true");
	 props.put("mail.smtp.socketFactory.port", "465");
	 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	 props.put("mail.smtp.port", "465");
	 
//	 props.put("mail.smtp.starttls.enable", "true");
//	 props.put("mail.smtp.auth", "true");
//	 props.put("mail.smtp.host", "smtp.gmail.com");
//	 props.put("mail.smtp.port", "587");
	 
//     props.put("mail.smtp.auth", "true");
//     props.put("mail.smtp.starttls.enable", "true");
//     props.put("mail.smtp.host", "smtp.gmail.com");
//     props.put("mail.smtp.port", "587");

     Session session = Session.getInstance(props,
 		  new Authenticator() {
 			protected PasswordAuthentication getPasswordAuthentication() {
 				return new PasswordAuthentication("tech@indtrack.com", "Tech@3469");
 			}
 		  });
     try {
       MimeMessage msg = new MimeMessage(session);
       msg.setFrom(new InternetAddress("tech@indtrack.com"));
       msg.setRecipients(Message.RecipientType.TO, to);
       msg.setSubject("Simple Test Mail");
       msg.setSentDate(new Date());
       msg.setText("Hello World!");
       Transport.send(msg);
	System.out.println("---Done---");
     } catch (MessagingException mex) {
   	mex.printStackTrace();
     }
//	 try
//	 {
//	// String host="mail.javatpoint.com";//change accordingly  
//    // String to="sonoojaiswal1987@gmail.com";//change accordingly  
//     final String user="tech@indtrack.com";//change accordingly  
//     final String password="Tech@3469";//change accordingly  
// 
//     Properties properties = System.getProperties();  
//     
//     properties.put("mail.smtp.auth", "true");
//     properties.put("mail.smtp.starttls.enable", "true");
//     properties.put("mail.smtp.host", "smtp.gmail.com");
//     properties.put("mail.smtp.port", 587);
////    
////     properties.setProperty("mail.smtp.host", "smtp.gmail.com");  
////     properties.put("mail.smtp.socketFactory.class",  
////             "javax.net.ssl.SSLSocketFactory");  
////     properties.put("mail.smtp.auth", "true");  
////     properties.put("mail.smtp.port", "587");
////     properties.put("mail.smtp.auth", "true");  
// 
//     Session session = Session.getDefaultInstance(properties,  
//    		 new javax.mail.Authenticator() {  
//    protected PasswordAuthentication getPasswordAuthentication() {  
//     return new PasswordAuthentication(user,password);  
//    }  
//     });  
//       
//     try{  
//        MimeMessage message = new MimeMessage(session);  
//        message.setFrom(new InternetAddress(user));  
//        message.addRecipient(Message.RecipientType.TO,  
//                                 new InternetAddress(to));  
// 
//       message.setSubject("HTML Message");  
//       message.setContent("<h1>sending html mail check</h1>","text/html" );  
//   
//      Transport.send(message);  
//        System.out.println("message sent....");  
//     }catch (MessagingException ex) {ex.printStackTrace();}  
//     
//     
//	 }
//	 catch(Exception ed)
//	 {
//		System.out.println("in exception"+ed); 
//	 }
//     

 }
	
	
	
}
