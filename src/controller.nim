import graphics, tables, sdl

from src/display import Display

type Controller* = object
  display*: graphics.PSurface
  should_close: bool
  keys*: KeyMap
  mods*: ModMap
  mouseX*, mouseY*: int
  mouseDown*: bool
  grid*: array[0..TOTAL_SQUARES - 1, bool]

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
