using HorizonSideRobots
robot = Robot(animate = true)

function recursion!(robot, side, num_steps)
    # если нет границы то двигаемся и добавляем шаг
    if !isborder(robot, side)
        move!(robot, side)
        num_steps += 1
        # и добавляем шаги дальше
        num_steps += recursion!(robot, side, num_steps)
        return num_steps
    else 
        # когда дошли до границы то ставим маркер
        putmarker!(robot)
        # идем обратно на колво шагов
        nmove!(robot, inverse(side), num_steps)
        return 0
    end
end

function nmove!(robot, side, num)
    for i in 1:num
        move!(robot, side)
    end
end