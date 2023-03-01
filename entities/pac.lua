pac = object:new({
    x=24,
	y=52,
    spr=1,
	sprplus=1,

    init = function(self)
        
    end,

    update = function(self)
        spr=alternate(sprplus, sprspeed, 2)
	end,

	draw = function(self)
        spr(spr,x,y)
	end,

    collide = function(self, t)
        if (self.y == t.y and 
            t.x >= (self.x-t.w) and 
            t.x < (self.x+t.w)) then
            return true
	    end
	    return false
    end,

    moveUp = function(self)
        self.y = max(0,self.y-8) 
		self.sprplus = 1 
    end,

    moveDown = function(self)
        self.y = min(120,self.y+8) 
		self.sprplus = 1
    end
})