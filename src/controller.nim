import graphics, tables, sdl

proc newController*(display: graphics.PSurface): ref Controller =
  result = new(Controller)
  result.display = display
  result.should_close = false
  result.keys = initTable[Tkey, bool]()
  result.mods = initTable[TMod, bool]()

proc close*(self: ref Controller) =
  self.should_close = true

proc closing*(self: ref Controller): bool =
  result = self.should_close

proc hasPlayerWon*(self: ref Controller): bool =
    var x = self.grid
    for i in low(x)..high(x):
        if(x[i]):
            return false
    return true

