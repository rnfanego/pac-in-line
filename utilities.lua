--alternate between 
--0(+plus) and range(+plus) 
--speed:accelerate the timer 
function alternate(plus,speed,range)
	return flr(time()*speed % range)+plus
end

--int rnd value between x and y
function irndb(x,y)
	value=flr(rnd(y-x))
	return value+x
end
