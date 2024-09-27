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
    $username = trim($_POST['name']);
    $password = $_POST['password'];
    $confirmpassword = $_POST['confirmpassword'];

    // Vérification que les champs ne sont pas vides et que les mots de passe correspondent
    if (!empty($username) && !empty($password) && $password === $confirmpassword) {
        // Hachage du mot de passe
        $password_hash = password_hash($password, PASSWORD_BCRYPT);

        // Préparer la requête SQL pour éviter les injections SQL
        $query = $connection->prepare("INSERT INTO users (usr_name, usr_password) VALUES (?, ?)");
        if ($query === false) {
            die("Erreur de préparation de la requête : " . htmlspecialchars($connection->error));
        }
        
        $query->bind_param("ss", $username, $password_hash);

        // Exécution de la requête et gestion des erreurs
        if ($query->execute()) {
            echo '<p class="success">Votre enregistrement a bien été effectué !</p>';
        } else {
            // Vérifier si l'erreur est liée à une clé dupliquée (nom d'utilisateur déjà utilisé)
            if ($connection->errno == 1062) {
                echo '<p class="error">Ce nom d\'utilisateur est déjà utilisé.</p>';
            } else {
                echo '<p class="error">Une erreur est survenue lors de l\'enregistrement. Veuillez réessayer.</p>';
            }
        }

        // Fermer la requête
        $query->close();
    } else {
        echo '<p class="error">Les mots de passe ne sont pas identiques ou les champs sont vides !</p>';
    }

    // Fermer la connexion
    $connection->close();
    exit();
} else {
    // Redirection si l'utilisateur accède à cette page sans soumettre le formulaire
    header("Location: connect.php");
    exit();
}
?>
