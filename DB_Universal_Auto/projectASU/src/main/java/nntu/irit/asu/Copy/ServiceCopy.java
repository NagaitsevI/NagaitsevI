package nntu.irit.asu.Copy;

import nntu.irit.asu.entity.Autopart;

import java.util.List;

public class ServiceCopy {

    private Long id;

    private String name;

    private float price;

    private List<Autopart> autopartList;

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

    public List<Autopart> getAutopartList() {
        return autopartList;
    }

    public void setAutopartList(List<Autopart> autopartList) {
        this.autopartList = autopartList;
    }
}
