package com.example.demo.manage.Controller;



import com.example.demo.manage.Model.Value;
import com.example.demo.manage.Service.ValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/value")
public class ValueController {
    @Autowired
//CustomerDAO customerDAO;
    ValueService valueService;
    @GetMapping("/list")
    public String listValues(Model theModel, @Param("keyword") String keyword) {
        List<Value> theValues = valueService.getAllValues(keyword);
        theModel.addAttribute("values", theValues);
        theModel.addAttribute("keyword", keyword);
        return "list-value";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {
        Value theValue = new Value();
        theModel.addAttribute("value", theValue);
        return "value-form";
    }

    @PostMapping("/saveValue")
    public String saveValue(@ModelAttribute("values") Value theValue) {
        valueService.saveValue(theValue);
        return "redirect:/value/list";
    }

    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("valueId") int theId, Model theModel) {
        Value theValue = valueService.getValue(theId);
        theModel.addAttribute("value", theValue);
        return "value-form";
    }

    @GetMapping("/delete")
    public String deleteValue(@RequestParam("valueId") int theId, Model theModel) {
        valueService.deleteValue(theId);
        return "redirect:/value/list";
    }
}
