<?php

$conn = mysqli_connect('localhost', 'root', '', 'intervolga');
/*           Запрос создания таблицы
 * $conn = mysqli_query($conn, "CREATE TABLE `intervolga`.`players` ( `id` INT(11) NOT NULL AUTO_INCREMENT ,  `ФИО` TEXT NOT NULL ,  `email` VARCHAR(100) NOT NULL ,  `number` INT(11) NOT NULL ,  `birthday` DATE NOT NULL ,  `date_create` TIMESTAMP NOT NULL ,  `passport` TINYINT(6) NOT NULL ,  `average_point` TINYINT(3) NOT NULL ,  `biography` TEXT NOT NULL ,  `video` LONGBLOB NOT NULL ,    PRIMARY KEY  (`id`)) ENGINE = InnoDB;");
*/
$select_players = mysqli_query($conn, "SELECT `player_id`,`event_id`,`result` FROM `results` WHERE(`result` <4) GROUP BY `player_id`,`event_id`,`result` ORDER BY `results`.`event_id` ASC");
$top = mysqli_query($conn, "SELECT player_id, COUNT(`event_id`) FROM `results` GROUP BY player_id ORDER BY `COUNT(``event_id``)` DESC")
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <style>
        .left {
            display:inline-block;
        }
        .right{
            margin-left: 200px;
            display: inline-block;
        }
    </style>
</head>
<body>
<div class="left">
    <table>
        <h3>Вывод топ 3 каждого соревнования:</h3>
        <tr>
            <th>ФИО</th>
            <th>Соревнование</th>
            <th>Место</th>
        </tr>
        <?php foreach ($select_players as $player){
            $player_id = $player['player_id'];
            $player1 = mysqli_query($conn, "SELECT * FROM `players` WHERE player_id =  $player_id ");
            $event_id = $player['event_id'];
            $events = mysqli_query($conn, "SELECT * FROM `events` WHERE event_id =  $event_id ");
            ?>
            <?php foreach ($player1 as $i){?>
                <?php foreach ($events as $event){?>
        <tr>
            <td><?= $i['ФИО']?></td>
            <td><?= $event['Name']?></td>
            <td><?= $player['result']?></td>
        </tr>
        <?php }}}?>
    </table>
</div>

<div class="right">
<h3>Топ 5 участников, больше всех посетивших соревнования:</h3>
    <table>
        <tr>
            <th>Имя</th>
            <th>Количество участий в соревнованиях</th>

        </tr>

        <?php foreach($top as $i){
            $player_id = $i['player_id'];
            $names = mysqli_query($conn, "SELECT * FROM `players` WHERE player_id = $player_id");
            foreach($names as $name){
            ?>
        <tr>
            <td><?= $name['ФИО']?></td>
            <td><?= $i['COUNT(`event_id`)']?></td>
        </tr>
        <?php }} ?>
    </table>
</div>



</body>
</html>

