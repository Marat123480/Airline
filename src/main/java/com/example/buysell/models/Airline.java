package com.example.buysell.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
@Entity
@Table(name = "airlines")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Airline {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private long id;
    @Column(name="name")
    private String name;
    @Column(name="description", columnDefinition = "text")
    private String description;
    @Column(name="rating")
    private Double rating;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
            mappedBy = "airline")
    private List<Image> images = new ArrayList<>();
    private Long previewImageId;
    private LocalDateTime dateOfCreated;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;
    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "airline")
    private List<Flight> flights = new ArrayList<>();

    public void addImageToProduct(Image image) {
        image.setAirline(this);
        images.add(image);
    }
    public void deleteImagesToProduct(Image image){
        image.setAirline(null);
        images.remove(image);
    }
    public void addFlightToAirline(Flight flight) {
        flight.setAirline(this);
        flights.add(flight);
    }
    public void deleteFlightFromAirline(Flight flight) {
        flight.setAirline(null);
        flights.remove(flight);
    }
    public Flight getFlightById(Integer id) {
        return flights.get(id);
    }
    public String getName() {
        return this.name;
    }

    public String getDescription() {
        return this.description;
    }

    public Double getRating() {
        return this.rating;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Airline)) return false;
        final Airline other = (Airline) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$name = this.getName();
        final Object other$name = other.getName();
        if (!Objects.equals(this$name, other$name)) return false;
        final Object this$description = this.getDescription();
        final Object other$description = other.getDescription();
        if (!Objects.equals(this$description, other$description))
            return false;
        final Object this$rating = this.getRating();
        final Object other$rating = other.getRating();
        return Objects.equals(this$rating, other$rating);
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Airline;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $name = this.getName();
        result = result * PRIME + ($name == null ? 43 : $name.hashCode());
        final Object $description = this.getDescription();
        result = result * PRIME + ($description == null ? 43 : $description.hashCode());
        final Object $rating = this.getRating();
        result = result * PRIME + ($rating == null ? 43 : $rating.hashCode());
        return result;
    }

    public String toString() {
        return "Airline(name=" + this.getName() + ", description=" + this.getDescription() + ", rating=" + this.getRating() + ")";
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
