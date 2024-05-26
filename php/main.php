<?php
$connect = new mysqli('localhost', 'root', '', 'test_db');

if ($connect->connect_error) {
  die('Ошибка соединения с БД: ' . $connect->connect_error);
}

$query_categories = 'SELECT categories.name
  ,COUNT(*) AS count
  FROM categories
  LEFT JOIN works ON categories.id = works.category
  GROUP BY categories.name;';

$result_categories = $connect->query($query_categories);
$categories = [];

if ($result_categories->num_rows > 0) {
  while($row = $result_categories->fetch_assoc()) {
    $categories[] = $row;
  }
}

$query_works = 'SELECT works.name AS name
  ,likes
  ,comments
  ,categories.name AS category
  FROM works
  LEFT JOIN categories
  ON works.category = categories.id';

$result_works = $connect->query($query_works);
$works = [];

if ($result_works->num_rows > 0) {
  while($row = $result_works->fetch_assoc()) {
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
