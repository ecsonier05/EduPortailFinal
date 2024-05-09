<?php
    if(isset($_GET['evaluation']) && !empty($_GET['evaluation'])){
        $conn = mysqli_connect('localhost', 'root', '', 'eduportail');
    
        mysqli_set_charset($conn, 'utf8');

        $idEvaluation = mysqli_real_escape_string($conn, $_GET['evaluation']);
    
        $sql = "SELECT prenom, nom
        FROM enseignants
        INNER JOIN cours_livres ON Enseignants_idEnseignant = idEnseignant
        INNER JOIN inscriptions ON Cours_Livres_idCours_Livre = idCours_Livre
        INNER JOIN evaluations_etudiants ON Inscriptions_idInscription = idInscription
        INNER JOIN evaluations ON idEvaluation = Evaluations_idEvaluation
        WHERE idEvaluation_Etudiant = '$idEvaluation'";
    
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