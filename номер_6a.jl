using HorizonSideRobots
robot=Robot(animate=true)

function final!(robot)
    prig = spavn_tuda!(robot, Sud, West)
    perimetr!(robot)
    spavn_obratno!(robot, Nord, Ost, prig)
end

# обычная функция периметра
function perimetr!(robot)
    for i in [Nord, Ost, Sud, West]
        while ! isborder(robot, i)
            move!(robot, i)
            putmarker!(robot)
        end
    end
end

# запись пути до юз угла в виде строки
function spavn_tuda!(robot, side1, side2)
    prig = ""
    while !(isborder(robot, side1) & isborder(robot, side2))
        # если нет граинцы на s1 то туда и 0
        if ! isborder(robot, side1)
            move!(robot, side1)
            prig = prig * "0" 
        end    
        # если нет граинцы на s2 то туда и 1
        if ! isborder(robot, side2)
            move!(robot, side2) 
            prig = prig * "1"
        end  
    end 
    # возвращаем путь в виде строки
    return prig
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