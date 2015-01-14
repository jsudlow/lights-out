import sdl, graphics, colors

import hoversystem, clicksystem, controller

proc hasPlayerWon*(self: ref GameScene): bool =
    var x = self.grid    
    for i in low(x)..high(x):    
        if(x[i]):    
            return false   
    return true
 
method enter*(self: ref GameScene) =
  self.hoverSystem = newHoverSystem(self)
  self.clickSystem = newClickSystem(self)
  randomGridWalk(self)

method update*(self: ref GameScene, t, dt: int) =
  self.hoverSystem.update(t, dt)
  var hasWon = self.hasPlayerWon()
  self.hasWon = hasWon

method mouse_down*(self: ref GameScene, event: PMouseButtonEvent) =
  self.clickSystem.mouse_down(event)

method draw*(self: ref GameScene) =
  # clear screen
  let screen_rect = graphics.TRect(
    (0, 0, self.ctl.display.w, self.ctl.display.h))
  self.ctl.display.fillRect(screen_rect, colBlack)

  for i in 0..NUM_SQUARES - 1:
    for k in 0..NUM_SQUARES - 1:
      var color = SQUARE_COLOR
      if self.hoverSystem.i == i and self.hoverSystem.k == k:
        color = SQUARE_HIGHLIGHT
      if self.grid[(k * NUM_SQUARES) + i]:
        color = SQUARE_HIGHLIGHT
      if (self.hasWon):
        color = WIN_COLOR

      let
        x = i * int(SQUARE_SIZE)
        y = k * int(SQUARE_SIZE)
        xoff = x + SQUARE_MARGIN
        yoff = y + SQUARE_MARGIN
        rect = graphics.TRect(
          (xoff, yoff, int(SQUARE_BODY), int(SQUARE_BODY)))

      self.ctl.display.fillRect(rect, color)