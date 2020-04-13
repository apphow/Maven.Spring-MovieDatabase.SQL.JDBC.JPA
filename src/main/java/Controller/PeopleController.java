package Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PeopleController<PeopleService> {

    private PeopleService peopleService;

    @Autowired
    public void PeopleService(){}


    @GetMapping("/all")
    public @ResponseBody String findAll() {
        return "This works";

    }

}




