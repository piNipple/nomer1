using HorizonSideRobots
r = Robot(animate = true) 

function teleport(r::Robot, side::HorizonSide, shag::Int = 0)
    ort = povorot(side)
    if try_move!(r, side)
        move!(r, inverse(ort), shag)
    else
        if isborder(r, side)
            move!(r, ort)
            shag += 1
            x = teleport(r, side, shag)
            shag += x
            return shag
        end
    end
    return 0
end

function try_move!(r, side)
    if !isborder(r, side) 
        move!(r, side)
        return true
    else 
        return false
    end
end

function HorizonSideRobots.move!(r::Robot, s::HorizonSide, num::Integer)
    for i in 1:num
        move!(r, s)
    end
end

povorot(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))