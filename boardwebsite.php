<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<?php 
   $conn = pg_pconnect("host=sheep port=5432 dbname=mary user=lamb password=foo");
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