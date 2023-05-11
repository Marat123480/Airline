package com.example.buysell.services;

import com.example.buysell.models.Airline;


import com.example.buysell.models.Flight;
import com.example.buysell.models.Image;
import com.example.buysell.models.User;
import com.example.buysell.models.enums.Role;
import com.example.buysell.repositories.AirlineRepository;
import com.example.buysell.repositories.FlightRepository;
import com.example.buysell.repositories.ImageRepository;
import com.example.buysell.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class AirlineService {
    private final AirlineRepository airlineRepository;
    private final UserRepository userRepository;
    private final FlightRepository flightRepository;
    private final ImageRepository imageRepository;


    public List<Airline> listAirlines(String name) {
        if (name != null) return airlineRepository.findAirlineByName(name);
        return airlineRepository.findAll();
    }

    public void saveAirline(Principal principal, Airline airline, MultipartFile file1, MultipartFile file2) throws IOException {
        airline.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            airline.addImageToProduct(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            airline.addImageToProduct(image2);
        }
        log.info("Saving new Airline. Name: {}", airline.getName());
        Airline airlineFromDb = airlineRepository.save(airline);
        airlineFromDb.setPreviewImageId(airlineFromDb.getImages().get(0).getId());
        airlineRepository.save(airline);
    }

    public void changeAirline(Principal principal, Airline airline, MultipartFile file1, MultipartFile file2) throws IOException {
        airline.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        airline.getImages().clear();

        image1 = toImageEntity(file1);
        airline.deleteImagesToProduct(image1);
        image1.setPreviewImage(true);
        airline.addImageToProduct(image1);

        image2 = toImageEntity(file2);
        airline.deleteImagesToProduct(image2);
        airline.addImageToProduct(image2);

        log.info("Saving new Airline. Name: {}", airline.getName());
        Airline airlineFromDb = airlineRepository.save(airline);
        airlineFromDb.setPreviewImageId(airlineFromDb.getImages().get(0).getId());
        airlineRepository.save(airline);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public List<Flight> getAllFlights() {
        return flightRepository.findAll();
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteAirline(Long id) {
        airlineRepository.deleteById(id);
    }

    public Airline getAirlineById(Long id) {
        return airlineRepository.findById(id).orElse(null);
    }

    public void saveFlight(Airline airline, Flight flight) {
        airline.addFlightToAirline(flight);
        airlineRepository.save(airline);
    }
    public void changeFlightAirline(Flight flight, Map<String, String> form) {
        flight.getAirline().deleteFlightFromAirline(flight);
        List<Airline> air = listAirlines(null);
        for (String name : form.keySet()){
            for (Airline airline : air){
                if (Objects.equals(airline.getName(), name)){
                    flight.setAirline(airline);
                    airline.getFlights().add(flight);
                }
            }
        }
        airlineRepository.save(flight.getAirline());
    }
}
