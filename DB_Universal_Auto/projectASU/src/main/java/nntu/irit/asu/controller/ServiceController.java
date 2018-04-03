package nntu.irit.asu.controller;

import nntu.irit.asu.Copy.ServiceCopy;
import nntu.irit.asu.entity.Autopart;
import nntu.irit.asu.entity.Service;
import nntu.irit.asu.repository.AutopartRepository;
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
@RequestMapping(value = "/service")
public class ServiceController {

    @Autowired
    private ServiceRepository repository;

    @Autowired
    private AutopartRepository repositoryAutopart;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @Transactional
    public String getlist(Model model) {
        List<Service> services = repository.findAll();
        List<ServiceCopy> serviceCopies = new ArrayList<ServiceCopy>();
        for (Service service: services) {
            ServiceCopy serviceCopy = new ServiceCopy();
            serviceCopy.setId(service.getId());
            serviceCopy.setName(service.getName());
            serviceCopy.setPrice(service.getPrice());

            List<Autopart> autoparts = new ArrayList<Autopart>();
            Iterator<Autopart> iterator = service.getAutopartSet().iterator();
            while (iterator.hasNext()) {
                Autopart item = iterator.next();
                autoparts.add(item);
            }
            serviceCopy.setAutopartList(autoparts);
            serviceCopies.add(serviceCopy);
        }

        model.addAttribute("services", serviceCopies);
        return "service/servicepage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    @Transactional
    public String getAdd(Model model) {
        model.addAttribute("serviceAttribute", new Service());
        return "service/addpage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @Transactional
    public String add(@ModelAttribute("serviceAttribute") Service service, Model model) {
        repository.save(service);
        List<Autopart> autoparts = repositoryAutopart.findAll();
        model.addAttribute("autoparts", autoparts);

        ServiceCopy serviceCopy = new ServiceCopy();
        serviceCopy.setId(service.getId());
        serviceCopy.setName(service.getName());
        serviceCopy.setPrice(service.getPrice());

        List<Autopart> autopartList = new ArrayList<Autopart>();
        Iterator<Autopart> iterator = service.getAutopartSet().iterator();
        while (iterator.hasNext()) {
            Autopart item = iterator.next();
            autopartList.add(item);
        }
        serviceCopy.setAutopartList(autopartList);
        model.addAttribute("service", serviceCopy);
        return "service/addedpage";
    }

    @RequestMapping(value = "/autopart", method = RequestMethod.GET)
    @Transactional
    public String AddAutopart(@RequestParam(value = "idS", required = true) Long idS,
                           @RequestParam(value = "id", required = true) Long id,
                           Model model) {
        Service service = repository.findOne(idS);

        Autopart autopart = repositoryAutopart.findOne(id);
        service.getAutopartSet().add(autopart);
        repository.save(service);

        List<Autopart> autoparts = repositoryAutopart.findAll();
        model.addAttribute("autoparts", autoparts);
        ServiceCopy serviceCopy = new ServiceCopy();
        serviceCopy.setId(service.getId());
        serviceCopy.setName(service.getName());
        serviceCopy.setPrice(service.getPrice());

        List<Autopart> autopartList = new ArrayList<Autopart>();
        Iterator<Autopart> iterator = service.getAutopartSet().iterator();
        while (iterator.hasNext()) {
            Autopart item = iterator.next();
            autopartList.add(item);
        }
        serviceCopy.setAutopartList(autopartList);
        model.addAttribute("service", serviceCopy);
        return "service/addedpage";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @Transactional
    public String delete(@RequestParam(value = "id", required = true) Long id,
                         Model model) {
        Service service = repository.findOne(id);
        repository.delete(service);
        return "service/deletepage";
    }

}
