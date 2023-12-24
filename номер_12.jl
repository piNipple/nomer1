using HorizonSiderobotots
robot = Robot(animate=true) 

function peregorodki!(robot)
    g, v = k_stene(robot, West), k_stene(robot, Sud)
    if ! isborder(robot, Nord)
        move!(robot, Nord)
    else
        return 0
    end
    m = zmeika(robot)
    k_stene(robot, West)
    k_stene(robot, Sud)
    nmove!(robot, Nord, v)
    nmove!(robot, Ost, g)
    return m
end

function nmove!(robot, side, n)
    for i in 1:n
        move!(robot, side)
    end
end

function zmeika(robot)
    n = 0
    s = Ost
    while !isborder(robot,Nord)
        x = stenki!(robot, s)
        move!(robot, Nord)
        s = inverse(s)
        n += x
    end
    n += stenki!(robot, s)
    return n
end

function stenki_s_dyrkami!(robot, s)
    x = 0
    g = 0
    f = 0
    n = 0
    while ! isborder(r, s)
        n = g
        g = f
        if isborder(r, Sud)
            f = 1
        else
            f = 0
        end
        if  (f == 0) & (g == 0)
            x += n  
        end
        move!(r, s)
    end
    if (f == 1) || (g == 1)
        x += 1
    end
    println(x)
    return x
end

function inverse(s)
    return HorizonSide(mod(Int(s) + 2,4))
end

function k_stene(robot, side)
    n = 0
    while ! isborder(robot, side)
        move!(robot, side)
        n += 1
    end
    return n
end

print(peregorodki!(r))