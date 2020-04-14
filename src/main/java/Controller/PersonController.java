package Controller;

import models.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import services.JdbcPersonServiceImpl;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;

//https://github.com/froilan-miranda/Demo-Simple-Spring-Web-MVC@RestController
public class PersonController {

    private JdbcPersonServiceImpl jdbcPersonServiceImpl;

    @Autowired
    public void PersonController(JdbcPersonServiceImpl jdbcPersonServiceImpl) {
        this.jdbcPersonServiceImpl = jdbcPersonServiceImpl;
    }

    @GetMapping("/all")
    public List<Person> findAll() { return jdbcPersonServiceImpl.findAll();}

    @GetMapping("/lastName")
    public ResponseEntity<?> findByLastName(@RequestParam String Last_Name){
        return new ResponseEntity<>(jdbcPersonServiceImpl.findByLastName(Last_Name), HttpStatus.OK);   }

    @GetMapping("/firstName")
    public ResponseEntity findByFirstName(@RequestParam String First_Name){
        return new ResponseEntity<>(jdbcPersonServiceImpl.findByFirstName(First_Name), HttpStatus.OK);
    }

    @GetMapping("/reverseLookup")
    public ResponseEntity<?> reverseLookup(String mobileNumber) {
        return new ResponseEntity<>(jdbcPersonServiceImpl.findAllByMobileNumber(mobileNumber), HttpStatus.OK);
    }

    @PostMapping("/person")
    public ResponseEntity<Person> createPerson(@RequestBody Person person) {
        Person newPerson = jdbcPersonServiceImpl.save(person);
        try {
            return ResponseEntity.created(new URI("/person/" + newPerson.getHome_ID()))
                    .body(newPerson);
        } catch (URISyntaxException e) {
            return ResponseEntity.status(HttpStatus.MULTI_STATUS.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping(value = "/person/{id}")
    public ResponseEntity<?> updatePerson(@RequestBody Person person,
                                          @PathVariable int id) {
        Optional<Person> existingPerson = jdbcPersonServiceImpl.findByHome_Id(id);

        return existingPerson
                .map(p -> {
                    p.setLast_Name(person.getLast_Name());

                    try {
                        return ResponseEntity
                                .ok()
                                .location(new URI("/car/" + p.getLast_Name()))
                                .body(p);
                    } catch (URISyntaxException e) {
                        return ResponseEntity.status(HttpStatus.MULTI_STATUS.INTERNAL_SERVER_ERROR).build();
                    }
                }).orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/person/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        Optional<Person> existingPerson = jdbcPersonServiceImpl.findByHome_Id(id);
        return existingPerson.map(p -> {
            jdbcPersonServiceImpl.delete(p.getHome_ID());
            return ResponseEntity.ok().build();
        }).orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Person> deletePerson(@PathVariable int id) {
        jdbcPersonServiceImpl.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}










