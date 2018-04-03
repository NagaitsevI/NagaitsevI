package nntu.irit.asu.entity;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="SERVICE")
public class Service {

    @Id
    @Column(name = "ID")
    @GeneratedValue()
    private Long id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "PRICE")
    private float price;

    @OneToMany()
    private Set<Autopart> autopartSet = new HashSet<Autopart>();

    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "serviceSet", cascade = CascadeType.ALL)
    private Set<Order> orderSet = new HashSet<Order>();

    public Set<Order> getOrderSet() {
        return orderSet;
    }

    public void setOrderSet(Set<Order> orderSet) {
        this.orderSet = orderSet;
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

    public Set<Autopart> getAutopartSet() {
        return autopartSet;
    }

    public void setAutopartSet(Set<Autopart> autopartSet) {
        this.autopartSet = autopartSet;
    }
}
