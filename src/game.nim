import sdl

import game, hover,

method enter*(self: ref GameScene) =
  self.hoverSystem = newHoverSystem(self)
  self.clickSystem = newClickSystem(self)

method update*(self: ref GameScene, t, dt: int) =
  self.hoverSystem.update(t, dt)
  var hasWon = self.ctl.hasPlayerWon()
  self.hasWon = hasWon

method mouse_down*(self: ref GameScene, event: PMouseButtonEvent) =
  self.clickSystem.mouse_down(event)

method draw*(self: ref GameScene) =
  echo "GameScene.draw"
  # clear screen
  let screen_rect = graphics.TRect(
    (0, 0, self.ctl.display.w, self.ctl.display.h))
  self.ctl.display.fillRect(screen_rect, colBlack)

  for i in 0..NUM_SQUARES - 1:
    for k in 0..NUM_SQUARES - 1:
      var color = SQUARE_COLOR
      if self.hoverSystem.i == i and self.hoverSystem.k == k:
        color = SQUARE_HIGHLIGHT
      if self.ctl.grid[(k * NUM_SQUARES) + i]:
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