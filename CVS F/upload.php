<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<em>Размер файла не более 5 мб</em>
<form action="upload.php" method="post" enctype="multipart/form-data">
    <input type="file" name="csv">
    <button>Загрузить</button>


</form>

<?php



if($_FILES['csv']['type'] != 'text/csv' || $_FILES['csv']['type'] = ''){
    echo 'Ошибка формата файла';
}elseif($_FILES['csv']['size'] > 5*1024*1024){
    echo 'Файл превышает допустимые значения';
    exit;
}else{
    echo 'Файл загружен';
    if(move_uploaded_file($_FILES['csv']['tmp_name'], 'upload/' . $_FILES['csv']['name'])){
        $file = fopen('upload/' . $_FILES['csv']['name'], 'r');
        while($data = fgetcsv($file, 200, ';')){
            print_r($data);
        }
    }




}
?>
</body>
</html>
