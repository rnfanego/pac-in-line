pinky = object:new({
    w=7,
    h=8,
    ghost_type=1,
    init = function(self)
        self.t=ghost_type
        self.initial_y=self.y
        self.frames=1
        if (self.go_up) then
            self.spr=21
            self.spraux=self.spr
            self.sprnext = 37
            self.sprdir = -1
        else
            self.spr=37
            self.spraux=self.spr
            self.sprnext = 21
            self.sprdir = 1            
        end
	end,

	update = function(self)
        self.x-=1
        self.frames+=1
        
        if(self.frames == 25 or self.frames == 55) then
            local buf = self.spraux
            self.spraux = self.sprnext
            self.sprnext = buf
        end

        if(self.frames == 30 or self.frames == 60) then
            self.y = self.y + (8 * self.sprdir)
            self.sprdir *= -1
        end

        if(self.frames == 60) then
            self.frames = 1
        end

        self.spr=alternate(self.spraux, sprspeed, 2)
	end,

	draw = function(self)
        spr(self.spr,self.x,self.y)
	end,

    isScorable = function(self)
        return false
	end,

    isCollisionable = function(self)
        return true
	end,

    getPoints = function(self)
        return 100
    end,

    create = function(x,y,go_up)
        g = pinky:new({x=x,y=y,go_up=go_up})
        g:init()
        return g
    end
})