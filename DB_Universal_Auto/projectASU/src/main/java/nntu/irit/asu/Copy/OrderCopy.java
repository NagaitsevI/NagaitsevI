package nntu.irit.asu.Copy;

import nntu.irit.asu.entity.Client;
import nntu.irit.asu.entity.Master;
import nntu.irit.asu.entity.Service;

import java.util.List;

public class OrderCopy {

    private Long id;

    private String date;

    private List<Service> serviceList;

    private Master master;

    private Client client;

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

    public List<Service> getServiceList() {
        return serviceList;
    }

    public void setServiceList(List<Service> serviceList) {
        this.serviceList = serviceList;
    }
}
