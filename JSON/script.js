// let mahasiswa = {
//     "nama" : "Aidil Oktadwifa Prayetno",
//     "nrp" : "2217020079",
//     "email" : "dilloktadwifa@gmail.com"
// }

//     // console.log(mahasiswa);
// console.log(JSON.stringify(mahasiswa));


//  -----Menggunggunakan AJAX untuk memanggil coba.json ----
// let xhr = new XMLHttpRequest();
// xhr.onreadystatechange = function () {
//     if(xhr.readyState == 4 && xhr.status == 200) {
//         // let mahasiswa = this.responseText;

//         // untuk jadi object
//         let mahasiswa = JSON.parse(this.responseText);  
//         console.log(mahasiswa);
//     }
// }
// xhr.open('GET', 'coba.json', true);
// xhr.send();


//  Menggunakan JQUERY
$.getJSON('coba.json', function (data) {
    console.log(data);
});
