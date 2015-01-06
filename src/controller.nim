import graphics, tables, sdl,colors,messagebox

proc newController*(display: graphics.PSurface): ref Controller =
  result = new(Controller)
  result.messages = newSeq[ref MessageBox]()
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

proc newFont*(self: ref Controller, name, fontfile: string, size = 18, color = colWhite) = 
  self.fonts[name] = graphics.newFont(fontfile,size,color)

proc addMessage*(self: ref Controller,msg,name: string, fontName: string, x: int, y: int): ref MessageBox =
  var font = self.fonts[fontName]
  result = newMessageBox(msg,x,y,font)
  self.messages.add(result)



