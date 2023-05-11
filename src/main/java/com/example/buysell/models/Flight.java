package com.example.buysell.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "flights")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private long id;

    @Column(name="country_from")
    private String country_from;

    @Column(name="country_to")
    private String country_to;

    @Column(name="cost")
    private Integer cost;

    @Column(name="departure_time")
    private LocalDateTime departure_time;

    @Column(name="arrival_time")
    private LocalDateTime arrival_time;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Airline airline;

    @PrePersist
    private void init() {
        departure_time = LocalDateTime.now();
        arrival_time = LocalDateTime.now();
    }
}
