package com.coursework.repository;

import com.coursework.model.Way;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WayRepository extends JpaRepository<Way, Long> {
}
