package nntu.irit.asu.controller;

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
@RequestMapping(value = "/autopart")
public class AutopartController {

    @Autowired
    private AutopartRepository repository;

    @Autowired
    private ServiceRepository repositoryService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    @Transactional
    public String getlist(Model model) {
        List<Autopart> autoparts = repository.findAll();
        model.addAttribute("autoparts", autoparts);
        return "autopart/autopartpage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    @Transactional
    public String getAdd(Model model) {
        model.addAttribute("autopartAttribute", new Autopart());
        return "autopart/addpage";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @Transactional
    public String add(@ModelAttribute("autopartAttribute") Autopart autopart) {
        repository.save(autopart);
        return "autopart/addedpage";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @Transactional
    public String delete(@RequestParam(value = "id", required = true) Long id,
                         Model model) {
        Autopart autopart = repository.findOne(id);
        List<Service> services = repositoryService.findAll();
        for (Service service: services){
            List<Autopart> autopartList = new ArrayList<Autopart>();
            Iterator<Autopart> iterator = service.getAutopartSet().iterator();
            while (iterator.hasNext()) {
                Autopart item = iterator.next();
                autopartList.add(item);
            }
            for (Autopart autopart1: autopartList){
                if(autopart1==autopart) repositoryService.delete(service);
            }
        }
        repository.delete(autopart);
        model.addAttribute("id", id);
        return "autopart/deletepage";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    @Transactional
    public String getEdit(@RequestParam(value = "id", required = true) Long id,
                          Model model) {
        model.addAttribute("autopartAttribute", repository.findOne(id));
        return "autopart/editpage";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @Transactional
    public String saveEdit(@ModelAttribute("autopartAttribute") Autopart autopart,
                           @RequestParam(value = "id", required = true) Long id,
                           Model model) {
        autopart.setId(id);
        repository.save(autopart);
        model.addAttribute("id", id);
        return "autopart/editedpage";
    }
}
