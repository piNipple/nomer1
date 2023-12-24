using HorizonSideRobots
rob = Robot(animate = true) 

function spiral!(r)
    s = Ost
    n = 1
    while !ismarker(r)
        s = povorot(s)
        stroka!(r, s, n)
        n += 1
    end
end

function stroka!(r, s, n)
    t = 1
    while t < n
        teleport(r, s, 0)
        t += 1
    end
end

function teleport(r::Robot, side::HorizonSide, steps::Int)
    ort = povorot(side)
    t = try_move!(r, side)
    if t == 4
        return 0
    elseif t
        nm!(r, inverse(ort), steps)
    else
        if isborder(r, side)
            move!(r, ort)
            steps += 1
            x = teleport(r, side, steps)
            steps += x
            return steps
        end
    end
    return 0
end

function try_move!(r, side)
    if ismarker(r)
        return 4
    end
    if !isborder(r, side) 
        move!(r, side)
        return true
    else 
        return false
    end
end

function nm!(r, side, n)
    for i in 1:n
        try_move!(r, side)
    end
end

function inverse(s)
    return HorizonSide(mod(Int(s) + 2, 4))
end

povorot(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))