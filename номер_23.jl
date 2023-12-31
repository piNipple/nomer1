using HorizonSideRobots
r = Robot(animate = true) 

function simetria!(r::Robot, side::HorizonSide, shag::Int64)
    if !isborder(r, side)
        try_move2!(r, side)
        shag += 1
        shag += simetria!(r, side, shag)
        return shag
    else
        perem(r, side, 0)
        try_move!(r, side, shag)
        return 0
    end
end

function perem(r::Robot, side::HorizonSide, shag::Int)
    ort = povorot(side)
    # попытка сделать шаги
    if try_move2!(r, side)
        for i in 1:(shag)
            move!(r, inverse(ort))
        end
    else
        # если есть прегеородка
        if isborder(r, side)
            # двигаемся в направлении
            move!(r, ort)
            shag += 1
            x = perem(r, side, shag)
            shag += x
            return shag
        end
    end
    return 0
end

function try_move2!(r, side)
    if !isborder(r, side) 
        move!(r, side)
        return true
    else 
        return false
    end
end

function try_move!(r::Robot, s::HorizonSide, num::Integer)
    for i in 1:num
        try_move!2(r, s)
    end
end

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))
povorot(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+1,4))

simetria!(r, Ost, 0)