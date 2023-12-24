using HorizonSideRobots
r = Robot(animate=true) 

function chess!(r)
    x, y = na_sw!(r, Sud, West)
    if mod(x, 2) == mod(y, 2)
        putmarker!(r)
    end
    snake!(() -> isborder(r, Nord),r, Ost, Nord)
    na_sw!(r, Sud, West)
    nm!(r, Nord, x)
    nm!(r, Ost, y)
end

function snake!(condition, r, t, osn)
    while !condition()
        linia!(() -> isborder(r, t), r, t)
        if ismarker(r)
            move!(r, osn)
        else
            move!(r, osn)
            putmarker!(r)
        end
        t = inverse(t)
    end
    linia!(() -> isborder(r, t), r, t)
end

function linia!(condition, r, s)
    if !ismarker(r)
        move!(r, s)
        putmarker!(r)
    else
        f = 1
    end
    f = 0
    while !condition()
        move!(r, s)
        f = stav!(r, f)
    end
end

function stav!(r, f)
    if f == 1
        putmarker!(r)
        f = 0
    else
        f = 1
    end
    return f
end

function na_sw!(r, side1, side2)
    n1 = numsteps_along!(() -> isborder(r, side1), r, side1)
    n2 = numsteps_along!(() -> isborder(r, side2), r, side2)
    return n1, n2
end

function numsteps_along!(condition, r, side)
    n = 0
    while !condition()
        move!(r, side)
        n += 1
    end
    return n
end

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

function nm!(r, side, n)
    for i in 1:n
        move!(r, side)
    end
end