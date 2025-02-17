package com.coursework.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "is_tp_way")
public class Way {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String start;

    @Column(nullable = false)
    private String finish;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private User customer;
}
