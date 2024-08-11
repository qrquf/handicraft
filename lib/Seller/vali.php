<?php
 $con= new mysqli("localhost:3306","ludokingatm_handyuser","3WQkmPqq1zb2ri!1q","ludokingatm_handydb");
$email=$_POST['email'];
$password=$_POST['password'];
 $output["result"]="error";
 $output["message"]="";
 $output["data"]="";

$sql="select * from user where email='$email' ";


$res=mysqli_query($con,$sql);
$count=mysqli_num_rows($res);

if($count>0)
{

    $alldata=array();
    while($row=mysqli_fetch_array($res,MYSQLI_ASSOC))
    {
        array_push($alldata,$row);
    }
    $output["result"]="success";
    $output["message"]=$count."Records Found";
    $output["data"]=$alldata;
}
else{
    $output["result"]="error";
    $output["message"]=$count."Records Found";
    $output["data"]="";
}
header("content-type:application/json");
echo json_encode($output["data"]);

?>