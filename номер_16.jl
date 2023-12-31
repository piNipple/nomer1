using HorizonSideRobots
r = Robot(animate = true)


function shuttle!(condition, r)
    n = 1
    s = Ost
    # если не выполняется условие
    while !condition()
        # то идем в сторону на шаги при условии
        nmove!(condition, r, s, n)
        n += 1
        s = inverse(s)
        # добавляем шаги и меняем сторону
    end
end

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

# шаги по колву в направлении и при условии
function nmove!(condition, r, side, n)
    for i in 1:n
        if !condition()
            try_move!(condition, r, side)
        end
    end
end

# попытка сделать шаги
function try_move!(condition, r, side)
    if !condition()     
        move!(r, side)   
    end
end

shuttle!(() -> !isborder(r, Nord), r)