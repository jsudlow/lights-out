import graphics
type
  MessageBox* = object
      messageText*: string
      x*,y*,size*: int
      font*: PFont
      s*: graphics.PSurface
      isVisible*: bool
proc newMessageBox*(messageText: string, x, y: int, font: PFont ): ref MessageBox =
  let
    textSize = textBounds(messageText, font)

  result = new MessageBox
  result.messageText = messageText
  result.s = newSurface(textSize.width, textSize.height)
  result.s.drawText((x:0,y:0),messageText,font)
  result.x = x
  result.y = y
  result.isVisible = false


proc draw*(self: ref MessageBox, target: PSurface) =
    if(self.isVisible): 
      target.blit(
          (x: self.x, y: self.y, width: target.w, height: target.h),
          self.s, (x:0, y:0, width: self.s.w, height: self.s.h)
      )