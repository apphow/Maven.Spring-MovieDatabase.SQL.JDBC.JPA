package services;

import models.Person;
import models.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PersonService {

    private PersonRepository personRepository;

    public PersonService(){}

    @Autowired
    public PersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public List<Person> findByLastName(String lastName) {
        return this.personRepository.findByLast_Name(lastName);
    }

    public Person findByFirstName(String firstName) {
        return (Person) this.personRepository.findByFirst_Name(firstName);
    }

    public Optional<Person> findByHome_Id(int id) {
        return this.personRepository.findByHome_Id(id);
    }

    public Optional<Person> delete(int id) {
        Optional<Person> person = findByHome_Id(id);
        personRepository.delete(person);
        return person;
    }

    public List<Person> findAll() {
        return this.personRepository.findAll();
    }

    public Person save(Person person) {
        return this.personRepository.save(person);
    }

    public Object findAllByMobileNumber(String mobileNumber) {
        return this.personRepository.findByMobileNumber();
    }
}
