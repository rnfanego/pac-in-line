empty = object:new({
    init = function(self)
	end,

	update = function(self)
        self.x-=1
	end,

	draw = function(self)
	end,

    isScorable = function(self)
        return false
	end,

    isCollisionable = function(self)
        return false
	end,

    create = function(x,y)
        e = empty:new({x=x,y=y})
        e:init()
        return e
    end
})