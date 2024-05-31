
<?php

$servername = "localhost";
$username = "postgres";
$password = "password";
$dbname = "your_database_name";

try {
  // Connection with error checking
  $conn = new PDO("pgsql:host=$servername;dbname=$dbname", $username, $password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
  exit; // Exit script on connection error
}

// Check connection status before proceeding
if (!$conn) {
  echo "Failed to connect to database";
  exit;
}

$sql = "SELECT * FROM BOARDS";

try {
  
  $stmt = $conn->prepare($sql);
  $stmt->execute();
} catch(PDOException $e) {
  echo "Error preparing or executing query: " . $e->getMessage();
  exit;
}

$boards = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (!$boards) {
  echo "No boards found in the database";
} else {
  echo "<h2>Boards</h2>";
  echo "<table>";
  echo "<tr>";
  echo "<th>Board Name</th>";
  echo "<th>Processor Name</th>";
  echo "<th>RAM Version</th>";
  echo "<th>Storage Type</th>";
  echo "<th>Operating System</th>";
  echo "<th>IO Interface</th>";
  echo "<th>Graphics Processor Name</th>";
  echo "<th>Wireless Version</th>";
  echo "</tr>";

  foreach ($boards as $board) {
    echo "<tr>";
    echo "<td>" . $board['BoardName'] . "</td>";
    echo "<td>" . $board['ProcessorName'] . "</td>";
    echo "<td>" . $board['RAMVersion'] . "</td>";
    echo "<td>" . $board['StorageType'] . "</td>";
    echo "<td>" . $board['OperatingSystem'] . "</td>";
    echo "<td>" . $board['IOInterface'] . "</td>";
    echo "<td>" . $board['GraphicsProccessorName'] . "</td>";
    echo "<td>" . $board['WirelessVersion'] . "</td>";
    echo "</tr>";
  }

  echo "</table>";
}


$conn = null;

?>
