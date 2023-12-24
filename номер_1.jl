using HorizonSideRobots
r=Robot(animate=true)

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

# функиця проходится по всем сторонам света
# и если нет границы то идем в ту сторону и ставим маркер
function krest!(r)
  for s in [Nord, Ost, Sud, West]
    while ! isborder(r,s)
      move!(r,s)
      putmarker!(r)
    end
    # когда дошли до конца то меняем сторону
    # идем обратно если есть маркер
    s1=inverse(s)
    while ismarker(r)
      move!(r,s1)
    end
  end
  # ставим маркер в середине
  putmarker!(r)
end