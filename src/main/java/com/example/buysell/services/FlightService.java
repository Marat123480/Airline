package com.example.buysell.services;

import com.example.buysell.repositories.FlightRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class FlightService {
    private final FlightRepository flightRepository;
    public void deleteFlight(Long id){
        flightRepository.deleteById(id);
    }
}
