<?php

$config = require 'config.php';

$connect = new mysqli($config['host'], $config['user'], $config['password'], $config['database']);

if ($connect->connect_error) {
    die('Ошибка соединения с БД: ' . $connect->connect_error);
}

$query_categories = 'SELECT phc_categories.name
    ,COUNT(*) AS count
    FROM phc_categories
    LEFT JOIN phc_works ON phc_categories.id = phc_works.category
    GROUP BY phc_categories.name';

$result_categories = $connect->query($query_categories);
$categories = [];

if ($result_categories->num_rows > 0) {
    while ($row = $result_categories->fetch_assoc()) {
        $categories[] = $row;
    }
}

$query_works = 'SELECT phc_works.name AS name
    ,likes
    ,comments
    ,phc_categories.name AS category
    FROM phc_works
    LEFT JOIN phc_categories
    ON phc_works.category = phc_categories.id';

$result_works = $connect->query($query_works);
$works = [];

if ($result_works->num_rows > 0) {
    while ($row = $result_works->fetch_assoc()) {
        $works[] = $row;
    }
}

$data = [
    'categories' => $categories,
    'works' => $works,
];

header('Content-Type: application/json');
echo json_encode($data);

$connect->close();
