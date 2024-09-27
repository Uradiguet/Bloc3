<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Récupère les données envoyées par le formulaire
    $email = $_POST['email']; // Ton email
    $message = $_POST['message']; // Message envoyé

    // Envoi de l'email
    mail($email, 'Acceptation des cookies', $message);

    // Message de confirmation (peut être laissé vide)
    echo "Les cookies ont été acceptés.";
}
?>