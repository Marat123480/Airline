package com.example.buysell.controllers;

import com.example.buysell.models.Airline;

import com.example.buysell.models.Flight;
import com.example.buysell.models.Image;
import com.example.buysell.models.User;
import com.example.buysell.models.enums.Role;
import com.example.buysell.repositories.FlightRepository;
import com.example.buysell.repositories.ImageRepository;
import com.example.buysell.services.AirlineService;
import com.example.buysell.services.FlightService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@ComponentScan(basePackages = {"controllers"})
public class AirlineController {
    private final AirlineService airlineService;
    private final FlightService flightService;

    @GetMapping("/")
    public String products(@RequestParam(name = "name", required = false) String title, Model model, Principal principal) {
        model.addAttribute("airlines", airlineService.listAirlines(title));
        model.addAttribute("user", airlineService.getUserByPrincipal(principal));
        model.addAttribute("flights", airlineService.getAllFlights());
        return "index";
    }

    @GetMapping("/airline/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal) {
        Airline airline = airlineService.getAirlineById(id);
        model.addAttribute("airline", airline);
        model.addAttribute("images", airline.getImages());
        model.addAttribute("user", airlineService.getUserByPrincipal(principal));
        model.addAttribute("flights", airline.getFlights());
        return "airline-info";
    }

    @GetMapping("/airline/form")
    public String productInfo() {
        return "create-airline";
    }

    @PostMapping("/airline/create")
    public String createAirline(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                Airline airline, Principal principal) throws IOException {
        airlineService.saveAirline(principal, airline, file1, file2);
        return "redirect:/admin";
    }

    @PostMapping("/admin/airline/delete/{id}")
    public String deleteAirline(@PathVariable Long id) {
        airlineService.deleteAirline(id);
        return "redirect:/admin";
    }

    @PostMapping("/airline/{id}/add_flight")
    public String createFlight(@PathVariable Long id, @RequestParam("country_from") String country_from,
                               @RequestParam("country_to") String country_to, @RequestParam("cost") Integer cost) throws IOException {
        Airline airline = airlineService.getAirlineById(id);
        Flight flight = new Flight();
        flight.setCountry_to(country_to);
        flight.setCountry_from(country_from);
        flight.setCost(cost);
        airlineService.saveFlight(airline, flight);
        return "redirect:/admin";
    }

    @GetMapping("/admin/airline/edit/{airline}")
    public String airlineEdit(@PathVariable("airline") Airline airline, Model model) {
        model.addAttribute("airline", airline);
        model.addAttribute("flights", airline.getFlights());
        return "edit-airline";
    }

    @PostMapping("/admin/airline/edit")
    public String airlineEdit(@RequestParam("airlineId") Airline airline,
                              @RequestParam String name, @RequestParam String description, @RequestParam Double rating,
                              @RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                              Principal principal) throws IOException {

        airline.setName(name);
        airline.setDescription(description);
        airline.setRating(rating);
        airlineService.changeAirline(principal, airline, file1, file2);
        return "redirect:/admin";
    }

    @GetMapping("/admin/flight/edit/{flight}")
    public String flightEdit(@PathVariable("flight") Flight flight, Model model)
            throws IOException {
        model.addAttribute("flight", flight);
        model.addAttribute("airlines", airlineService.listAirlines(null));
        return "edit-flight";
    }

    @PostMapping("/admin/flight/edit")
    public String flightEdit(@RequestParam("flightId") Flight flight,
                             @RequestParam String country_from, @RequestParam String country_to,
                             @RequestParam Integer cost, @RequestParam Map<String, String> form) throws IOException {
        flight.setCountry_from(country_from);
        flight.setCountry_to(country_to);
        flight.setCost(cost);
        airlineService.changeFlightAirline(flight, form);
        return "redirect:/admin";
    }

    @PostMapping("/admin/flight/delete/{flight}")
    public String deleteFlight(@PathVariable Flight flight) {
        flight.getAirline().deleteFlightFromAirline(flight);
        flightService.deleteFlight(flight.getId());
        return "redirect:/admin";
    }
}
