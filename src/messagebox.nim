import graphics

proc newMessageBox*(messageText:string, x: int, y:int, font: PFont ): ref MessageBox =
  result = new MessageBox
  let  
    textSize = textBounds(messageText,font)
    messageRect = graphics.TRect(( 0, 0, textSize.width, textSize.height))
    
  result.s = newSurface(textSize.width, textSize.height)
  result.s.drawText((x:x,y:y),messageText,font)
  result.x = x
  result.y = y
  result.isVisible = false
  