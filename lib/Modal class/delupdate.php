<?php
    $con= new mysqli("localhost:3306","ludokingatm_handyuser","3WQkmPqq1zb2ri!1q","ludokingatm_handydb");
   
    $date=$_POST['date'];
    
    $sq="select * from product_inventory INNER JOIN product where product_inventory.p_id=product.id and product_inventory.operation='modified'  and product_inventory.Date='$date'";
    $del=mysqli_query($con,$sq);
$count=mysqli_num_rows($del);
    if($count>0)
    {
        $alldata=array();
        $p=0;
        while($row=mysqli_fetch_assoc($result))
        {
            $alldata[$p]=$row['p_id'];
            $p=$p+1;
        }
        $i=0;
        while($i<=count($alldata))
        {$j=$alldata[$i];
            $sq1="delete * from product where id='$j'";
        $i=$i+1;
        mysqli_query($con,$sq1);
    }


    //    unlink("fileupload/".$image1);
      //  unlink("fileupload/".$image2);
       // unlink("fileupload/".$image3);
       // unlink("fileupload/".$image4);
        $output['result']="success";
        $output['message']="Data Deleted Succesfully";
    }
    else
    {
        $sq="select * from  product_inventory.p_id from product_inventory INNER JOIN product  on product_inventory.p_id=product.id and product_inventory.operation='modified'  and product_inventory.Date='$date'";
    $del=mysqli_query($con,$sq);
    if($del)
    {
        $alldata=array();
        $p=0;
        while($row=mysqli_fetch_assoc($result))
        {
            $alldata[$p]=$row['p_id'];
            $p=$p+1;
        }
        $i=0;
        while($i<=count($alldata))
        {$j=$alldata[$i];
            $sq1="delete * from product where id='$j'";
        $i=$i+1;
        mysqli_query($con,$sq1);
    }
    
  //      unlink("fileupload/".$image1);
    //    unlink("fileupload/".$image2);
     //   unlink("fileupload/".$image3);
     //   unlink("fileupload/".$image4);
        $output['result']="success";
        $output['message']="Data Deleted Succesfully";

    }else{
        $output['result']="error";
        $output['message']="Data not Deleted";
    }
}
    header("content-type:application/json");
    echo json_encode($output);
    
?>
