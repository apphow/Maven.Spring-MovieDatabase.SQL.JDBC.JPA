package models;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PersonRepository extends JpaRepository<Person, Long> {

        List<Person> findAll();

        List<Person> findByLast_Name(String lastName);

        Optional<Person> findByHome_Id(int findByHome_id);

        Object findByFirst_Name(String firstName);

        void delete(Optional<Person> person);
}
 