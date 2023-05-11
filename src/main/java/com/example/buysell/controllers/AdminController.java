package com.example.buysell.controllers;

import com.example.buysell.models.User;
import com.example.buysell.models.enums.Role;
import com.example.buysell.services.AirlineService;
import com.example.buysell.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final AirlineService airlineService;

    @GetMapping("/admin")
    public String admin(Model model){
        model.addAttribute("users", userService.list());
        model.addAttribute("airlines", airlineService.listAirlines(null));
        model.addAttribute("flights", airlineService.getAllFlights());
        return "admin";
    }

    @PostMapping("/admin/user/delete/{id}")
    public String userBan(@PathVariable("id") Long id){
        userService.deleteUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form,
                           @RequestParam String email, @RequestParam String name, @RequestParam String phone){
        user.setEmail(email);
        user.setName(name);
        user.setNumberPhone(phone);
        userService.changeUserRole(user, form);
        return "redirect:/admin";
    }
}
