package api;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import java.util.Properties;

public class GoogleAuthenticator extends Authenticator {
    
    private PasswordAuthentication passwordAuthentication;
    
    public GoogleAuthenticator() {
        // 이메일 계정과 앱 비밀번호로 설정
        passwordAuthentication = new PasswordAuthentication("jiyeonkim0528@gmail.com", "nthh qgzi ztfp tcyq");
    }
    
    @Override
    public PasswordAuthentication getPasswordAuthentication() {
        return passwordAuthentication;
    }
    
    public Properties getProp() {
        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "587");
        p.put("mail.smtp.starttls.enable", "true");
        return p;
    }
}