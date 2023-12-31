using HorizonSideRobots
r = Robot(animate=true)

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

function chess!(r)
    a, g = na_sw!(r, Sud, West)
    if mod(a, 2) == mod(g, 2)
        putmarker!(r)
    end
    all!(() -> isborder(r, Nord), r, Ost, Nord)
    na_sw!(r, Sud, West)
    nm!(r, Nord, a)
    nm!(r, Ost, g)
end

function all!(condition, r, t, osn)
    while !condition()
        stroka!(() -> isborder(r, t), r, t)
        if ismarker(r)
            move!(r, osn)
        else
            move!(r, osn)
            putmarker!(r)
        end
        t = inverse(t)
    end
    stroka!(() -> isborder(r, tec),r, t)
end

# ставит / не ставит маркер
function stroka!(condition, r, s)
    # если нет маркера, поставить его
    if !ismarker(r)
        move!(r, s)
        putmarker!(r)
    else
        # если есть маркер то f=1
        f = 1
    end
    f = 0
    # пока не выполняется условие 
    # идет в сторону и решает ставить маркер или нет
    while !condition()
        move!(r, s)
        f = stav!(r, f)
    end
end

# если f=1 то ставит маркера
# если f=0 от заменяет на 0
# возвращает значние f
function stav!(r, f)
    if f == 1
        putmarker!(r)
        f = 0
    else
        f = 1
    end
    return f
end

# ведет на юз, условие - нет границы
function na_sw!(r, side1, side2)
    n1 = numsteps_along!(() -> (! isborder(r, side1)), r, side1)
    n2 = numsteps_along!(() -> (! isborder(r, side2)), r, side2)
    return n1, n2
end

# идет в сторону и считает шаги 
# можно менять условие
function numsteps_along!(condition, r, side)
    n = 0
    while condition()
        move!(r, side)
        n += 1
    end
    return n
end

# ф-ия ходит по колву шагов в нужном направлении
function nm!(r, side, n)
    for i in 1:n
        move!(r, side)
    end
end