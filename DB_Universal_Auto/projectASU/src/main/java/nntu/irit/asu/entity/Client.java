package nntu.irit.asu.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="CLIENT")
public class Client {

    @Id
    @Column(name = "ID")
    @GeneratedValue()
    private Long id;

    @Column(name = "SURNAME")
    private String surname;

    @Column(name = "NAME")
    private String name;

    @Column(name = "PHONE")
    private String phone;

    @Column(name = "BRAND")
    private String brand;

    @Column(name = "MODEL")
    private String model;

    @Column(name = "REG_PLATE")
    private String registration_plate;

//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "client", cascade = CascadeType.ALL)
//    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "clientSet", cascade = CascadeType.ALL)
//    private Set<Order> orderSet = new HashSet<Order>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getRegistration_plate() {
        return registration_plate;
    }

    public void setRegistration_plate(String registration_plate) {
        this.registration_plate = registration_plate;
    }

//    public Set<Order> getOrderSet() {
//        return orderSet;
//    }
//
//    public void setOrderSet(Set<Order> orderSet) {
//        this.orderSet = orderSet;
//    }
}
