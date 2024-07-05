<!DOCTYPE html>
<html>
<head>
<title>Board Website</title>
</head>
<body>

<h1>These Are the Boards from the Database</h1>
<?php 
   $conn = pg_pconnect("host=inserthostname port=5432 dbname=insertdbname user=insertuser password="insertpassword");
   if (!$conn) {
     echo "An error occurred.\n";
     exit;
   }
   
   $result = pg_query($conn, "SELECT * FROM public.boards");
   if (!$result) {
     echo "An error occurred.\n";
     exit;
   }
   
   $arr = pg_fetch_array($result, 0, PGSQL_NUM);
   echo $arr[0] . "Row 1 Board Name";
   echo $arr[1] . "Row 1 Ram Name";
   echo $arr[2] . "Row 1 Storage";
   echo $arr[3] . "Row 1 OS";
   echo $arr[4] . "Row 1 IO";
   

   
   

     ?>

</body>
</html>
