package com.example.demo2.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="hotel_review")
public class Review {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private int rate;
	private String comment;
	private Date ratingDate;
	
	@ManyToOne(cascade=CascadeType.ALL) // N : 1 간계 리뷰 : 호텔
	@JoinColumn(name="hotel_id")
	private Hotel hotel;
	// 외래키가 설정된 테이브가 주인이되도록
}
