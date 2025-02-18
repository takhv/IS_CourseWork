package com.coursework.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "is_tp_bet")
public class Bet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "transporter_id", nullable = false)
    private Transporter transporter;

    @Column(nullable = false)
    private Integer cost;

    @ManyToOne
    @JoinColumn(name = "auction_id", nullable = false)
    private Auction auction;

    private Boolean win = false;
}
