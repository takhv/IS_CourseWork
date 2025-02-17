package com.coursework.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "is_tp_cargo")
public class Cargo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @Column(nullable = false)
    private Integer weight;

    @Column(nullable = false)
    private Integer size;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private User customer;
}
