<?php

    $con= new mysqli("localhost:3306","ludokingatm_handyuser","3WQkmPqq1zb2ri!1q","ludokingatm_handydb");
    $editid=$_REQUEST['id'];
    $sql="select * from product where id=$editid";
$result=mysqli_query($con,$sql);
$row=mysqli_fetch_assoc($result);
$name=$row['name'];
$picA=$row['product1'];
$picB=$row['product2'];
$picC=$row['product3'];
$picD=$row['product4'];
$discount=$row['discount'];
$price=$row['price'];
$sale=$row['sale'];
$category=$row['category'];
$delpath="fileupload/".$row['2'];
$delpath="fileupload/".$row['3'];
$delpath="fileupload/".$row['4'];
$delpath="fileupload/".$row['5'];


    if(isset($_POST['submit'])){
        unlink($delpath);
        $name=$_POST['name'];
        $sellerid=$_POST['s_id'];
       
        $picA=$_FILES['picA']['name'];
        $picAtemp=$_FILES['picA']['tmp_name'];

        $picB=$_FILES['picB']['name'];
        $picBtemp=$_FILES['picB']['tmp_name'];

        $picC=$_FILES['picC']['name'];
        $picCtemp=$_FILES['picC']['tmp_name'];

        $picD=$_FILES['picD']['name'];
        $picDtemp=$_FILES['picD']['tmp_name'];

        $discount=$_POST['discount'];
        $price=$_POST['price'];
        $sale=$_POST['sale'];
        $category=$_POST['category'];
        $path="fileupload/";


        $insert="update product set name='$name', product1='$picA',product2='$picB',product3='$picC',product4='$picD',discount='$discount',price='$price',sale='$sale',category='$category' where id=$editid";
        $result=mysqli_query($con,$insert);
        if($result){
            move_uploaded_file($picAtemp,$path.$picA);
            move_uploaded_file($picBtemp,$path.$picB);
            move_uploaded_file($picCtemp,$path.$picC);
            move_uploaded_file($picDtemp,$path.$picD);
            //  echo "Data Inserted successfully";
             header('location:displaypro.php');
        }
        else{
            // die(mysqli_error($con));
            echo "data not inserted";
        }
        
    }
?>



<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Product</title>
  </head>
  <body>
  <div class="container my-5 w-100 mx-0 bg-info shadow">

  <form method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label>Name</label>
    <input type="text" class="form-control" placeholder="Enter your name" name="name" autocomplete="off" value=<?echo $name
    ?>> 
  </div>
  <div class="form-group">
    <label>Product 1</label>
    <input type="file" class="form-control" name="picA" value=<?echo $picA
    ?> > 
  </div><div class="form-group">
    <label>Product 2</label>
    <input type="file" class="form-control" name="picB" value=<?echo $picB
    ?>> 
  </div>
  <div class="form-group">
    <label>Product 3</label>
    <input type="file" class="form-control" name="picC" value=<?echo $picC
    ?>> 
  </div>
  <div class="form-group">
    <label>Product 4</label>
    <input type="file" class="form-control" name="picD" value=<?echo $picD
    ?>> 
  </div>
  <div class="form-group">
    <label>Discount</label>
    <input type="number" class="form-control" placeholder="Enter your discount..." name="discount" autocomplete="off" 
    value=<?echo $discount
    ?>> 
  </div>
  <div class="form-group">
    <label>Price</label>
    <input type="number" class="form-control" placeholder="Enter your Price..." name="price" autocomplete="off"
    value=<?echo $price
    ?>> 
  </div>
  <div class="form-group">
    <label>Sale Price</label>
    <input type="number" class="form-control" placeholder="Enter your Sale Price... Ex.₹50" name="sale" autocomplete="off"
    value=<?echo $sale
    ?>> 
  </div>
  <div class="form-group">
    <label>Seller Id</label>
    <input type="number" class="form-control" placeholder="Enter seller id" name="s_id" autocomplete="off"> 
  </div>
  
  <div class="form-group">
    <label>Category</label>
    <select name="category" class="form-control" value=<?echo $category
    ?>>
	
			<option>Wall Painting</option>
			<option>Sculpture</option>
			<option>Drawing</option>
			<option>Pottery</option>
			<option>Cubism</option>
			<option>Photography</option>
			<option>Digital Art</option>
            

		</select> 
  </div>


  <button type="submit" class="btn btn-warning" name="submit">Save</button>
</form>
  </div>
   
  </body>
</html>