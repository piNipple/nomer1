using HorizonSideRobots
r=Robot(animate=true)

function perimetr!(r)
    # считает колво шагов до спавна
    n1, n2 = spavn!(r, Sud, West)
    # делает периметр
    perim!(r)
    # возвращается в исходное положение
    nm!(r, Nord, n1)
    nm!(r, Ost, n2)
end

# периметр, который надо начинать с юз
function perim!(r)
    for s in [Nord, Ost, Sud, West]
        while ! isborder(r, s)
            move!(r, s)
            putmarker!(r)
        end
    end
end

# ведет робота по колву шагов в заданном направлении
function nm!(r, s, n)
    for i in 1:n
        move!(r, s)
    end
end

# считает колво шагов до угла и приводит робота туда
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