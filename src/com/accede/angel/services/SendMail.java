package com.accede.angel.services;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail {
    
    public static boolean mailsend(String email,String msg, String subject)
    {
                // Recipient's email ID needs to be mentioned.
                String to = email;
                // Sender's email ID needs to be mentioned
                String from = "admin@angelm.in";
                final String username = "admin@angelm.in";//change accordingly
                final String password = "Virajdalvi@123";//change 
               // Assuming you are sending email from localhost
               String host =  "angelm.in";
               // Get system properties
               Properties properties = new Properties();
               properties.put("mail.smtp.auth", "true");
               properties.put("mail.smtp.starttls.enable", "false");
               properties.put("mail.smtp.host", host);
               properties.put("mail.smtp.port", "25");  
               // Setup mail server
               properties.setProperty("mail.smtp.host", host);
              // Get the default Session object.
               Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
                    }
                });
            try{
                // Create a default MimeMessage object.
                MimeMessage message = new MimeMessage(session);
                // Set From: header field of the header.
                message.setFrom(new InternetAddress(from));
                // Set To: header field of the header.
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                // Set Subject: header field
                message.setSubject(subject);
                // Send the actual HTML message, as big as you like
                message.setText(msg);
                // Send message
                Transport.send(message);
                System.out.println("Sent message successfully....");
                }
                catch (MessagingException mex) 
                {
                    mex.printStackTrace();
                }
                
                //response.sendRedirect("admin_home_page.jsp");
                return true;
    }
    public static void main(String[] args) {
        mailsend("dineshsatelkar28@gmail.com","dsfjhf",  "gdsfjgb");
    }
}

    


