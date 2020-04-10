package models;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PeopleRepository extends JpaRepository<People, Long> {

        List<People> findAll();

        List<People> findByMake(String make);

        Optional<People> findByColor(String color);
}
