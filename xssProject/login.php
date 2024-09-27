<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./ressources/css/styles.css">
    <title>Page de connexion</title>
</head>
<body>
    <div class="log_form">
        <form class="connectForm" action="connect.php" method="post">
            <input type="text" id="idname" name="name" placeholder="Nom d'utilisateur" required>
            <?= $_SESSION['username'] = $idname ?>
            <input type="password" id="password" name="password" placeholder="Mot de passe" required>
            <div class="conn_button">
                <input type="submit" value="Se connecter" class="connect">
            </div>
            <p for="button">Pas encore de compte ?</p>
            <a href="login.php">
                <button type="button">S'enregistrer</button>
            </a> 
        </form>
    </div>
</body>
</html>