using HorizonSideRobots
r = Robot(animate=true)

function final!(r)
    # приводим робота в юз и считаем шаги
    n1, n2 = spavn!(r,Sud,West)
    spavn!(r,Sud,West)
    zakr!(r)
    nm!(r,Nord,n1)
    nm!(r,Ost,n2)
    return n1, n2
end

# ведет в югозапад и считает колво шагов до туда
function spavn!(r, s1, s2)
    n1, n2 =  0, 0
    while ! isborder(r, s1)
        move!(r, s1)
        n1 += 1
    end
    while ! isborder(r, s2)
        move!(r, s2)
        n2 += 1
    end
    return n1, n2
end

# ведет на опред колво шагов в опред сторону
function nm!(r, s, n)
    for _ in 1:n
        move!(r, s)
    end
end

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

function zakr!(r)
    putmarker!(r)
    side=Ost # право
    # пока не дошли до севера
    while fr!(r,side)==false
        # прошли в заданную сторону до границы
        # пока нет границы наверху
        # идем наверх и ставим маркер
        move!(r,Nord)
        putmarker!(r)
        side=inverse(side)
        # меняем сторону на противоположное значение
        # и выполняем цикл заново 
        # пока не дойдем до северозапада
    end
    # мы теперь в северозападе
    while ! isborder(r,Ost)
        move!(r,Ost)
        putmarker!(r)
    end
    # надо вернуться в юз чтоб прийтив  исходное положение
    while ! isborder(r,Sud)
        move!(r,Sud)
    end
    while ! isborder(r,West)
        move!(r,West)
    end
    # возваращет в исх положение
end

# ищет границу в заданной стороне
function fr!(r,side)
    # пока нет граинцы на севере
    # и нет границы на стороне куда идем
    while ! isborder(r,Nord) && ! isborder(r,side)
    # двигаем в эту сторону    
        move!(r,side)
        putmarker!(r)
    end
    # когда дошел до граинцы в заданной стороне
    # возвращает есть ли границы наверху
    # true = есть граница нверху
    # false = нету граниы наверху
    return isborder(r,Nord)
end