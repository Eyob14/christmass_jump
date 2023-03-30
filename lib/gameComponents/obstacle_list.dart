import 'circle.dart';
import 'haf_circle.dart';
import 'horizontal_bar.dart';
import 'rectangle.dart';

final obstacles = {
  0: const RectangleObstacle(),
  1: const CircleObstacle(),
  2: const HalfCircle(),
  3: const HorizontalBar()
};

bool isCollide(
    {required int index,
    required double ballYAxis,
    required double obstacleY,
    required double ballXAxis,
    required double obstacleX}) {
  switch (index) {
    case 0:
      return isRectangleCollide(
          ballXAxis: ballXAxis,
          ballYAxis: ballYAxis,
          obstacleX: obstacleX,
          obstacleY: obstacleY);
    case 1:
      return isCircleCollide(
          ballXAxis: ballXAxis,
          ballYAxis: ballYAxis,
          obstacleX: obstacleX,
          obstacleY: obstacleY);
    case 2:
      return isHalfCircleCollide(
          ballXAxis: ballXAxis,
          ballYAxis: ballYAxis,
          obstacleX: obstacleX,
          obstacleY: obstacleY);
    case 3:
      return isBarCollide(
          ballXAxis: ballXAxis,
          ballYAxis: ballYAxis,
          obstacleX: obstacleX,
          obstacleY: obstacleY);
    default:
      return false;
  }
}

double abs(double value) {
  if (value < 0) {
    return (-1 * value);
  } else {
    return value;
  }
}

bool isRectangleCollide(
    {required double ballYAxis,
    required double obstacleY,
    required double ballXAxis,
    required double obstacleX}) {
  if (abs(ballYAxis - obstacleY) < 0.15 && abs(ballXAxis - obstacleX) < 0.6) {
    return true;
  } else {
    return false;
  }
}

bool isCircleCollide(
    {required double ballYAxis,
    required double obstacleY,
    required double ballXAxis,
    required double obstacleX}) {
  if (abs(ballYAxis - obstacleY) < 0.15 && abs(ballXAxis - obstacleX) < 0.45) {
    return true;
  } else {
    return false;
  }
}

bool isHalfCircleCollide(
    {required double ballYAxis,
    required double obstacleY,
    required double ballXAxis,
    required double obstacleX}) {
  if (abs(ballYAxis - obstacleY) < 0.15 && abs(ballXAxis - obstacleX) < 0.5) {
    return true;
  } else {
    return false;
  }
}

bool isBarCollide(
    {required double ballYAxis,
    required double obstacleY,
    required double ballXAxis,
    required double obstacleX}) {
  if (abs(ballYAxis - obstacleY) < 0.15 && abs(ballXAxis - obstacleX) < 0.95) {
    return true;
  } else {
    return false;
  }
}
