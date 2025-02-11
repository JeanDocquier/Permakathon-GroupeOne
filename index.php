<!DOCTYPE html>

<html lang="en">

<head>
    <?php include('header.php'); ?>
    <title>PermaFungi - Accueil</title>

</head>

<body class="body-index">
    <section id="identification">
        <img src="img/permafungilogo.png" alt="Permafungi">
        <form action="utilisateur.php" method="post">
            <!-- INSERTION DE L'ACTION // INSERTION METHOD -->
            <input placeholder="Identifiant" type="text" name="identifiant">
            <input placeholder="Mot de passe" type="password" name="motdepasse">
            <select name="region" id="region">
                <!-- INSERT OPTION EN FONCTION DE DB -->
                <option selected="selected" value="Bruxelles">Bruxelles</option>
                <option value="Charleroi">Charleroi</option>
                <option value="Louvain-La-Neuve">Louvain-La-Neuve</option>
                <option value="Liège">Liège</option>
            </select>
            <input type="submit">
        </form>
    </section>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
</body>

</html>
