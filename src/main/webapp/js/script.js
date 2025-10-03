function validateLoginForm() {
    // Exemple simple
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    if (username === "" || password === "") {
        alert("Veuillez remplir tous les champs.");
        return false;
    }
    return true;
}

function validateRegisterForm() {
    const password = document.getElementById("password").value;
    const confirm = document.getElementById("confirmPassword").value;
    if (password !== confirm) {
        alert("Les mots de passe ne correspondent pas.");
        return false;
    }
    return true;
}
