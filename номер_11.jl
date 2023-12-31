using HorizonSideRobots
r = Robot(animate=true) 

function final!(r)
    g, v = k_grani(r, West), k_grani(r, Sud)
    if ! isborder(r, Nord)
        move!(r, Nord)
    else
        return 0
    end
    m = zmeika(r)
    k_grani(r, West)
    k_grani(r, Sud)
    nm!(r, Nord, v)
    nm!(r, Ost, g)
    return m
end

function nm!(r, side, n)
    for i in 1:n
        move!(r, side)
    end
end

function zmeika(r)
    n = 0
    s = Ost
    while !isborder(r,Nord)
        x = stenki!(r, s)
        move!(r, Nord)
        s = inverse(s)
        n += x
    end
    n += stenki!(r, s)
    return n
end

function stenki!(r, s)
    x = 0
    f = 0
    while ! isborder(r, s)
        if isborder(r, Sud)
            f = 1
        else
            x += f
            f = 0
        end
        move!(r, s)
    end
    x += f
    return x
end

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

function k_grani(r, side)
    n = 0
    while ! isborder(r, side)
        move!(r, side)
        n += 1
    end
    return n
end