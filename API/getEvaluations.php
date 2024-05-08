<?php
    if(isset($_GET['matricule']) && !empty($_GET['matricule'])){
        $conn = mysqli_connect('localhost', 'root', '', 'eduportail');
    
        mysqli_set_charset($conn, 'utf8');

        $matricule = mysqli_real_escape_string($conn, $_GET['matricule']);
    
        $sql = "SELECT datePublication, notePointage, notePourcentage, retroaction, nomEvaluation, ponderation, pointage
        FROM evaluations_etudiants 
        INNER JOIN evaluations
        ON Evaluations_idEvaluation = idEvaluation
        INNER JOIN inscriptions
        ON Inscriptions_idInscription = idInscription
        WHERE Etudiant_matricule = '$matricule'
        AND publier = '1'
        ORDER BY datePublication DESC";
    
        $result = mysqli_query($conn, $sql);
    
        if(!$result){
            echo mysqli_error($conn);
            exit;
        }
        
        $data;

        while($row = mysqli_fetch_assoc($result)){
            $data = $row;
        }

        echo json_encode($data);
        mysqli_close($conn);
    }
?>