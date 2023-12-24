using HorizonSideRobots
r = Robot(animate = true)

left(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+1,4))

function findmark!(r)
    side = Ost
    shag = 1
    # пока нет маркера 
    while  ! ismarker(r)
        # повторить 2 раза
        for i in 1:2
            # двигаемся в сторону на колво шагов 
            mov!(robot, side, shag)
            # поворачиваем налево
            side = left(side)
        end
        # прибавляем шаг один
        shag += 1
    end
end

# робот двигается в сторону на опред колво шагов
function mov!(robot, side, num)
    # по колву шагов
    # если нет маркера то двигается в ту сторону
    for i in 1:num
        if !ismarker(robot)
            move!(robot, side)
        end
    end
end