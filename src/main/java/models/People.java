package models;

import org.h2.server.web.WebServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;

import javax.persistence.*;
import java.util.Optional;

@Entity
public class People {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Home_ID;

    private String Last_Name;
    private String First_Name;
    private String Mobile;
    private String Birthday;

    public People() {
    }

    public People(String last_Name, String first_Name, String mobile, String birthday, int home_ID) {
        Last_Name = last_Name;
        First_Name = first_Name;
        Mobile = mobile;
        Birthday = birthday;
        Home_ID = home_ID;
    }

    public String getLast_Name() {
        return Last_Name;
    }

    public void setLast_Name(String last_Name) {
        Last_Name = last_Name;
    }

    public String getFirst_Name() {
        return First_Name;
    }

    public void setFirst_Name(String first_Name) {
        First_Name = first_Name;
    }

    public String getMobile() {
        return Mobile;
    }

    public void setMobile(String mobile) {
        Mobile = mobile;
    }

    public String getBirthday() {
        return Birthday;
    }

    public void setBirthday(String birthday) {
        Birthday = birthday;
    }

    public int getHome_ID() {
        return Home_ID;
    }

    public void setHome_ID(int home_ID) {
        Home_ID = home_ID;
    }

    public Optional<ResponseEntity<Object>> map(Object o) {
        return null;
    }

    @SpringBootApplication
    public static class PersistenceStarterApplication {

        public static void main(String[] args) {
            SpringApplication.run(PersistenceStarterApplication.class, args);
        }

        @Bean
        ServletRegistrationBean h2servletRegistration(){
            ServletRegistrationBean registrationBean = new ServletRegistrationBean( new WebServlet());
            registrationBean.addUrlMappings("/console/*");
            return registrationBean;
        }
    }
}

