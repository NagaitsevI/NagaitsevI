package nntu.irit.asu.entity;

import javax.persistence.*;

@Entity
@Table(name="AUTOPART")
public class Autopart {

    @Id
    @Column(name = "ID")
    @GeneratedValue()
    private Long id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "NUMBER")
    private int number;

    @Column(name = "PRICE")
    private float price;

   // @ManyToOne(cascade = CascadeType.ALL)
    //private Service service;

   // public Service getService() {
   //     return service;
   // }

    //public void setService(Service service) {
      //  this.service = service;
    //}

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
