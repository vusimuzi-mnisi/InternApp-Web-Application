<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    <title>Login Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        body {
            background-color: #c9d6ff;
            background: linear-gradient(to right, #e2e2e2, #c9d6ff);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 480px;
        }

        .container p {
            font-size: 14px;
            line-height: 20px;
            letter-spacing: 0.3px;
            margin: 20px 0;
        }

        .container span {
            font-size: 12px;
        }

        .container a {
            color: #333;
            font-size: 13px;
            text-decoration: none;
            margin: 15px 0 10px;
        }

        .container button {
            background-color: #9D4BFF;
            color: #fff;
            font-size: 12px;
            padding: 10px 45px;
            border: 1px solid transparent;
            border-radius: 8px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-top: 10px;
            cursor: pointer;
        }

        .container button.hidden {
            background-color: transparent;
            border-color: #fff;
        }

        .container form {
            background-color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            height: 100%;
        }

        .container input {
            background-color: #eee;
            border: none;
            margin: 8px 0;
            padding: 10px 15px;
            font-size: 13px;
            border-radius: 8px;
            width: 100%;
            outline: none;
        }
        .signUp input[type="submit"]{
            background-color: #9D4BFF;
            color: #fff;
            font-size: 12px;
            padding: 10px 45px;
            border: 1px solid transparent;
            border-radius: 8px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-top: 10px;
            cursor: pointer;
        }

        .container select {
            background-color: #eee;
            color: gray;
            border: none;
            padding: 10px 15px;
            font-size: 13px;
            border-radius: 8px;
            width: 100%;
            outline: none;
            margin: 8px 0;
        }

        .container option {
            background-color: #9D4BFF;
            color: #fff;
        }

        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-in {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container.active .sign-in {
            transform: translateX(100%);
        }

        .sign-up {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .container.active .sign-up {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: move 0.6s;
        }

        @keyframes move {
            0%, 49.99% {
                opacity: 0;
                z-index: 1;
            }
            50%, 100% {
                opacity: 1;
                z-index: 5;
            }
        }

        .social-icons {
            margin: 20px 0;
        }

        .social-icons a {
            border: 1px solid #ccc;
            border-radius: 20%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 3px;
            width: 40px;
            height: 40px;
        }

        .toggle-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: all 0.6s ease-in-out;
            border-radius: 150px 0 0 100px;
            z-index: 1000;
        }

        .container.active .toggle-container {
            transform: translateX(-100%);
            border-radius: 0 150px 100px 0;
        }

        .toggle {
            background-color: #9D4BFF;
            height: 100%;
            background: linear-gradient(to right, #9D4BFF, #9D4BFF);
            color: #fff;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: all 0.6s ease-in-out;
        }

        .container.active .toggle {
            transform: translateX(50%);
        }

        .toggle-panel {
            position: absolute;
            width: 50%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 30px;
            text-align: center;
            top: 0;
            transform: translateX(0);
            transition: all 0.6s ease-in-out;
        }

        .toggle-left {
            transform: translateX(-200%);
        }

        .container.active .toggle-left {
            transform: translateX(0);
        }

        .toggle-right {
            right: 0;
            transform: translateX(0);
        }

        .container.active .toggle-right {
            transform: translateX(200%);
        }
        .password-strength {
            width: 78%;
            height: 5px;
            background-color: #ddd;
            border-radius: 5px;
            margin: 5px 0;
        }

        .box .password-strength {
            position: absolute;
        }

        .box .password-strength:nth-child(3) {
            filter: blur(5px);
        }

        .box .password-strength:nth-child(4) {
            filter: blur(10px);
        }
        .alert-custom {
            margin-top: 20px;
            
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
            border-radius: 5px;
            padding: 15px;
        }
    </style>
</head>

<body>
    
    <div class="container" id="container">
        <div class="form-container sign-up">
            <form action="RegistrationServlet" method="post">
                <h1>Create Account</h1>
                <div class="social-icons">
                    <a href="https://support.google.com/accounts/answer/27441?hl=en" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="https://www.facebook.com/signup" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="https://github.com/signup" class="icon"><i class="fa-brands fa-github"></i></a>
                    <a href="https://www.linkedin.com/signup" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <span>or use your email for registration</span>
                <div class="box">
                    <input type="email" name="username" placeholder="Username">
                <select name="role" id="role">
                    <option value="" disabled selected hidden>Role</option>
                    <option value="intern">Intern</option>
                </select>
                <input type="password" id="password" name="password" placeholder="Password">
                <input type="password" id="password2" name="password2" placeholder="Confirm Password">
                <span id="text">Strength</span>
                    <div class="password-strength"></div>
                    <div class="password-strength"></div>
                    <div class="password-strength"></div>
                    <div class="password-strength"></div>
                    <div class="password-strength"></div>
                    
                    <p id="message"></p>
                <button type="submit" onclick="checkPassword()">Sign Up</button>
                </div>
                
            </form>
        </div>
        <div class="form-container sign-in">
            <form action="LoginServlet" method="post">
                <h1>Login</h1>
                <div class="social-icons">
                    <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                    <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                </div>
                <span>or use your username password</span>
                <input type="email" name="username" placeholder="Username">
                <input type="password" name="password" placeholder="Password">
                <a href="#">Forget Your Password?</a>
                <button type="submit">Login</button>
                <%
                    String loginError = (String) request.getAttribute("loginError");
                        if (loginError != null) {
                %>
                <div class="alert alert-danger alert-custom">
                    <%= loginError %>
                </div>
                <%
                        }
                %>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Welcome Back!</h1>
                    <p>Enter your account details to use all of site features</p>
                    <button class="hidden" id="login">Sign In</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Hello!</h1>
                    <p>Register an account to use all of site features</p>
                    <button class="hidden" id="register">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
                const password = document.getElementById("password");
const strengthBars = document.querySelectorAll(".password-strength");
const strengthText = document.getElementById("text");

password.addEventListener("input", () => {
    const val = password.value;
    let strength = 0;

    if (val.length > 4) strength++;
    if (/[A-Z]/.test(val)) strength++;
    if (/[a-z]/.test(val)) strength++;
    if (/[0-9]/.test(val)) strength++;
    if (/[^A-Za-z0-9]/.test(val)) strength++;

    strengthBars.forEach((bar, index) => {
        if (index < strength) {
            bar.style.backgroundColor = "green"; // Specify the color you want
        } else if (index === strength){
            bar.style.backgroundColor = "#FFA500";
        }
        else {
             bar.style.backgroundColor = "#FF0000";
        }
    });

    let message = "";
    switch (strength) {
        
        case 1:
        case 2:
            message = "Weak";
            break;
        case 3:
            message = "Fair";
            break;
        case 4:
            message = "Good";
            break;
        
        case 5:
            message = "Strong";
            break;
    }
    strengthText.textContent = message;
});

        const container = document.getElementById('container');
        const registerBtn = document.getElementById('register');
        const loginBtn = document.getElementById('login');

        registerBtn.addEventListener('click', () => {
            container.classList.add("active");
        });

        loginBtn.addEventListener('click', () => {
            container.classList.remove("active");
        });

        function checkPassword() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("password2").value;

            console.log(password, confirmPassword);
            let message = document.getElementById("message");

            if (password.length !== 0) {
                if (password === confirmPassword) {
                    message.textContent = "Passwords match";
                    message.style.backgroundColor = "#3ae374";
                } else {
                    message.textContent = "Passwords do not match!";
                    message.style.backgroundColor = "#ff4d4d";
                }
            } else {
                alert("Password cannot be empty!");
            }
        }
    </script>
</body>

</html>