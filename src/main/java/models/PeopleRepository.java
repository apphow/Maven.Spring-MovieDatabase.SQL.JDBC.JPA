package models;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PeopleRepository extends JpaRepository<People, Long> {

        List<People> findAll();

        List<People> findByLast_Name(String lastName);

        List<People> findByHome_Id(String findByHome_id);

        Object findByFirst_Name(String firstName);
}
 