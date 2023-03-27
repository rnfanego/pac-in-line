pattern = object:new({
    init = function(self)
        self.things = {}
        self:initialize()
	end,

    create = function()
        return pattern.createWithPattern(patterns_definitions[rnd(patterns_keys)])
    end,

    createWithPattern = function(patternDefinition)
        local p = pattern:new({patternDefinition=patternDefinition})
        p:init()
        return p
    end,

    initialize = function(self)
        local elements = self.patternDefinition.elements
        for i=1,#elements do
            local es = elements[i]
            --printh("composition elements"..#b.elements,"pac_in_line/log")
            local aux = {}
            for e in all(es) do
                if(e[1] == "pill") then
                    aux[e[2]]=pill.create(127.0,e[2])
                end

                if(e[1] == "magicpill") then
                    aux[e[2]]=magicpill.create(127.0,e[2])
                end

                if(e[1] == "red") then
                    aux[e[2]]=red.create(127.0,e[2])
                end

                if(e[1] == "pinky_up") then
                    aux[e[2]]=pinky.create(127.0,e[2],true)
                end

                if(e[1] == "pinky_down") then
                    aux[e[2]]=pinky.create(127.0,e[2],false)
                end

                if (e[1] == "empty") then
                    aux[e[2]]=empty.create(127.0,e[2])
                end
            end

            add(self.things, aux)
        end
    end,

    get_thing = function(self)
        if (count(self.things)==0)then
            return nil
        end
        local t = self.things[1]
        deli(self.things,1)
        return t
    end,

    is_empty = function(self)
        return count(self.things) == 0
    end,
})

local function e1(r,name)
    return {
        name = name,
        elements = {
            {{"pill", r}},
            {{"pill", r}},
            {{"pill", r}},
            {{"pill", r}},
            {{"red", r}}
        }
    }
end

local function e2(r1,r2,name)
    return {
        name = name,
        elements = {
            {{"pill", r1}},
            {{"pill", r1}},
            {{"red", r1},{"pill", r2}},
            {{"pill", r1},{"pill", r2}},
            {{"pill", r1},{"red", r2}}
        }
    }
end

local function e3(r1,name)
    return {
        name = name,
        elements = {
            {{"pill", r1}},
            {{"pill", r1}},
            {{"pill", rows.r2},{"red", r1}},
            {{"pill", rows.r1},{"pill", rows.r2},{"pill", rows.r3}},
            {{"red", rows.r1},{"pill", rows.r2},{"red", rows.r3}}
        }
    }
end

local function f1(e1,e2,e3,name)
    return {
        name = name,
        elements = {
            {{e1, rows.r1},{e2, rows.r2},{e3, rows.r3}}
        }
    }
end

local function g1(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"pill", r}},
            {{"pill", r}},
            {{"pill", r}},
            {{"red", r}}
        }
    }
end

local function c1(r,t,name)
    return {
        name = name,
        elements = {
            {{t, r}},
            {{t, r}},
            {{t, r}},
            {{t, r}},
            {{t, r}}
        }
    }
end

local function b1(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"pill", r}},
            {{"red", r}},
            {{"red", r}},
            {{"red", r}}
        }
    }
end

local function b2(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"red", r}},
            {{"red", r}},
            {{"pill", r}},
            {{"red", r}}
        }
    }
end

local function a1(r,name)
    return {
        name = name,
        elements = {
            {{"red", r}},
            {{"red", r}},
            {{"pill", r}},
            {{"red", r}},
            {{"red", r}}
        }
    }
end

local function h1(r1,r2,p,name)
    return {
        name = name,
        elements = {
            {{"pill", r1}},
            {{"pill", r1}},
            {{"pill", r1}},
            {{p, r2}},
            {{"pill", r1}}
        }
    }
end

local function i1(r1,r2,r3,p,name)
    return {
        name = name,
        elements = {
            {{"red", r1},{"red", r2},{"pill", r3}},
            {{"red", r1},{"pill", r2},{"pill", r3}},
            {{"magicpill", r1},{"pill", r2}},
            {{"red", r1},{p, r3}},
            {{"red", r1},{"pill", r2},{"pill", r3}}
        }
    }
end

local function e2(r1,r2,name)
    return {
        name = name,
        elements = {
            {{"pill", r1}},
            {{"pill", r1}},
            {{"red", r1},{"pill", r2}},
            {{"pill", r1},{"pill", r2}},
            {{"pill", r1},{"red", r2}}
        }
    }
end

rows = {
    r1=52,
	r2=60,
	r3=68,
}

