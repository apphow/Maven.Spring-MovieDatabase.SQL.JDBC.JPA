package models;

import org.springframework.http.ResponseEntity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Optional;

@Entity
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Home_ID;

    private String Last_Name;
    private String First_Name;
    private String Mobile;
    private String Birthday;

    public Person() {
    }

    public Person(String last_Name, String first_Name, String mobile, String birthday, int home_ID) {
        this.Last_Name = last_Name;
        this.First_Name = first_Name;
        this.Mobile = mobile;
        this.Birthday = birthday;
        this.Home_ID = home_ID;
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

    }


