
function logout() {   /*logout() : this is for patient logout*/
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "logout", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                Swal.fire({
                    icon: 'success',
                    title: 'Logged Out!',
                    text: 'You have been logged out successfully.',
                    timer: 5000,
                });
                setTimeout(function () {
                    // window.location.href = "${pageContext.request.contextPath}/index.jsp";
                    window.location.href = "index.jsp";
                }, 3000);
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Logout failed. Please try again.',
                });
            }
        }
    };
    xhr.send();
}

function doctorLogout() {  /*this method is for doctor logout*/
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "doctorLogout", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                Swal.fire({
                    icon: 'success',
                    title: 'Logged Out!',
                    text: 'You have been logged out successfully.',
                    timer: 5000,
                });
                setTimeout(function () {
                    // window.location.href = "${pageContext.request.contextPath}/index.jsp";
                    window.location.href = "index.jsp";
                }, 3000);
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Logout failed. Please try again.',
                });
            }
        }
    };
    xhr.send();
}

function adminLogout() {  /*this method is for doctor logout*/
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "adminLogout", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                Swal.fire({
                    icon: 'success',
                    title: 'Logged Out!',
                    text: 'You have been logged out successfully.',
                    timer: 5000,
                });
                setTimeout(function () {
                    // window.location.href = "${pageContext.request.contextPath}/index.jsp";
                    window.location.href = "index.jsp";
                }, 3000);
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Logout failed. Please try again.',
                });
            }
        }
    };
    xhr.send();
}

function togglePasswordVisibility() {
    var passwordInput = document.getElementById("inputPassword3");
    var icon = document.getElementById("togglePassword");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        icon.innerHTML = '<i class="fa fa-eye" aria-hidden="true"></i>';
    } else {
        passwordInput.type = "password";
        icon.innerHTML = '<i class="fa fa-eye-slash" aria-hidden="true"></i>';
    }
}