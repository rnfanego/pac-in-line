pattern = object:new({
    row1y=52,
	row2y=60,
	row3y=68,
    init = function(self)
        self.things = {}
        r = irndb(1,#compositions)
        self:initialize(compositions[r])
	end,

    create = function()
        local p = pattern:new({})
        p:init()
        return p
    end,

    initialize = function(self, composition)
        local blueprint = composition.blueprint
        for i=1,#blueprint do
            local b = blueprint[i]
            --printh("composition elements"..#b.elements,"pac_in_line/log")
            for e in all(b.elements) do
                if(e == "pill") then
                    add(self.things, pill.create(127,b.y))
                end

                if(e == "ghost") then
                    add(self.things, ghost.create(127,b.y))
                end
            end
        end
    end,

    get_thing = function(self)
        local t = self.things[1]
        deli(self.things,1)
        return t
    end,

    is_empty = function(self)
        return count(self.things) == 0
    end,

    get_things = function(self)
        return self.things
    end
})

keys = {"E11", "E12", "E13"}

compositions = {
    {
        name = "E11",
        blueprint = {
            {
                y = pattern.row1y,
                elements = {"pill","pill","pill","pill","ghost"}
            }
        }
    },
    {
        name = "E12",
        blueprint = {
            {
                y = pattern.row2y,
                elements = {"pill","pill","pill","pill","ghost"}
            }
        }
    },
    {
        name = "E13",
        blueprint = {
            {
                y = pattern.row3y,
                elements = {"pill","pill","pill","pill","ghost"}
            }
        }
    }
}