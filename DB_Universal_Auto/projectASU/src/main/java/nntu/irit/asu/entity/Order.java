package nntu.irit.asu.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="SALE")
public class Order {

    @Id
    @Column(name = "ID")
    @GeneratedValue()
    private Long id;

    @Column(name = "DATE")
    private String date;

    @ManyToMany(cascade = CascadeType.DETACH)
    @JoinTable(name="ORDER_SERVICE",
            joinColumns = @JoinColumn(name="ORDER_ID", referencedColumnName="ID"),
            inverseJoinColumns = @JoinColumn(name="SERVICE_ID", referencedColumnName="ID")
    )
    private Set<Service> serviceSet = new HashSet<Service>();

    @ManyToOne
    @JoinColumn(name = "CLIENT_ID")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "MASTER_ID")
    private Master master;

    public Master getMaster() {
        return master;
    }

    public void setMaster(Master master) {
        this.master = master;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Set<Service> getServiceSet() {
        return serviceSet;
    }

    public void setServiceSet(Set<Service> serviceSet) {
        this.serviceSet = serviceSet;
    }

    @Override
    public boolean equals(Object o) {
        //if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (date != null ? !date.equals(order.date) : order.date != null) return false;
        if (serviceSet != null ? !serviceSet.equals(order.serviceSet) : order.serviceSet != null) return false;
        return client != null ? client.equals(order.client) : order.client == null;
    }

    @Override
    public int hashCode() {
        int result = date != null ? date.hashCode() : 0;
        result = 31 * result + (serviceSet != null ? serviceSet.hashCode() : 0);
        result = 31 * result + (client != null ? client.hashCode() : 0);
        return result;
    }
}
