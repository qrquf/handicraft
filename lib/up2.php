<?php
// include 'dash.php';
$con= new mysqli("localhost:3306","ludokingatm_handyuser","3WQkmPqq1zb2ri!1q","ludokingatm_handydb");
$id=$_GET['updateid'];
$sql="select * from seller where id=$id";
$result=mysqli_query($con,$sql);
$row=mysqli_fetch_assoc($result);
$first=$row['first'];
        $second=$row['second'];
        $last=$row['last'];
        $country=$row['country'];
        $business=$row['business'];
        $website=$row['website'];
        $number=$row['number'];
        $email=$row['email'];
        $city=$row['City'];
        $product=$row['product'];
        $pincode=$row['pincode'];
        $state=$row['state'];
        $code=$row['country_code'];



    if(isset($_POST['submit'])){
        $first=$_POST['first'];
        $second=$_POST['second'];
        $last=$_POST['last'];
        $country=$_POST['country'];
        $business=$_POST['business'];
        $website=$_POST['website'];
        $number=$_POST['number'];
        $email=$_POST['email'];
        $city=$_POST['City'];
        $product=$_POST['product'];
        $pincode=$_POST['pincode'];
        $state=$_POST['state'];
        $code=$_POST['code'];


        $insert="insert into seller(first,second,last,country,business,website,number,email,
        City,product,pincode,state,country_code) values('$first','$second','$last','$country',
        '$business','$website','$number','$email','$city','$product','$pincode','$state','$code')";
        $result=mysqli_query($con,$insert);
        if($result){

             echo "Data Inserted successfully";
            header('location:displayseller.php');
        }
        else{
            echo 'sss';
            die(mysqli_error($con));
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

    <title>Seller</title>
  </head>
  <body>
    <!-- <h1>Hello, world!</h1> -->

    <div class="container w-100 mx-0">
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6  shadow">
                <div class="card  my-5">
                   <div class="card-body shadow bg-danger">
                   <h1 class="card-title bg-success text-center text-white">Seller Page</h1>
                   <form method="post">
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" class="form-control" name="first" placeholder="Enter Your First Name"
                            value=<?echo $first?>>
                        </div>
                        <div class="form-group">
                            <label>Second Name</label>
                            <input type="text" class="form-control" name="second" placeholder="Enter Your Second Name"
                            value=<?echo $second?>>
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" class="form-control" name="last" placeholder="Enter Your Last Name"
                            value=<?echo $last?>>
                        </div>
                        <select class="form-control" name="country" value=<?echo $country?>>
                            <option>Choose Country</option>
                            <option>India</option>
                            <option>PK</option>
                            <option>MP</option>
                            <option>Nepal</option>
                        </select><br>
                        <select class="form-control" name="business" value=<?echo $business?>>
                            <option>Choose Business Type</option>
                            <option>Business</option>
                            <option>Individual</option>
                        </select>
                        
                        <div class="form-group pt-3">
                            <label>Enter The URL Of The Website</label>
                            <input type="website" class="form-control" name="website" placeholder="Enter Your Website URL" value=<?echo $website?>>
                            <small class="form-text text-muted">this field is optional</small>
                        </div>

                        <div class="form-group">
                            <label>Enter Your Mobile Number</label>
                            <input type="number" class="form-control" name="number" placeholder="Enter Your Mobile Number" value=<?echo $number?>>
                        </div>

                        <div class="form-group">
                            <label>Enter Your Email</label>
                            <input type="email" class="form-control" name="email" placeholder="Enter Your Email" value=<?echo $email?>>
                        </div>
                        <div class="form-group">
                            <label>Enter Your City</label>
                            <input type="text" class="form-control" name="City" placeholder="Enter your CIty" value=<?echo $city?>>
                        </div>

                        <br/>

                        Choose All the Category in which you want to sell the Product<br><br/>
                        <input type="checkbox" value="sculture" name="product">Sculpture</br></br>
                        <input type="checkbox" value="wall" name="product">Wall Painting</br></br>
                        <input type="checkbox" value="cubism" name="product">Cubism</br><br/>

						<div class="form-group">
                            <label>Enter Your Pincode</label>
                            <input type="text" class="form-control" name="pincode" placeholder="Enter your Pincode" value=<?echo $pincode?>>
                        </div>
						
						<div class="form-group">
                            <label>Enter Your State</label>
                            <input type="text" class="form-control" name="state" placeholder="Enter your state" value=<?echo $state?>>
                        </div>
						
						<div class="form-group">
                            <label>Enter Your Country Code</label>
                            <input type="text" class="form-control" name="code" placeholder="Enter your Country Code" value=<?echo $code?>>
                        </div>
                        <button type="submit" class="btn btn-primary" name="submit" >Save And Continue</button>
                    </form>
                   </div>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>

  </body>
</html>