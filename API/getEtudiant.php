<?php
    if(isset($_GET['matricule']) && !empty($_GET['matricule'])){
        $conn = mysqli_connect('localhost', 'root', '', 'eduportail');
    
        mysqli_set_charset($conn, 'utf8');

        $matricule = mysqli_real_escape_string($conn, $_GET['matricule']);
    
        $sql = "SELECT prenom, nom, nomUtilisateur, matricule, titreProgramme, courrielEtudiant, dureeAnnee
        FROM etudiants
        INNER JOIN campus_programmes
        INNER JOIN programmes
        WHERE matricule = '$matricule'
        AND campus_programmes_programmes_idProgramme = idProgramme";
    
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