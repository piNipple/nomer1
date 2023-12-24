using HorizonSideRobots
robot = Robot(animate = true)

function along!(condition, robot, side)
    # пока не выполняется условие идем в сторону
    while !condition()
        move!(robot, side)
        along!(condition, robot, side)
    end
end

along!(() -> isborder(robot, Ost), robot, Ost)