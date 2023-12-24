using HorizonSideRobots
robot = Robot(animate=true) 

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

function final!(robot)
    prig = tochki!(robot)
    while ! isborder(robot,Sud)
        move!(robot,Sud)
    end
    while ! isborder(robot,West)
        move!(robot,West)
    end
    spavn_obratno!(robot, Nord, Ost, prig)
end


# стаивт точку напротив из юз
function tochki!(robot)
    # колво клеток надо дойти от юз и путь в виде строки
    prig, m1, m2 = spavn_tuda!(robot,Sud,West)
    # колво клеток всего
    idet!(robot,Nord,m1)
    idet!(robot,Ost,m2)
    num1, num2 = kolvo_kletok!(robot,Nord,Ost)
    tochka_no!(robot,num1,m1,num2,m2)
    return prig
end

# идет в северо восток и ставит точки
function tochka_no!(robot,num1,m1,num2,m2)
    while ! isborder(robot,Nord)
        move!(robot,Nord)
    end
    while ! isborder(robot,Ost)
        move!(robot,Ost)
    end
    t1=num1-m1-1
    t2=num2-m2-1
    # колво клеток всего
    idet!(robot,Sud,t1)
    idet!(robot,West,t2)
end

# ф-ия ставит точки
function idet!(robot,side,n)
    nm!(robot,side,n)
    putmarker!(robot)
    s1=inverse(side)
    nm!(robot,s1,n)
end

# идет в сторону n раз
function nm!(robot, side, n)
    for i in 1:n
        move!(robot, side)
    end
end

# запись пути до юз угла в виде строки
function spavn_tuda!(robot, side1, side2)
    prig = ""
    m1=0
    m2=0
    while !(isborder(robot, side1) & isborder(robot, side2))
        # если нет граинцы на s1 то туда и 0
        if ! isborder(robot, side1)
            move!(robot, side1)
            prig = prig * "0" 
            m1+=1
        end    
        # если нет граинцы на s2 то туда и 1
        if ! isborder(robot, side2)
            move!(robot, side2) 
            prig = prig * "1"
            m2+=1
        end  
    end 
    # возвращаем путь в виде строки
    return prig, m1, m2
end

# счиатет колво клеток по сторонам
# num1 по горизонтали - num2 по вертикали
function kolvo_kletok!(robot,side1,side2)
    num1=1
    while ! isborder(robot,side1)
        move!(robot,side1)
        num1+=1
    end
    s1=inverse(side1)
    while ! isborder(robot,s1)
        move!(robot,s1)
    end
    num2=1
    while ! isborder(robot,side2)
        move!(robot,side2)
        num2+=1
    end
    s2=inverse(side2)
    while ! isborder(robot,s2)
        move!(robot,s2)
    end
    return num1, num2
end

# идет обратно на старт
function spavn_obratno!(robot, side1, side2, prig::String)
    prig = reverse(prig)
    for move in prig
        if move == '0'
            move!(robot, side1)
        else
            move!(robot, side2)
        end
    end
end