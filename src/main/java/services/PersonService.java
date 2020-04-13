package services;

import models.People;
import models.PeopleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonService {

    private PeopleRepository peopleRepository;

    public PersonService(){}

    @Autowired
    public PersonService(PeopleRepository peopleRepository) {
        this.peopleRepository = peopleRepository;
    }

    public List<People> findByLastName(String lastName) {
        return this.peopleRepository.findByLast_Name(lastName);
    }

    public People findByFirstName(String firstName) {
        return (People) this.peopleRepository.findByFirst_Name(firstName);
    }

    public List<People> findByHome_Id(String findByHome_Id) {
        return this.peopleRepository.findByHome_Id(findByHome_Id);
    }

    public List<People> findAll() {
        return this.peopleRepository.findAll();
    }

    public People save(People people) {
        return this.peopleRepository.save(people);
    }
}
