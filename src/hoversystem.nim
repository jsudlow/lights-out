import game

proc newHoverSystem*(scene: ref GameScene): ref HoverSystem =
  result = new HoverSystem
  result.scene = scene
  result.i = 0
  result.k = 0

proc update*(self: ref HoverSystem, t, dt: int) =
  for i in 0..NUM_SQUARES - 1:
    for k in 0..NUM_SQUARES - 1:
      let
        x = i * int(SQUARE_SIZE)
        y = k * int(SQUARE_SIZE)
        mx = self.scene.ctl.mouseX
        my = self.scene.ctl.mouseY
        hover_x = mx >= x and mx <= x + int(SQUARE_SIZE) - 1
        hover_y = my >= y and my <= y + int(SQUARE_SIZE) - 1

      if hover_x and hover_y:
        self.i = i
        self.k = k