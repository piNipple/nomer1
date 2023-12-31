using HorizonSideRobots
r = Robot(animate=true)

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

# крест косой
function cross!(r)
    # проходимся по северу и югу
    for i in [Nord, Sud]
        # проходимся по востоку и западу
        for k in [Ost, West]
            # пока нет границы в 2 направлениях, идем туда
            while (! isborder(r,i)) && (! isborder(r,k))
                move!(r,i)
                move!(r,k)
                putmarker!(r)
            end
            # дошли до угла, инвертируем значение
            i=inverse(i)
            k=inverse(k)
            # и идем до исходной точки пока не будет маркера
            while ismarker(r)==1
                move!(r,i)
                move!(r,k)
            end
        end
    end
    putmarker!(r)
end