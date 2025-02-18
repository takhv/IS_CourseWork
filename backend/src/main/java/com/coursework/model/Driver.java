package com.coursework.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "is_tp_driver")
public class Driver {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false)
    private Integer drivingExperience;
}
