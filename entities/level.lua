level = object:new({
    levels={
        {
            name="Level 1",
            speed= 1.0,
            superblocks={"SB1"},
            connector="",
            finishable=true,
            finished_score=100
        },
        {
            name="Level 2",
            speed= 1.2,
            superblocks={"SB1"},
            connector="",
            finishable=true,
            finished_score=100
        }
    },
	init = function(self)
        local l = level.levels[self.number]
        self.name=l.name
        self.speed=l.speed
        self.superblocks = l.superblocks
        self.finishable = l.finishable
        self.finished_score = l.finished_score
	end,

    create = function(number)
        local l = level:new({number=number})
        l:init()
        return l
    end,

    next = function(self)
        if (self.self.finishable) then
            return level.create(self.number+1)
        end
        return self
    end,

    isFinished = function(self,score)
        return self.finishable and score >= self.finished_score
    end,

    getSuperblocks = function(self)
        return self.superblocks
    end,

    getSpeed = function(self)
        return self.speed
    end,

	update = function(self)
	end,

	draw = function(self)
	end
})