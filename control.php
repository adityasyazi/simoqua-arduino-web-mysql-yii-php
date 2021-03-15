<?php
class wqs{
 public $link='';
 function __construct($suhu, $standar_suhu, $ph, $standar_ph, $kekeruhan, $standar_kekeruhan, $salinitas, $standar_salinitas){
  $this->connect();
  $this->storeInDB($suhu, $standar_suhu, $ph, $standar_ph, $kekeruhan, $standar_kekeruhan, $salinitas, $standar_salinitas);
 }
 
 function connect(){
  $this->link = mysqli_connect('localhost','root','') or die('Cannot connect to the DB');
  mysqli_select_db($this->link,'wqs') or die('Cannot select the DB');
 }
 
 function storeInDB($suhu, $standar_suhu, $ph, $standar_ph, $kekeruhan, $standar_kekeruhan, $salinitas, $standar_salinitas){
  $query = "insert into data set suhu='".$suhu."', standar_suhu='".$standar_suhu."', ph='".$ph."', standar_ph='".$standar_ph."', kekeruhan='".$kekeruhan."', standar_kekeruhan='".$standar_kekeruhan."', salinitas='".$salinitas."', standar_salinitas='".$standar_salinitas."'";
  $result = mysqli_query($this->link,$query) or die('Errant query:  '.$query);
  if($result === TRUE){echo "Data Tersimpan";}else{echo "Gagal Menyimpan data";}
 }
 
}
if($_GET['dataSuhu'] != '' and $_GET['dataStandarsuhu'] != '' and  $_GET['dataPh'] != ''  and  $_GET['dataStandarph'] != ''  and $_GET['dataKekeruhan'] != ''  and $_GET['dataStandarkekeruhan'] != ''  and $_GET['dataSalinitas'] != '' and $_GET['dataStandarsalinitas'] != ''){
 $wqs=new wqs($_GET['dataSuhu'], $_GET['dataStandarsuhu'], $_GET['dataPh'], $_GET['dataStandarph'],$_GET['dataKekeruhan'], $_GET['dataStandarkekeruhan'],$_GET['dataSalinitas'],$_GET['dataStandarsalinitas']);
}

?>