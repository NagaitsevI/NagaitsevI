package nntu.irit.asu.controller;

import nntu.irit.asu.Copy.FindDate;
import nntu.irit.asu.Copy.OrderCopy;
import nntu.irit.asu.entity.Master;
import nntu.irit.asu.entity.Order;
import nntu.irit.asu.entity.Service;
import nntu.irit.asu.repository.ClientRepository;
import nntu.irit.asu.repository.MasterRepository;
import nntu.irit.asu.repository.OrderRepository;
import nntu.irit.asu.repository.ServiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping(value = "/order")
public class OrderController {

    @Autowired
    private OrderRepository repository;

    @Autowired
    private ServiceRepository repositoryService;

    @Autowired
    private ClientRepository repositoryClient;

    @Autowired
    private MasterRepository repositoryMaster;

    @RequestMapping(value = "/find", method = RequestMethod.POST)
    @Transactional
    public String getlist(Model model, @ModelAttribute("FindDate") FindDate findDate) {
        List<Order> orders = repository.findAll();
        List<OrderCopy> orderCopies = new ArrayList<OrderCopy>();
        for (Order order: orders) {
            if(order.getDate().equals(findDate.getDate())) {
                OrderCopy orderCopy = new OrderCopy();
                orderCopy.setId(order.getId());
                orderCopy.setDate(order.getDate());
                orderCopy.setMaster(order.getMaster());
                orderCopy.setClient(order.getClient());

                List<Service> serviceList = new ArrayList<Service>();
                Iterator<Service> iterator = order.getServiceSet().iterator();
                while (iterator.hasNext()) {
                    Service item = iterator.next();
                    serviceList.add(item);
                }
                orderCopy.setServiceList(serviceList);
                orderCopies.add(orderCopy);
            }
        }

        model.addAttribute("orders", orderCopies);
        return "order/orderespage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    @Transactional
    public String getAdd(Model model, @RequestParam(value = "id", required = true) Long id) {
        model.addAttribute("orderAttribute", new Order());
        model.addAttribute("client", repositoryClient.findOne(id));
        return "order/addpage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @Transactional
    public String add(@ModelAttribute("orderAttribute") Order order1, Model model,
                      @RequestParam(value = "id", required = true) Long id) {
        Order order = order1;
        order.setClient(repositoryClient.findOne(id));
        System.out.println(order.getId());
        System.out.println(order.getDate());
        repository.save(order);
        List<Order> orders = repository.findAll();
        for(Order order2: orders){
            if (order.equals(order2)){
                System.out.println(order2.getId());
                System.out.println(order2.getDate());
                order.setId(order2.getId());
            }
        }
        System.out.println(order.getId());
        System.out.println(order.getDate());
        List<Service> services = repositoryService.findAll();
        model.addAttribute("services", services);

        OrderCopy orderCopy = new OrderCopy();
        orderCopy.setId(order.getId());
        orderCopy.setDate(order.getDate());

        List<Service> serviceList = new ArrayList<Service>();
        Iterator<Service> iterator = order.getServiceSet().iterator();
        while (iterator.hasNext()) {
            Service item = iterator.next();
            serviceList.add(item);
        }
        orderCopy.setServiceList(serviceList);
        model.addAttribute("order", orderCopy);
        return "order/addedpage";
    }

    @RequestMapping(value = "/service", method = RequestMethod.GET)
    @Transactional
    public String serviceAdd(@RequestParam(value = "idS", required = true) Long id,
                           @RequestParam(value = "id", required = true) Long idS,
                           Model model) {
        System.out.println("IDs="+idS+" addID="+id);
        Order order = repository.findOne(idS);

        Service service = repositoryService.findOne(id);

        order.getServiceSet().add(service);
        service.getOrderSet().add(order);
        repository.save(order);
        repositoryService.save(service);

        List<Service> services = repositoryService.findAll();
        model.addAttribute("services", services);
        OrderCopy orderCopy = new OrderCopy();
        orderCopy.setId(order.getId());
        orderCopy.setDate(order.getDate());

        List<Service> serviceList = new ArrayList<Service>();
        Iterator<Service> iterator = order.getServiceSet().iterator();
        while (iterator.hasNext()) {
            Service item = iterator.next();
            serviceList.add(item);
            System.out.println(item.getName());
        }
        orderCopy.setServiceList(serviceList);
        model.addAttribute("order", orderCopy);
        return "order/addedpage";
    }

    @RequestMapping(value = "/master", method = RequestMethod.GET)
    @Transactional
    public String masterAdd(@RequestParam(value = "id", required = true) Long id,
                            Model model){
        List<Master> masters = repositoryMaster.findAll();
        model.addAttribute("masters", masters);
        model.addAttribute("idOrder", id);
        return "order/masterpage";
    }

    @RequestMapping(value = "/masteradd", method = RequestMethod.GET)
    @Transactional
    public String mAdd(@RequestParam(value = "id", required = true) Long id,
                       @RequestParam(value = "idM", required = true) Long idM,
                            Model model){
        Order order = repository.findOne(id);
        order.setMaster(repositoryMaster.findOne(idM));
        return "order/masteraddpage";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @Transactional
    public String delete(@RequestParam(value = "id", required = true) Long id,
                           Model model) {
        Order order = repository.findOne(id);
        repository.delete(order);
        return "order/deletepage";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @Transactional
    public String getFind(Model model) {
        model.addAttribute("FindDate", new FindDate());
        return "order/orderpage";
    }

}
