<?php					# main route for webinar.ru test
					# Last update: 16:32:24 14-Jul-18 Violet *

# limit the output
$maxlines= 200;

# the list of containers, produced by make
$LIST="instances.txt";

$ins= fopen ( $LIST, "r");

if (!$ins)  {
   echo "Error opening $LIST\n";
   exit;
}

# getting backends' list into array, $n backends total
$backends= array();
$n= -1;

while ( ($ln= fgets($ins)) != false )  {
    $ln= rtrim ($ln);
    $spec= preg_split ("/\s/", $ln);
    array_push ( $backends, $spec );
    $n++;
}

fclose ($ins);

# print_r ( $backends );

# query random backend about table size
$r= rand ( 0, $n );

$sql = new mysqli ('127.0.0.1','dbuser','userpass','wtest_db',$backends[$r][1]);
set_time_limit(0);

if ($sql->connect_errno) {
echo "Error: " . $sql->connect_errno . ":" . $sql->connect_error."\n";
}

$q = "SELECT count(*) from tab1";

if (!$result = $sql->query($q)) {
echo "Error: " . $sql->errno . ":" . $sql->error;
}

if ($result->num_rows === 0) {
    echo "Empty table tab1, cannot proceed";
    exit;
}
$row= $result->fetch_row();

# we have k rows in each table
$k= $row[0];

$result->free();
$sql->close();

#echo "$k rows found\n";

for ( $i= 0; $i < $maxlines; $i++ ) {
    # get a random backend
    $b= rand ( 0, $n );
    # get a random id in table
    $r= rand ( 1, $k );
    $sql = new mysqli ('127.0.0.1','dbuser','userpass','wtest_db',$backends[$b][1]);
    if ($sql->connect_errno) {
	echo "Error: ". $backends[$b][0] .",err=" . $sql->connect_errno . ":" . $sql->connect_error."\n";
    } else {
	$q = "SELECT a.firstname,b.lastname from tab1 as a join tab2 as b on a.id=b.id where a.id=$r;";
	$result2= $sql->query($q);
	$row= $result2->fetch_row();
	echo "$r\t".$row[0]."\t".$row[1]."\tfrom\t".$backends[$b][0]."\n";
	$sql->close();
    }
}


?>
