<?php
    $con= new mysqli("localhost:3306","ludokingatm_handyuser","3WQkmPqq1zb2ri!1q","ludokingatm_handydb");
   
    $date=$_POST['date'];
    $mod='modified';
    $create='created';
    $sq="select * from product_inventory INNER JOIN product on product_inventory.p_id=product.id and product_inventory.operation='$create'  and product_inventory.Date='$date'";
    $del=mysqli_query($con,$sq);
$count=mysqli_num_rows($del);
    if($count>0)
    {
       
        $output['result']="success";
        $output['message']="Data Deleted Succesfully";
       
    }


    //    unlink("fileupload/".$image1);
      //  unlink("fileupload/".$image2);
       // unlink("fileupload/".$image3);
       // unlink("fileupload/".$image4);
       // $output['result']="success";
        //$output['message']="Data Deleted Succesfully";
    
    else
    {
      //  $sq="select * from product_inventory INNER JOIN product  on product_inventory.p_id=product.id and product_inventory.operation='$create'  and product_inventory.Date='$date'";
    //$del=mysqli_query($con,$sq);
    //$count=mysqli_num_rows($del);
    
  //      unlink("fileupload/".$image1);
    //    unlink("fileupload/".$image2);
     //   unlink("fileupload/".$image3);
     //   unlink("fileupload/".$image4);
    

        $output['result']="error";
        $output['message']="Data not Deleted";
    }

    header("content-type:application/json");
    echo json_encode($output['result']);
    
?>
