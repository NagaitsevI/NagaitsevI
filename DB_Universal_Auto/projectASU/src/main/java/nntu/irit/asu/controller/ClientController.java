package nntu.irit.asu.controller;

import nntu.irit.asu.entity.Client;
import nntu.irit.asu.entity.Order;
import nntu.irit.asu.repository.ClientRepository;
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
@RequestMapping(value = "/client")
public class ClientController {

    @Autowired
    private ClientRepository repository;

    @Autowired
    private OrderRepository repositoryOrder;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @Transactional
    public String getlist(Model model) {
        List<Client> clients = repository.findAll();
        model.addAttribute("clients", clients);
        return "client/clientpage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    @Transactional
    public String getAdd(Model model) {
        model.addAttribute("clientAttribute", new Client());
        return "client/addpage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @Transactional
    public String add(@ModelAttribute("clientAttribute") Client client) {
        repository.save(client);
        return "client/addedpage";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @Transactional
    public String delete(@RequestParam(value = "id", required = true) Long id,
                           Model model) {
        List<Order> orders= repositoryOrder.findAll();
        Client client = repository.findOne(id);
        for(Order order: orders){
            if (order.getClient().equals(client)){
                repositoryOrder.delete(order);
            }
        }

        repository.delete(client);
        return "client/deletepage";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    @Transactional
    public String getEdit(@RequestParam(value = "id", required = true) Long id,
                          Model model) {
        model.addAttribute("clientAttribute", repository.findOne(id));
        return "client/editpage";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @Transactional
    public String saveEdit(@ModelAttribute("clientAttribute") Client client,
                           @RequestParam(value = "id", required = true) Long id,
                           Model model) {
        client.setId(id);
        repository.save(client);
        return "client/editedpage";
    }
}
