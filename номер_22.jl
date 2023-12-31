using HorizonSideRobots
r = Robot(animate = true) 

function nazad(r::Robot, side::HorizonSide, shag::Int64, o::Bool)
    if !isborder(r,side)
        try_move!(r,side)
        shag += 1
        shag += nazad(r, side, shag, o)
        return shag
    else 
        for i in 1:shag*2
            if try_move!(r, inverse(side))
            else
                o = false
                move!(r, side, shag - 1)
                return 0
            end
        end
        return 0
    end
    return otvet
end

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

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