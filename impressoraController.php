<?php
require_once("impressoraModel.php");

if(isset($_POST['create'])) {
    $nomemarca = $_POST['nome'];
    $marca = $_POST['marca'];
    $modelo = $_POST['modelo'];
    $qtrolos = $_POST['qtrolos'];
    createimpressora($marca, $modelo, $qtrolos);
}

function listarimpressoras() {
    $result = getimpressoras();
    while($row = mysqli_fetch_array($result)) {
        echo "<tr>";
        echo "<td><a href='impressorasInfo.php?id=$row[idimpressora]' title='Mais informações'>". $row['idimpressora'] ."</a></td>";
        echo "<td>". $row['nome'] ."</td>";
        echo "<td>". $row['marca'] ."</td>";
        echo "<td>". $row['modelo'] ."</td>";
        echo "<td>". $row['qtrolos'] ."</td>";
        echo "<td><a href='#' name='delete' class='delete' value='$row[idimpressora]'><i class='fa fa-trash delete'></i></a></td>";
        echo "</tr>";
    }
}

function listarimpressora($id) {
    $result = getimpressora($id);
    $row = mysqli_fetch_array($result);
    return $row;
}

function getQuantidadeimpressoras() {
    $result = getimpressoras();
    $count = mysqli_num_rows($result);
    return $count;
}

if(isset($_POST['update'])) {
    $idimpressora = $_POST['idimpressora'];
    $marca = $_POST['nome'];
    $marca = $_POST['marca'];
    $modelo = $_POST['modelo'];
    $qtrolos = $_POST['qtrolos'];
    updateimpressora($idimpressora, $marca, $modelo, $qtrolos);
}

if(isset($_POST['deletevet'])) {
    $id = $_POST['idimpressora'];
    deleteimpressora($id);
}