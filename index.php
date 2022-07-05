<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>
            Smart City QR code
    </title>
</head>
<style>
    body {
  margin: 0;
  padding: 0;
}

header,
footer {
  text-align: center;
}

header {
  padding: var(--metric-box-spacing);
  background-color: hsl(140deg 70% 95%);
  font-size: 1.4em;
}

main {
  min-height: calc(100vh - 7em);
}

article {
  background-color: hsl(60deg 70% 95%);
}

aside {
  background-color: hsl(0deg 70% 95%);
}

article,
aside {
  padding: var(--metric-box-spacing);
  margin: var(--metric-box-spacing);
}

footer {
  padding: calc(var(--metric-box-spacing) / 2);
  background-color: hsl(200deg 70% 95%);
}

p {
  margin-block-start: var(--metric-box-spacing);
}

.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
</style>
<body>
<?php
include "config.php";
	
function test_input($data) {
	$data = substr($data, 0, 16);
	$data = trim($data);
	$data = strstr($data, '//', true) ?: $data;
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	$data = preg_replace("/[^a-zA-Z0-9\/]+/", "", $data);
	
  return $data;
}

$qr = test_input($_GET["qr"]);
	
if ($qr) {

$sql="SELECT 
				 qr.text as point, qr.options as options, service.text as service, service.email as semail, service.phonetitle as sphonet, service.phone as sphone, service.url as surl, city.name as city, city.logo as citylogo, city.url as cityurl
				FROM
				  qr
				  LEFT JOIN service          
                    ON qr.service=service.id
                INNER JOIN city          
                    ON qr.city=city.id
				WHERE
				  qr.qr = '".$qr."'

					";
					
			$res = @mysqli_query($conn, $sql);
			$row = mysqli_fetch_array($res);
			
			if ($row['options']) {
    		    //echo "<br><h1>Check database for QR code :".$qr."</h1>";
    		    //echo "<br><br>";
    		    echo "<h1>";
    		
    			echo '<header>';
    			echo '<a href="'.$row['cityurl'].'"><img src="'.$row['citylogo'].'" alt="'.$row['city'].'"></a>';
    			echo '<br><a href="'.$row['cityurl'].'">'.$row['cityurl'].'</a>';
    			echo '</header>';
    			echo '<main><article>';
    			echo '<br><br> '.$row['service'];
    			//echo '<br><br> '.$row['semail'];
    			echo '<br><br> '.$row['sphonet'];
    			//echo '<br><br>Τηλ. '.$row['sphone'];
    			echo '<br><br>Τηλ. <a href="tel:'.$row['sphone'].'">'.$row['sphone'].'</a>';
    			echo '<br><br><a href="'.$row['surl'].'">'.$row['surl'].'</a>';
    			
    			echo '<br><br>Σημείο : '.$row['point'];
    			
    			echo '<br><br>';
    			switch ($row['options']) {
                    case 0:
                        echo "";
                        break;
                    case 1:
                        echo ' <aside><form action="/action_page.php">';
                        echo "Υποβολή προβλήματος";
                        echo '<br><textarea id="review" name="review" rows="4" cols="20"></textarea>';
                        echo '<br><input type="submit" class="button" value="Submit"></form> </aside>';
                        break;
                    case 2:
                        //echo "Υποβολή προβλήματος";
                        echo '<meta http-equiv="refresh" content="0; URL='.$row['cityurl'].'" />';
                        break;
                }
                
                echo '</article></main><footer><small>Smart City QR</small></footer>';
    			
    			echo "</h1>";
			} else {
			    echo "<br><h1>Invalid QR code!</h1>";
			}
			
}
?>

	
</div>
</body>
</html> 

