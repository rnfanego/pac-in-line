pattern = object:new({
    things = {},
    init = function(self)
        r = irndb(1,5)
        self:create(compositions[r])
	end,

	update = function(self)
	end,

    create = function(self, composition)
        blueprint = composition.blueprint
        for i=1,#blueprint do
            c = blueprint[i]

            for e in all(c.elements) do
                if(e == "pill") then
                    add(things, pill.create(127,c.y))
                end

                if(e == "ghost") then
                    add(things, pill.create(127,c.y))
                end
            end
        end
    end
})

keys = {"E11", "E12", "E13"}

compositions = {
    {
        name = "E11",
        blueprint = {
            {
                y = row1y,
                elements = {"pill","pill","pill","pill","ghost"}
            }
        }
    },
    {
        name = "E12",
        blueprint = {
            {
                y = row2y,
                elements = {"pill","pill","pill","pill","ghost"}
            }
        }
    },
    {
        name = "E13",
        blueprint = {
            {
                y = row2y,
                elements = {"pill","pill","pill","pill","ghost"}
            }
        }
    }
}