<?php
require_once 'db.php';

function createimpressora($nome, $marca, $modelo, $qtrolos) {
    global $connect;
    $query = "INSERT INTO impressora(nome, marca, modelo, qtrolos) 
    VALUES ('$nome', '$somarca', '$modelo', '$qtrolos', now())";
    
    if($connect->query($query)) {
        echo "Registro adicionado";
    } else {
        echo "Error " . $query . ' ' . $connect->connect_error;
    }
    
    $connect->close();
}

function getimpressoras() {
    global $connect;
    $query = "SELECT idimpressora, nome, marca, modelo, qtrolos FROM impressoras";
    $result = mysqli_query($connect, $query);
    return $result;
}

function getimpressora($id) {
    global $connect;
    $query = "SELECT idimpressora, nome, marca, modelo, qtrolos
    FROM impressoras WHERE idimpressora = '$id'";
    $result = mysqli_query($connect, $query);
    return $result;
}

function updateimpressora($nome, $marca, $modelo, $qtrolos) {
    global $connect;
    $query = "UPDATE impressoras 
    SET nome = '$nome', marca = '$marca', modelo = '$modelo', qtrolos = '$qtrolos' 
    WHERE idimpressora = '$id'";
    if(mysqli_query($connect, $query)) {
        echo "Update";
    } else {
        echo "Error" . $query . ' ' . $connect->connect_error;
    }

    $connect->close();
}

function deleteimpressora($id) {
    global $connect;
    $query = "DELETE FROM impressora WHERE idimpressora = '$id'";
    if(mysqli_query($connect, $query)) {
        echo "Delete";
    } else {
        echo "Error" . $query . ' ' . $connect->connect_error;
    }
    $connect->close();
}