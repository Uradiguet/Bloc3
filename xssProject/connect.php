<?php
session_start();

$servername = "localhost";
$db_username = "root";
$db_password = "";
$dbname = "vulnerable_site";

// Connexion à la base de données
$connection = new mysqli($servername, $db_username, $db_password, $dbname);

// Vérifier la connexion
if ($connection->connect_error) {
    die("Échec de la connexion : " . $connection->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['name'];
    $password = $_POST['password'];

    // Préparer la requête SQL pour éviter les injections SQL
    $query = $connection->prepare("SELECT id, usr_password FROM users WHERE usr_name = ?");
    $query->bind_param("s", $username);
    $query->execute();
    $result = $query->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        if (password_verify($password, $user['usr_password'])) {
            // Connexion réussie
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $username; // Optionnel : stocke également le nom d'utilisateur en session
            header("Location: index.php");
            exit();
        } else {
            // Mot de passe incorrect
            echo '<p class="error">Mot de passe invalide</p>';
        }
    } else {
        // Utilisateur non trouvé
        echo '<p class="error">L\'utilisateur est inexistant</p>';
    }

    // Fermer la requête et la connexion
    $query->close();
    $connection->close();
}
?>
