Условия задач
1. ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.
2. ДАНО: Робот - в произвольной клетке поля (без внутренних перегородок и маркеров)
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки по периметру внешней рамки промаркированы.
3. ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промаркированы.
4. ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре косого креста из маркеров, расставленных вплоть до внешней рамки.
5. ДАНО: На ограниченном внешней прямоугольной рамкой поле имеется ровно одна внутренняя перегородка в форме прямоугольника. Робот - в произвольной клетке поля между внешней и внутренней перегородками.
РЕЗУЛЬТАТ: Робот - в исходном положении и по всему периметру внутренней, как внутренней, так и внешней, перегородки поставлены маркеры.
6. ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние прямоугольные перегородки (все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки)
РЕЗУЛЬТАТ: Робот - в исходном положении и -
a) по всему периметру внешней рамки стоят маркеры;
б) маркеры не во всех клетках периметра, а только в 4-х позициях - напротив исходного положения робота.
7. ДАНО: Робот - рядом с горизонтальной бесконечно продолжающейся в обе стороны перегородкой (под ней), в которой имеется проход шириной в одну клетку.
РЕЗУЛЬТАТ: Робот - в клетке под проходом
8. ДАНО: Где-то на неограниченном со всех сторон поле без внутренних перегородок имеется единственный маркер. Робот - в произвольной клетке этого поля.
РЕЗУЛЬТАТ: Робот - в клетке с маркером.
9. ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля (без внутренних перегородок)
РЕЗУЛЬТАТ: Робот - в исходном положении, на всем поле расставлены маркеры в шахматном порядке, причем так, чтобы в клетке с роботом находился маркер
10. ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля (без внутренних перегородок)
РЕЗУЛЬТАТ: Робот - в исходном положении, и на всем поле расставлены маркеры в шахматном порядке клетками размера N*N (N-параметр функции), начиная с юго-западного угла
11. ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля, на поле расставлены горизонтальные перегородки различной длины (перегородки длиной в несколько клеток, считаются одной перегородкой), не касающиеся внешней рамки.
РЕЗУЛЬТАТ: Робот — в исходном положении, подсчитано и возвращено число всех перегородок на поле.
12. Отличается от предыдущей задачи тем, что если в перегородке имеются разрывы не более одной клетки каждый, то такая перегородка считается одной перегородкой.
13. Решить задачу 9 с использованием обобщённой функции
snake!(robot,
(move_side, next_row_side)::NTuple{2,HorizonSide} =
(Ost,Nord))
14. Решить предыдущую задачу, но при условии наличия на поле простых внутренних перегородок.
Под простыми перегородками мы понимаем изолированные прямолинейные или прямоугольные перегородки.
15. Решить задачу 4, но при условии наличия на поле простых внутренних перегородок.
16. Решить задачу 7 с использованием обобщённой функции
shuttle!(stop_condition::Function, robot, side)
17. Решить задачу 8 с использованием обобщённой функции
spiral!(stop_condition::Function, robot)
18. Решить предыдущую задачу, но при дополнительном условии:
а) на поле имеются внутренние изолированные прямолинейные перегородки конечной длины (только прямолинейных, прямоугольных перегородок нет);
б) некоторые из прямолинейных перегородок могут быть полубесконечными.
19. Написать рекурсивную функцию, перемещающую робота до упора в заданном направлении.
20. Написать рекурсивную функцию, перемещающую робота до упора в заданном направлении, ставящую возле перегородки маркер и возвращающую робота в исходное положение.
21. Написать рекурсивную функцию, перемещающую робота в соседнюю клетку в заданном направлении, при этом на пути робота может находиться изолированная прямолинейная перегородка конечной длины.
22. Написать рекурсивную функцию, перемещающую робота на расстояние вдвое большее исходного расстояния от перегородки, находящейся с заданного направления (предполагается, что размеры поля позволяют это сделать).
Доработать эту функцию таким образом, чтобы она возвращала значение true, в случае, если размеры поля позволяют удвоить расстояние, или - значение false, в противном случае (в этом случае робот должен быть перемещен на максимально возможное расстояние).
Как при этом можно было бы сделать так, чтобы в случае невозможности переместить робота на удвоенное расстояние, в результате робот оставался бы в исходном положении?
23. Написать рекурсивную функцию, перемещающую робота в позицию, симметричную по отношению к перегородке, находящейся с заданного направления, т.е. требуется, чтобы в результате робот оказался на расстоянии от противоположной перегородки равном расстоянию до заданной перегородки.
24. Написать рекурсивную функцию, перемещающую робота на расстояние от перегородки с заданного направления вдвое меньшее исходного.
Указание: воспользоваться косвенной рекурсией.
25. Написать рекурсивную функцию, перемещающую робота в заданном направлении до упора и расставляющую маркеры в шахматном порядке,
a) начиная с установки маркера;
б) начиная без установки маркера (в стартовой клетке).
Указание: воспользоваться косвенной рекурсией
26. Написать функцию, маркирующую все клетки лабиринта произвольной формы, ограниченного перегородками, и возвращающую робота в исходное положение.
