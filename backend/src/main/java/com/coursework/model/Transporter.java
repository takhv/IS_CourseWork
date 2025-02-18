package com.coursework.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "is_tp_transporter")
public class Transporter {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Integer amountOrder;

    @Column(nullable = false)
    private Float rating;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
}
