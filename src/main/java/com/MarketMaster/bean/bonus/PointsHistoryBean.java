package com.MarketMaster.bean.bonus;

import java.util.Date;
import jakarta.persistence.*;

@Entity
@Table(name = "points_history")
public class PointsHistoryBean {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "points_history_id")
    private int pointsHistoryId;
    
    @Column(name = "customer_tel")
    private String customerTel;
    
    @Column(name = "checkout_id")
    private String checkoutId;
    
    @Column(name = "exchange_id")
    private String exchangeId;
    
    @Column(name = "points_change")
    private int pointsChange;
    
    @Column(name = "transaction_date")
    private Date transactionDate;
    
    @Column(name = "transaction_type")
    private String transactionType;
    
    // Constructors, getters, and setters
    public PointsHistoryBean() {}
    
    public PointsHistoryBean(String customerTel, String checkoutId, String exchangeId, 
                             int pointsChange, Date transactionDate, String transactionType) {
        this.customerTel = customerTel;
        this.checkoutId = checkoutId;
        this.exchangeId = exchangeId;
        this.pointsChange = pointsChange;
        this.transactionDate = transactionDate;
        this.transactionType = transactionType;
    }
    
    // Getters and setters
    public int getPointsHistoryId() { return pointsHistoryId; }
    public void setPointsHistoryId(int pointsHistoryId) { this.pointsHistoryId = pointsHistoryId; }
    
    public String getCustomerTel() { return customerTel; }
    public void setCustomerTel(String customerTel) { this.customerTel = customerTel; }
    
    public String getCheckoutId() { return checkoutId; }
    public void setCheckoutId(String checkoutId) { this.checkoutId = checkoutId; }
    
    public String getExchangeId() { return exchangeId; }
    public void setExchangeId(String exchangeId) { this.exchangeId = exchangeId; }
    
    public int getPointsChange() { return pointsChange; }
    public void setPointsChange(int pointsChange) { this.pointsChange = pointsChange; }
    
    public Date getTransactionDate() { return transactionDate; }
    public void setTransactionDate(Date transactionDate) { this.transactionDate = transactionDate; }
    
    public String getTransactionType() { return transactionType; }
    public void setTransactionType(String transactionType) { this.transactionType = transactionType; }
}