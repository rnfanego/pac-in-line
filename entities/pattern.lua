pattern = object:new({
    row1y=52,
	row2y=60,
	row3y=68,
    init = function(self)
        self.things = {}
        --r = irndb(1,#compositions)
        --printh("composition elements"..r,"pac_in_line/log")
        self:initialize(rnd(compositions))
	end,

    create = function()
        local p = pattern:new({})
        p:init()
        return p
    end,

    initialize = function(self, composition)
        local elements = composition.elements
        for i=1,#elements do
            local es = elements[i]
            --printh("composition elements"..#b.elements,"pac_in_line/log")
            local aux = {}
            for e in all(es) do
                
                if(e[1] == "pill") then
                    add(aux, pill.create(127,e[2]))
                end

                if(e[1] == "ghost") then
                    add(aux, ghost.create(127,e[2]))
                end

                if (e[1] == "empty") then
                    add(aux, empty.create(127,e[2]))
                end
            end

            add(self.things, aux)
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

compositions = {
    {
        name = "E11",
        elements = {
            {{"pill", pattern.row1y}},
            {{"pill", pattern.row1y}},
            {{"pill", pattern.row1y}},
            {{"pill", pattern.row1y}},
            {{"ghost", pattern.row1y}}
        }
    },
    {
        name = "E12",
        elements = {
            {{"pill", pattern.row2y}},
            {{"pill", pattern.row2y}},
            {{"pill", pattern.row2y}},
            {{"pill", pattern.row2y}},
            {{"ghost", pattern.row2y}}
        }
    },
    {
        name = "E13",
        elements = {
            {{"pill", pattern.row3y}},
            {{"pill", pattern.row3y}},
            {{"pill", pattern.row3y}},
            {{"pill", pattern.row3y}},
            {{"ghost", pattern.row3y}}
        }
    },
    {
        name = "E212",
        elements = {
            {{"pill", pattern.row1y}},
            {{"pill", pattern.row1y}},
            {{"ghost", pattern.row1y},{"pill", pattern.row2y}},
            {{"pill", pattern.row1y},{"pill", pattern.row2y}},
            {{"pill", pattern.row1y},{"ghost", pattern.row2y}}
        }
    }
}