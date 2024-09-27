<?php
session_start();
if (!isset($_SESSION["username"])) {
    header("Location: register.html");
    exit(); 
}


$host = 'localhost';
$dbname = 'vulnerable_site';
$username = 'root';
$password = '';

try {
    // Connexion à la base de données avec PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Création de la table 'comments' si elle n'existe pas
    $pdo->exec("CREATE TABLE IF NOT EXISTS comments (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255),
        comment TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        ip_address VARCHAR(255)
    )");
} catch (PDOException $e) {
    die("Erreur de connexion ou création de la base de données/tables : " . $e->getMessage());
}

function getUserIpAddr() {
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        // IP depuis le partage Internet
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        // IP passée par un proxy
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        // IP réelle de l'utilisateur
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}

$ip_address = getUserIpAddr();

// Gestion du formulaire de commentaire
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['comment'])) {
    $username = $_SESSION['user'];
    $comment = $_POST['comment'];
    echo json_encode([
        'username' => ($username),
        'comment' => $comment,
        'created_at' => date('Y-m-d H:i:s'),
        'ip_address' => $ip_address
        ]);
    

    // Insertion du commentaire dans la base de données
    $stmt = $pdo->prepare("INSERT INTO comments (username, comment, ip_address) VALUES (?, ?, ?)");
    $stmt->execute([$username, $comment, $ip_address]);

    // Redirection après l'ajout du commentaire pour éviter la resoumission lors du rechargement
    header("Location: index.php");
    exit();  // Assurez-vous que le script s'arrête après la redirection
}


// Récupérer les commentaires de la base de données
$comments = $pdo->query("SELECT * FROM comments ORDER BY created_at DESC")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Site Vulnérable - XSS</title>
</head>
<body>
    <h1>Bienvenue, <?= $_SESSION['username']; ?> !</h1>

    <h2>Ajouter un commentaire</h2>
    <form action="index.php" method="post">
        <textarea name="comment" rows="5" cols="50" placeholder="Votre commentaire ici..." required></textarea><br>
        <div class="bouton">
            <button type="submit">Envoyer</button>
        </div>
    </form>

    <h2>Liste des commentaires</h2>
    <?php if ($comments): ?>
        <?php foreach ($comments as $comment): ?>
            <div>
                <strong><?= $comment['username'] ; ?></strong> a dit :<br>
                <p><?= $comment['comment'] ; ?></p> 
                <em>Posté le <?= $comment['created_at']; ?></em>
            </div>
            <hr>
        <?php endforeach; ?>
    <?php else: ?>
        <p>Aucun commentaire pour le moment.</p>
    <?php endif; ?>
</body>
</html>
