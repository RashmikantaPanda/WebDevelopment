/*
package com.techm.inventory.controller;

import com.techm.inventory.dto.LoginRequest;
import com.techm.inventory.model.Address;
import com.techm.inventory.model.Product;
import com.techm.inventory.model.PurchasedHistory;
import com.techm.inventory.model.User;
import com.techm.inventory.service.ProductService;
import com.techm.inventory.service.PurchaseHistoryService;
import com.techm.inventory.service.SmsService;
import com.techm.inventory.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("user")
@Slf4j
public class OldUserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PurchaseHistoryService purchaseHistoryService;

    @Autowired
    private ProductService productService;

    @Autowired
    private SmsService smsService;

    @GetMapping("/registration")
    public String userRegistrationPage(Model model) {
        User user = new User();
        Address address = new Address();

        model.addAttribute("user", user);
        model.addAttribute("address", address);

        return "userRegistration";
    }

    @PostMapping("/registration")
    public String userRegistration(@ModelAttribute("user") User user, @ModelAttribute("address") Address address,
                                   HttpSession session) {
        user.setAddress(address);
        User registeredUser = userService.userRegistration(user, session);
        if (registeredUser != null) {
            String msgBody= "Hi "+user.getFirstName()+" your account is created Successfully.\n"+"Thanks from RK Panda";
            smsService.sendSimpleSmg(user.getPhone(),msgBody);
            return "redirect:login";
        }
        else
            return "redirect:registration";
    }

    @GetMapping("/login")
    public String userLoginPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            LoginRequest loginRequest = new LoginRequest();
            model.addAttribute("loggedInRequest", loginRequest);

            return "login";
        } else {
            if (loggedInUser.getRole().equalsIgnoreCase("ADMIN"))
                return "redirect:/admin/dashboard";
            else
                return "redirect:/user/dashboard";
        }

    }

    @GetMapping("/loginFailed")
    public String errorLogin(){
        return "errorPage";
    }



    @PostMapping("/login")
    public String userLogin(@ModelAttribute("loggedInRequest") LoginRequest loginRequest, HttpSession session) {

        User user = userService.userLogin(loginRequest);

        if (user == null) {
            session.setAttribute("failMsg", "Invalid Credentials");
            return "redirect:login";

        }
        if (!user.getIsAccountActive()) {
            session.setAttribute("failMsg", "Account is not active");
            System.out.println("LoggedIn Failed , REQ ID : " + loginRequest.getEmail());
            return "redirect:login";
        }
        if (user.getRole().equalsIgnoreCase("ADMIN")) {
            session.setAttribute("succMsg", "Success");
            session.setAttribute("loggedInUser", user);
            session.setAttribute("isLoggedIn", true);
            log.info("LoggedIn Success , REQ ID : " + loginRequest.getEmail());
            return "redirect:/admin/dashboard";
        } else {
            session.setAttribute("succMsg", "Success");
            session.setAttribute("loggedInUser", user);
            session.setAttribute("isLoggedIn", "true");
            log.info("LoggedIn Success , REQ ID : " + loginRequest.getEmail());
            return "redirect:dashboard";
        }
    }

    @GetMapping("/logout")
    public String logoutUser(HttpSession session) {
        session.invalidate();
        log.info("User Logged Out");
        return "redirect:login";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("USER")) {
            User user = userService.getUserById(loggedInUser.getUserId());
            session.setAttribute("loggedInUser", user);
            log.info("User Dashboard...");
            return "userDashboard";
        } else {
            session.setAttribute("failMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @GetMapping("/edit_profile")
    public String editProfilePage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("USER")) {
            User user = new User();
            Address address = new Address();

            model.addAttribute("editUser", user);
            model.addAttribute("editAddress", address);

            return "userEditProfile";
        } else {
            session.setAttribute("failMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @PostMapping("/edit_profile")
    public String editAndProfilePage(@ModelAttribute("editUser") User user,
                                     @ModelAttribute("editAddress") Address address, HttpSession session) {
        user.setAddress(address);
        User updatedUser = userService.editUserDetails(user);
        session.removeAttribute("loggedInUser");
        session.setAttribute("loggedInUser", updatedUser);
        return "redirect:dashboard";
    }

    @GetMapping("/view_purchased_history")
    public String viewPurchasedHistoryPage(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("USER")) {
            List<PurchasedHistory> purchaseHistory = purchaseHistoryService
                    .viewPurchasedHistoryByUserId(loggedInUser.getUserId());
            session.setAttribute("purchaseHistory", purchaseHistory);
            return "userViewPurchasedHistory";
        } else {
            session.setAttribute("failMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @GetMapping("/view_all_products")
    public String viewAllProducts(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("USER")) {
            List<Product> allProducts = productService.allProducts();
            session.setAttribute("allProducts", allProducts);
            return "userViewAllProducts";
        } else {
            session.setAttribute("failMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @GetMapping("**")
    public String unknownPage(HttpSession session) {
        if (session.getAttribute("isLoggedIn") != null) {
            return "redirect:dashboard";
        }
        return "errorPage";
    }

}
*/
