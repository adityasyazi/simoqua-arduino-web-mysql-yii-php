<?php
class dsb182{
 public $link='';
 function __construct($suhu){
  $this->connect();
  $this->storeInDB($suhu);
 }
 
 function connect(){
  $this->link = mysqli_connect('localhost','root','') or die('Cannot connect to the DB');
  mysqli_select_db($this->link,'simoqua') or die('Cannot select the DB');
 }
 
 function storeInDB($suhu){
  $query = "insert into sensor_suhu set suhu='".$suhu."'";
  $result = mysqli_query($this->link,$query) or die('Errant query:  '.$query);
  if($result === TRUE){echo "Data Tersimpan";}else{echo "Gagal Menyimpan data";}
 }
 
}
if($_GET['dataSuhu'] != ''){
 $dsb182=new dsb182($_GET['dataSuhu']);
}

?>
