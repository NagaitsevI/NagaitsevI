package nntu.irit.asu.controller;

import nntu.irit.asu.entity.Master;
import nntu.irit.asu.entity.Order;
import nntu.irit.asu.repository.MasterRepository;
import nntu.irit.asu.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/master")
public class MasterController {

    @Autowired
    private MasterRepository repository;

    @Autowired
    private OrderRepository repositoryOrder;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @Transactional
    public String getlist(Model model) {
        List<Master> masters = repository.findAll();
        model.addAttribute("masters", masters);
        return "master/masterpage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    @Transactional
    public String getAdd(Model model) {
        model.addAttribute("masterAttribute", new Master());
        return "master/addpage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @Transactional
    public String add(@ModelAttribute("masterAttribute") Master master) {
        repository.save(master);
        return "master/addedpage";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @Transactional
    public String delete(@RequestParam(value = "id", required = true) Long id,
                           Model model) {
        List<Order> orders= repositoryOrder.findAll();
        Master master = repository.findOne(id);
        for(Order order: orders){
            if (order.getMaster().equals(master)){
                repositoryOrder.delete(order);
            }
        }

        repository.delete(master);
        return "master/deletepage";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    @Transactional
    public String getEdit(@RequestParam(value = "id", required = true) Long id,
                          Model model) {
        model.addAttribute("masterAttribute", repository.findOne(id));
        return "master/editpage";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @Transactional
    public String saveEdit(@ModelAttribute("masterAttribute") Master master,
                           @RequestParam(value = "id", required = true) Long id,
                           Model model) {
        master.setId(id);
        repository.save(master);
        return "master/editedpage";
    }
}
