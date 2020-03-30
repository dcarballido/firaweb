<!DOCTYPE html>
<html>
<head>
  <title>PORTAL CRONOS</title>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
  <!------ Include the above in your HEAD tag ---------->


  <div class="wrapper fadeInDown">
    
    <div id="formContent">
      <br>
      <img class="logo" src="https://m.joan23.fje.edu/sites/all/themes/escuelas_fje_mobile/images/logo_bellvitge_fje.png">
    <br>
    <br>
      <!-- Tabs Titles -->

      <!-- Icon -->
      <!--<div class="fadeIn first">
        <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
      </div>-->

      <!-- Login Form -->
      <form method="post" action="services/login.proc.php">
        <input type="text" id="login" class="fadeIn second" name="user" placeholder="User">
        <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password">
        <input type="submit" class="fadeIn fourth" value="Log In">
      </form>


    </div>
      <?php 


    if(isset($_REQUEST['error'])){
      echo "<p style='text-align: center;color:red;'>* El Usuario o la Contraseña no son correcto</p>";
    }else{
      echo "";
    }

  ?>
  </div>

</body>
</html>

