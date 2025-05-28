<?php

//  Menggunggakan JSON //
// $mahasiswa =[
//     [
//         "nama" => "Aidil Oktadwifa Prayetno",
//         "nrp" => "2217020079",
//         "email" => "dilloktadwifa@gmail.com"
//     ],
//     [
//         "nama" => "Fadira Az-zahra",
//         "nrp" => "2217020001",
//         "email" => "fadira@gmail.com"
//     ]
// ];


$dbh = new PDO('mysql:host=localhost;dbname=pengaduan_mahasiswa', 'root');
$db = $dbh->prepare('SELECT * FROM mahasiswa');
$db->execute();
$mahasiswa = $db->fetchAll(PDO::FETCH_ASSOC);


// header('Content-Type: application/json');
$data = json_encode($mahasiswa);
echo $data;

?>