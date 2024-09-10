package com.email;

import java.security.SecureRandom;
import java.util.List;
import java.util.Properties;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SendEmails {

	private static final String CHARACTERS = "0123456789";
    private static final int OTP_LENGTH = 6;

   
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String USERNAME = "bcswala420@gmail.com";  
    private static final String PASSWORD = "xwoa gvwx widz nqhc";  

    
    public  static boolean sendEmail(final String receiverMail) {
        return sendEmail(receiverMail, "Default Subject", "Default Message Body");
    }

    
    public static boolean sendEmail(List<String> emails, String title, String description) {
        boolean isSuccess = true;
        for (String email : emails) {
            if (!sendEmail(email, title, description)) {
                isSuccess = false;
            }
        }
        return isSuccess;
    }

   
    public static boolean sendEmail(final String receiverMail, String subject, String body) {
      
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);


        Session session = Session.getInstance(props,
            new jakarta.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });

        try {
           
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiverMail));
            message.setSubject(subject);
            message.setText(body);

           
            Transport.send(message);
            
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
    
   public  static String getOtp() {
	   SecureRandom random = new SecureRandom();
       StringBuilder otp = new StringBuilder(OTP_LENGTH);

       for (int i = 0; i < OTP_LENGTH; i++) {
           otp.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
       }

       return otp.toString();
   }
    
   
    
}
