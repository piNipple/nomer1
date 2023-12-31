using HorizonSideRobots
r=Robot(animate=true)

function final!(r)
    n1, n2 =spavn!(r,Sud,West)
    spavn!(r,Sud,West)
    permax!(r)
    permin!(r)
    spavn!(r,Sud,West)
    nm!(r,Nord,n1)
    nm!(r,Ost,n2)
end

# закаршивает маленькую рамку
function permin!(r)
    # находим границу
    s=gran!(r)
    if s==Ost
        for i in [Ost,Nord,West,Sud]
            putmarker!(r)
            i1=protivchas(i)
            while isborder(r,i1)
                move!(r,i)
                putmarker!(r)
            end
            move!(r,i1)
        end
    else
        for i in [West,Nord,Ost,Sud]
            putmarker!(r)
            i1=pochas(i)
            while isborder(r,i1)
                move!(r,i)
                putmarker!(r)
            end
            move!(r,i1)
        end
    end
end

# мы дошли так чтобы сверху была граница
# и возвращаем направление движения
function gran!(r)
    s=Ost 
    while fr!(r,s)==0
        move!(r,Nord)
        s=inverse(s)
    end
    return s
end

pochas(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)-1,4))
protivchas(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+1,4))
inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

# дошли до предела нужной стороны 
# и вернули есть ли значение сверху
function fr!(r,s)
    # пока нет граинцы на севере
    # и нет границы на стороне куда идем
    while ! isborder(r,Nord) && ! isborder(r,s)
    # двигаем в эту сторону    
        move!(r,s)
    end
    # когда дошел до граинцы в заданной стороне
    # возвращает есть ли границы наверху
    # true = есть граница нверху
    # false = нету граниы наверху
    return isborder(r,Nord)
end

# закрашивает периметр
function permax!(r)
    # возвращается в исходне положение
    n1, n2 = spavn!(r, Sud, West)
    spavn!(r,Sud,West)
    for s in [Ost,Nord,West,Sud]
        while ! isborder(r,s)
            move!(r,s)
            putmarker!(r)
        end
    end
    nm!(r,Nord,n1)
    nm!(r,Ost,n2)
end

# ведет робота по колву шагов в направлении
function nm!(r, s, n)
    for i in 1:n
        move!(r, s)
    end
end

# считает колво шагов до угла и приводит робота туда
function spavn!(r, s1, s2)
    n1, n2, =  0, 0
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