superblocks={
    SB11={
        blocks={"B4","B5"},
        spaces=1
    },
    SB12={
        blocks={"B13","B11"},
        spaces=1
    },
    SB13={
        blocks={"B14","B12"},
        spaces=1
    },
    SB21={
        blocks={"B16","B17"},
        spaces=1
    },
    SB22={
        blocks={"B20","B19","B18"},
        spaces=1
    },
    SB23={
        blocks={"B3","B2"},
        spaces=1
    },
    SB24={
        blocks={"B10","B9"},
        spaces=1
    },
    SBC1={
        blocks={"BC1"},
        spaces=1
    },
    SBC2={
        blocks={"BC2"},
        spaces=1
    }
}

--{{},{},{},{},{}}

blocks = {
    B1={{"G13"},{"C11"},{"G12"},{},{}},
    B2={{"F12"},{"EMPTY_COL"},{"F11"},{"EMPTY_COL"},{"F13"}},
    B3={{"G11","C13"},{},{"G12"},{},{}},
    B4={{"E12"},{},{},{"E11"},{}},
    B5={{"E13"},{},{},{"E12"},{}},
    B6={{"B22"},{},{"E11"},{},{}},
    B7={{"E13"},{},{"B12"},{},{}},
    B8={{"E11"},{},{"B12"},{},{}},
    B9={{"F13"},{"EMPTY_COL"},{"F13"},{"EMPTY_COL"},{"F31"}},
    B10={{"B22"},{},{"E11"},{},{"C13"}},
    B11={{"F13"},{"EMPTY_COL"},{"E12"},{},{"G13"}},
    B12={{"E11"},{"C13"},{},{"E12"},{}},
    B13={{"C22"},{},{},{},{"E11"}},
    B14={{"C23"},{},{},{},{"E12"}},
    B15={{"C22"},{},{},{},{"E13"}},
    B16={{"E22"},{"G11"},{},{},{}},
    B17={{"E31"},{},{},{},{}},
    B18={{"B23"},{},{"E32"},{},{}},
    B19={{"G12"},{},{},{"H12"},{"C11"}},
    B20={{"F13"},{"EMPTY_COL"},{"F11"},{"EMPTY_COL"},{"H11","G13"}},
    BC1={{"C11","C22","C13"},{},{},{},{}},
    BC2={{"B11","C22","B23"},{},{},{},{}}
}

patterns_keys={"I11","I12","H11","H12","A11","A12","A13","B21","B22","B23",
                   "B11","B12","B13","C11","C12","C13","G11","G12","G13",
                   "EMPTY_COL","F21","F22","F23","F11","F12","F13","E11","E12",
                   "E13","E21","E31","E32"}

patterns_definitions = {
    I11=i1(rows.r1,rows.r2,rows.r3, "pinky_up","I11"),
    I12=i1(rows.r3,rows.r2,rows.r1, "pinky_down","I12"),
    H11=h1(rows.r1,rows.r2, "pinky_up","H11"),
    H12=h1(rows.r3,rows.r2, "pinky_down","H12"),
    A11=a1(rows.r1, "A11"),
    A12=a1(rows.r2, "A12"),
    A13=a1(rows.r3, "A13"),
    B21=b2(rows.r1, "B21"),
    B22=b2(rows.r2, "B22"),
    B23=b2(rows.r3, "B23"),
    B11=b1(rows.r1, "B11"),
    B12=b1(rows.r2, "B12"),
    B13=b1(rows.r3, "B13"),
    C11=c1(rows.r1, "red", "C11"),
    C12=c1(rows.r2, "red", "C12"),
    C13=c1(rows.r3, "red", "C13"),
    C21=c1(rows.r1, "pill", "C21"),
    C22=c1(rows.r2, "pill", "C22"),
    C23=c1(rows.r3, "pill", "C23"),
    G11=g1(rows.r1, "G11"),
    G12=g1(rows.r2, "G12"),
    G13=g1(rows.r3, "G13"),
    EMPTY_COL=f1("empty","empty","empty","EMPTY_COL"),
    F31=f1("magicpill","red","pill","F31"),
    F32=f1("pill","red","magicpill","F32"),
    F21=f1("magicpill","red","red","F21"),
    F22=f1("red","magicpill","red","F22"),
    F23=f1("red","red","magicpill","F23"),
    F11=f1("pill","red","red","F11"),
    F12=f1("red","pill","red","F12"),
    F13=f1("red","red","pill","F13"),
    E11=e1(rows.r1, "E11"),
    E12=e1(rows.r2, "E12"),
    E13=e1(rows.r3, "E13"),
    E21=e2(rows.r1,rows.r2, "E21"),
    E22=e2(rows.r3,rows.r2, "E22"),
    E31=e3(rows.r3, "E31"),
    E32=e3(rows.r1, "E32")
}