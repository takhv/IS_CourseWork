package com.coursework.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "is_tp_customer")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer amountOrder;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
}
