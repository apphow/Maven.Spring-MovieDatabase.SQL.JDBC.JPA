package Controller;

import models.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import services.PersonService;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Optional;

//https://github.com/apphow/Demo-Simple-Spring-Web-MVC/tree/master/src/main/java/com/zipcode/demo/WebMVC
@RestController
public class PersonController {

    private PersonService personService;

    @Autowired
    public void PersonController(PersonService personService) {
        this.personService = personService;
    }

    @GetMapping("/all")
    public ResponseEntity<Iterable<Person>> getallPersons(@PathVariable int id) {
        return new ResponseEntity<>(personService.findAll(), HttpStatus.OK);
    }

    @PostMapping("/person")
    public ResponseEntity<Person> createPerson(@RequestBody Person person) {
        Person newPerson = personService.save(person);
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
        Optional<Person> existingPerson = personService.findByHome_Id(id);

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
        Optional<Person> existingPerson = personService.findByHome_Id(id);
        return existingPerson.map(p -> {
            personService.delete(p.getHome_ID());
            return ResponseEntity.ok().build();
        }).orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Person> deletePerson(@PathVariable int id) {
        personService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);

    }


}









