using HorizonSideRobots
rob = Robot(animate = true)

function spiral!(condition, robot)
    side = Ost
    shag = 1
    while !condition()
        for i in 1:2
            nmove!(condition, robot, side, shag)
            side = povorot(side)
        end
        shag += 1
    end
end

# поворот
right(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+1,4))

function try_move!(condition, robot, side)
    if !condition()     
        move!(robot, side)
    end
end

function nmove!(condition::Function, robot::Robot, side::HorizonSide, num::Integer)
    for i in 1:num
        try_move!(condition, robot, side)
    end
end

spiral!(() -> ismarker(rob), rob)