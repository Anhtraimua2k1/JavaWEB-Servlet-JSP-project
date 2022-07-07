/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Order {
    private int id;
    private Account acc;
    private ArrayList<Order_Item> orderItems;
    private Timestamp orderDate;
    private double total;

    public Order() {
    }

    public Order(int id, Account acc, ArrayList<Order_Item> orderItems, Timestamp orderDate, double total) {
        this.id = id;
        this.acc = acc;
        this.orderItems = orderItems;
        this.orderDate = orderDate;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Account getAcc() {
        return acc;
    }

    public void setAcc(Account acc) {
        this.acc = acc;
    }

    public ArrayList<Order_Item> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(ArrayList<Order_Item> orderItems) {
        this.orderItems = orderItems;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    
    

    
    
}
