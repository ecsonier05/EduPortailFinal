<?php
    if(isset($_GET['matricule']) && !empty($_GET['matricule'])){
        $conn = mysqli_connect('localhost', 'root', '', 'eduportail');
    
        mysqli_set_charset($conn, 'utf8');

        $matricule = mysqli_real_escape_string($conn, $_GET['matricule']);
    
        $sql = "SELECT sigle, titreCours
        FROM inscriptions
        INNER JOIN cours_livres ON Cours_Livres_idCours_Livre = idCours_Livre
        INNER JOIN cours ON Cours_sigle = sigle
        WHERE etudiant_matricule = '$matricule'";
    
        $result = mysqli_query($conn, $sql);

        if(!$result){
            echo mysqli_error($conn);
            exit;
        }

        while($row = mysqli_fetch_assoc($result)){
            $data = $row;
        }

        echo json_encode($data);
        mysqli_close($conn);
    }
?>