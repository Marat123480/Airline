package com.example.buysell.repositories;

import com.example.buysell.models.Airline;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AirlineRepository extends JpaRepository<Airline, Long> {
    List<Airline> findAirlineByName(String name);
}
