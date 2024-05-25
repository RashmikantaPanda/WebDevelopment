package com.techm.inventory.controller;

import com.techm.inventory.dto.ItemRequest;
import com.techm.inventory.model.Address;
import com.techm.inventory.model.Category;
import com.techm.inventory.model.Product;
import com.techm.inventory.model.PurchasedHistory;
import com.techm.inventory.model.User;
import com.techm.inventory.model.UserCart;
import com.techm.inventory.service.CategoryService;
import com.techm.inventory.service.ProductService;
import com.techm.inventory.service.PurchaseHistoryService;
import com.techm.inventory.service.UserCartService;
import com.techm.inventory.service.UserService;

import com.techm.inventory.utill.SellPdfGenerator;
import com.techm.inventory.utill.SortByProductName;
import com.techm.inventory.utill.SortByProductPrice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin")
@Slf4j
public class AdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userService;

    @Autowired
    private PurchaseHistoryService purchaseHistoryService;

    @Autowired
    private UserCartService userCartService;

    /*
     * Admin Dashboard GET
     */
    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            // Fetch Categories
            List<Category> categories = categoryService.getAllCategories();
            session.setAttribute("allCategories", categories);
            // Fetch All Products
            List<Product> allProducts = productService.getAllActiveProduct();
            session.setAttribute("allActiveProducts", allProducts);
            // Fetch All Users
            List<User> allUsers = userService.getAllUsers();
            allUsers.remove(0);
            session.setAttribute("allUsers", allUsers);
            // Fetch Total Sold Items
            int totalSoldItem = userCartService.noOfQuantitySold();
            session.setAttribute("totalSoldItem", totalSoldItem);
            log.info("Dashboard Page");
            return "adminDashboard";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Add New Product GET
     */
    @GetMapping("/add_new_item")
    public String showAddNewItemPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            ItemRequest addNewItemRequest = new ItemRequest();
            model.addAttribute("addNewItemRequest", addNewItemRequest);
            List<Category> categories = categoryService.getAllCategories();
            session.setAttribute("allCategories", categories);
            return "adminAddNewProduct";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Add New Product POST
     */
    @PostMapping("/addItem")
    public String addNewItem(@ModelAttribute("addNewItemRequest") ItemRequest addNewItemRequest, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            Product product = productService.addNewItem(addNewItemRequest, session);
            if (product == null)
                return "redirect:add_new_item";
            log.info("New Product Added");
            /*
             * remove the filledProduct session so that it will not again show at the add
             * item page
             */
            session.removeAttribute("filledProduct");
            return "redirect:view_all_products";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to Add Item");
            return "redirect:/user/login";
        }
    }

    /*
     * Edit Products(Items) GET
     */
    @GetMapping("/edit_item/{itemId}")
    public String editItemForm(@PathVariable("itemId") Integer itemId, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            Product product = new Product();
            model.addAttribute("editItem", product);
            Product oldProduct = productService.findProductById(itemId);
            log.info("Editing Product : " + oldProduct);
            session.setAttribute("editProduct", oldProduct);
            return "adminEditProduct";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to Add Item");
            return "redirect:/user/login";
        }
    }

    /*
     * Edit Products(Items) POST
     */
    @PostMapping("/edit/{id}")
    public String saveEditData(@PathVariable("id") Integer itemId, @ModelAttribute("editItem") ItemRequest product,
                               HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            productService.editProduct(product, itemId);
            return "redirect:../view_all_products";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to Add Item");
            return "redirect:/user/login";
        }
    }

    /*
     * View All Products
     */
    @GetMapping("/view_all_products")
    public String viewAllProducts(HttpSession session, @RequestParam(defaultValue = "d") String value) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            List<Product> allProducts1 = productService.allProducts();
            List<Product> allProducts = new ArrayList<>(allProducts1);
            if (value.isEmpty())
                value = "default";
            switch (value) {
                case "price_high_to_low": {
                    allProducts.sort(new SortByProductPrice().reversed());
                    break;
                }
                case "price_low_to_high": {
                    allProducts.sort(new SortByProductPrice());
                    break;
                }
                case "name_a_to_z": {
                    allProducts.sort(new SortByProductName());
                    break;
                }
                case "name_z_to_a": {
                    allProducts.sort(new SortByProductName().reversed());
                    break;
                }
                default: {
                    break;
                }
            }
            session.setAttribute("allProducts", allProducts);
            return "adminViewAllProducts";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View All Products");
            return "redirect:/user/login";
        }

    }

    /*
     * Add New Category
     */
    @GetMapping("/add_category")
    public String showNewCategoryPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            Category category = new Category();
            model.addAttribute("category", category);
            return "adminAddCategory";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Add New Category POST method, for storing the category data
     */
    @PostMapping("/add_category")
    public String saveNewCategory(@ModelAttribute("category") Category category, HttpSession session) {
        Category savedCategory = categoryService.saveCategory(category);
        if (savedCategory != null) {
            session.setAttribute("categoryAddedMsg", "Category Added");
            log.info("New Category Added : " + category);
            return "redirect:view_category";
        }
        log.error("Failed to add Category");
        return "redirect:add_category";
    }

    /*
     * Add New Category
     */
    @GetMapping("/view_category")
    public String viewAllCatagories(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            List<Category> categories = categoryService.getAllCategories();
            session.setAttribute("allCategories", categories);
            return "adminViewAllCategory";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Edit Category GET
     */
    @GetMapping("/edit_category")
    public String editCategory(@RequestParam("id") Integer categoryId, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            Category category = categoryService.getCategoryById(categoryId);
            if (category != null) {
                session.setAttribute("editCategory", category);
                model.addAttribute("category", new Category());
            }
            return "adminEditCategory";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }

    }

    /*
     * Edit Category POST
     */
    @PostMapping("/save_edit_category")
    public String saveEditCategory(@ModelAttribute("category") Category category, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            categoryService.editCategory(category, category.getId());
            return "redirect:view_category";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }

    }

    /*
     * Sell Item To User
     */
    @GetMapping("/sell_item")
    public String sellItemToUser(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            List<User> allUsers = userService.getAllActiveCustomers();
            session.setAttribute("allUsers", allUsers);
            List<Product> activeProducts = productService.getAllActiveProduct();
            session.setAttribute("allActiveProducts", activeProducts);
            model.addAttribute("userCart", new UserCart());
            return "adminSellItem";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Add item to userCart
     */
    @PostMapping("/add_items_to_user_cart")
    public String addItemsToUserCart(@ModelAttribute("userCart") UserCart userCart, HttpSession session) {
        if (userCartService.addItemToUserCart(session, userCart)) {
            return "redirect:sell_item";
        }
        return "redirect:sell_item";
    }

    /*
     * Delete from userCart based on index
     */
    @GetMapping("/sell_item/delete/{index}")
    public String removeItemFromCart(@PathVariable("index") int index, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            userCartService.deleteItemFromUserCart(index, session);
            return "redirect:/admin/sell_item";

        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Increase One Item in userCart
     */
    @GetMapping("/sell_item/plus_sell_item/{index}")
    public String plusSellItem(@PathVariable("index") int index, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            userCartService.plusOneItemInUserCart(index, session);
            return "redirect:/admin/sell_item";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Decrease One Item in userCart
     */
    @GetMapping("/sell_item/minus_sell_item/{index}")
    public String minusSellProduct(@PathVariable("index") int index, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            userCartService.minusOneItemInUserCart(index, session);
            return "redirect:/admin/sell_item";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Get All Bill Details
     */
    @GetMapping("/bill_details")
    public String billDeatilsPage(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            return "adminBillPayment";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Clear userCart
     */
    @GetMapping("/cancel_user_cart")
    public String cancelUserCart(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            session.removeAttribute("userCartItems");
            return "redirect:sell_item";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * Save user purchaseDetails
     */
    @PostMapping("/save_user_bill/{userId}")
    public String saveUserBillDetails(@PathVariable("userId") Integer userId, HttpServletRequest request,
                                      HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            String paymentMethod = request.getParameter("paymentMethod");
            String remark = request.getParameter("remark");
            System.out.println(remark + " " + paymentMethod);

            if (session.getAttribute("userCartItems") != null) {
                @SuppressWarnings("unchecked")
                List<UserCart> userCartItems = (List<UserCart>) session.getAttribute("userCartItems");
                System.out.println("Saving User Cart Items : " + userCartItems);

                var savedUsersPurchasedHistory = purchaseHistoryService.saveUsersPurchasedHistory(userCartItems,
                        paymentMethod, remark);
                System.out.println(savedUsersPurchasedHistory.getRemark() + " Saved");
                session.removeAttribute("userCartItems");
                System.out.println("Saved");
            }
            return "redirect:/admin/dashboard";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    /*
     * View Sell History
     */
    @GetMapping("/view_sell_history")
    public String viewSellHistory(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            List<PurchasedHistory> sellHistories = purchaseHistoryService.viewAllPurchaseHistory();
            Collections.reverse(sellHistories);
            session.setAttribute("sellHistories", sellHistories);
            return "adminViewSellHistory";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @GetMapping("/download_sell_pdf/{id}")
    public String downloadSellPdf(@PathVariable("id") Integer id, HttpServletResponse response, HttpSession session)
            throws IOException {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            PurchasedHistory purchasedHistory = purchaseHistoryService.findPurchaseHistoryById(id);
            System.out.println(purchasedHistory.getId());

            response.setContentType("application/pdf");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd:HH:mm:ss");
            String currentDateTime = dateFormat.format(new Date());
            String harderKey = "Content-Disposition";
            String harderValue = "attachment; filename=sell-report-" + currentDateTime + ".pdf";
            response.setHeader(harderKey, harderValue);
            SellPdfGenerator pdfGenerator = new SellPdfGenerator();
            pdfGenerator.singleSellPdfGenerator(purchasedHistory, response);
//            return "redirect:/view_sell_history";
            return null;
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @GetMapping("/delete_product/{productId}")
    public String deleteProductById(@PathVariable("productId") Integer productId, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            if (productId != null) {
                Product deltedProduct = productService.deleteProductById(productId);
                session.setAttribute("deletedProduct", deltedProduct);
                session.setAttribute("delSuccMsg", "Product Deleted Successfully");
                return "redirect:/admin/view_all_products";
            }
            session.setAttribute("delFailMsg", "Invalid Product Deatils");
            return "redirect:/admin/view_all_products";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @GetMapping("/restore_product/{productId}")
    public String retoreProductById(@PathVariable("productId") Integer productId, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            if (productId != null) {
                Product deltedProduct = productService.restoreProductById(productId);
                session.setAttribute("deletedProduct", deltedProduct);
                session.setAttribute("delSuccMsg", "Product Restored Successfully");
                return "redirect:/admin/view_all_products";
            }
            session.setAttribute("delFailMsg", "Invalid Product Deatils");
            return "redirect:/admin/view_all_products";
        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @GetMapping("/view_users")
    public String viewAllUsers(HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
            List<User> activeCustomers = userService.getAllCustomers();
            session.setAttribute("allCustomers", activeCustomers);
            return "adminViewAllCustomers";

        } else {
            session.setAttribute("invalidLoginMsg", "Login to View Dashboard");
            return "redirect:/user/login";
        }
    }

    @GetMapping("/add_new_user")
    public String addNewUserPage(Model model) {
        User user = new User();
        Address address = new Address();

        model.addAttribute("user", user);
        model.addAttribute("address", address);
        return "adminAddNewUser";
    }

    @PostMapping("/new_user_registration")
    public String addNewUser(@ModelAttribute("user") User user, @ModelAttribute("address") Address address,
                             HttpSession session) {
        user.setAddress(address);
        User registeredUser = userService.userRegistration(user, session);
        if (registeredUser != null) {
            session.setAttribute("succMsg", "User Updated Successfully");
            return "redirect:view_users";
        } else {
            session.setAttribute("errorMsg", "User Registration Failed");
            return "redirect:add_new_user";
        }
    }

    @GetMapping("/edit_customer")
    public String editCustomer(@RequestParam("custId") Integer userId, Model model) {
        User user = userService.getUserById(userId);
        Address address = new Address();

        model.addAttribute("editUser", user);
        model.addAttribute("editAddress", address);
        return "adminEditUser";
    }

    @PostMapping("/save_edit_user")
    public String saveEditCustomer(@ModelAttribute("editUser") User user,
                                   @ModelAttribute("editAddress") Address address, HttpSession session) {
        user.setAddress(address);
        var updateUser = userService.editUserByAdmin(user);
        if (updateUser == null) {
            session.setAttribute("updateFailMsg", "Email is already used");
            return "redirect:edit_customer?custId=" + user.getUserId();
        }
        session.setAttribute("succEditMsg", "User Updated Successfully");
        return "redirect:view_users";
    }

    @GetMapping("**")
    public String unknownPage() {
        return "errorPage";
    }
}
