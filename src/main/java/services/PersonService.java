package services;

import models.People;
import models.PeopleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
class PeopleService {

    private PeopleRepository peopleRepository;

    @Autowired
    public PeopleService(PeopleRepository peopleRepository) {
        this.peopleRepository = peopleRepository;
    }

    public Optional<People> findByColor(String color) {
        return this.peopleRepository.findByColor(color);
    }

    public People findByMake(String make) {
        return (People) this.peopleRepository.findByMake(make);
    }

    public List<People> findByHMake(String make) {
        return this.peopleRepository.findByMake(make);
    }

    public List<People> findAll() {
        return this.peopleRepository.findAll();
    }

    public People save(People people) {
        return this.peopleRepository.save(people);
    }
}
