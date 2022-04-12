<?php
$input = array(1,1,1,2,1,1,1,2,1,1,1,2,1,1,1,2);
$a = 'YES';
function input($array, $a) {
    for ($i=0; $i <count($array); $i++) {
        if ($array[$i] == 2) {
            if ($i > 0 && ($i + 1) < count($array)) {
                $array = array_merge(
                    array_slice($array, 0, $i + 1),
                    array($i => $a),
                    array_slice($array, $i + 1, (count($array)-$i)));
            }
            if ($i == 0) {
                $array = array_merge(array_slice($array, 0, ((count($array) + 1) - count($array))),
                    array($i => $a),
                    array_slice($array, 1));
            }
            if ($i + 1 == count($array)) {
                $array = array_merge(
                    array_slice($array, 0, count($array)+1),
                    array($i => $a),
                    array_slice($array, $i, 0));
            }
        }
    }
    return $array;
}
print_r(input($input, $a));

