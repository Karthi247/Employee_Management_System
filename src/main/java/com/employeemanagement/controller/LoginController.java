package com.employeemanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.employeemanagement.model.User;
import com.employeemanagement.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepo;

    // ✅ Show login page
    @GetMapping("/login")
    public String loginPage(Model model) {
        return "login";  // /WEB-INF/views/login.jsp
    }

    // ✅ Handle login form submit
    @PostMapping("/login")
    public String doLogin(@RequestParam String username,
                          @RequestParam String password,
                          Model model,
                          HttpSession session) {

        // ✅ Check with database
        User user = userRepo.findByUsername(username);

        if (user != null && user.getPassword().equals(password)) {

            // ✅ Save user in session
            session.setAttribute("loggedInUser", username);
            session.setAttribute("role", "USER");

            return "redirect:/dashboard";
        }

        // ❌ If invalid
        model.addAttribute("error", "Invalid username or password");
        return "login";
    }

    // ✅ Dashboard (protected)
    @GetMapping({"/", "/home", "/dashboard"})
    public String dashboard(HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        return "dashboard";
    }

    // ✅ Show signup page
    @GetMapping("/signup")
    public String signupPage() {
        return "signup";  // /WEB-INF/views/signup.jsp
    }

    // ✅ Register POST method (save user)
    @PostMapping("/register")
    public String registerUser(@RequestParam String username,
                               @RequestParam String email,
                               @RequestParam String password,
                               Model model) {

        // Check duplicate username
        if (userRepo.findByUsername(username) != null) {
            model.addAttribute("error", "Username already taken!");
            return "signup";
        }

        // Create user
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password); // plain password for now

        userRepo.save(user);

        return "redirect:/login?registered";
    }

    // ✅ Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout";
    }
    
}
