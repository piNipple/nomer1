using HorizonSideRobots
r=Robot(animate=true)

inverse(side::HorizonSide)::HorizonSide=HorizonSide(mod(Int(side)+2,4))

function find_zero!(r)
    n = 1
    s = Ost
    while isborder(r, Nord)
        nm!(r, s, n)
        n += 1
        s = inverse(s)
    end
end

function nm!(r, s, n)
    for i in 1:n
        if !isborder(r, s)
            move!(r, s)
        end
    end
end