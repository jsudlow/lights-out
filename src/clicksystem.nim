import sdl

import game, hoversystem

proc newClickSystem*(scene: ref GameScene): ref ClickSystem =
  result = new ClickSystem
  result.scene = scene

method mouse_down*(self: ref ClickSystem, event: PMouseButtonEvent) =
  let
    scene: ref GameScene = self.scene
    system = scene.hoverSystem
    i = system.i
    k = system.k
    active = self.scene.ctl.grid[(k * NUM_SQUARES) + i]

  self.scene.ctl.grid[(k * NUM_SQUARES) + i] = not active

  #neighbor to the north
  if k > 0:
      var north_x = i
      var north_y = k -1
      var active_n = self.scene.ctl.grid[((k - 1) * NUM_SQUARES) + i]
      self.scene.ctl.grid[((k - 1) * NUM_SQUARES) + i] = not active_n

  #neighbor to the south
  if k < NUM_SQUARES -1:
      var south_x = i
      var south_y = k + 1
      var active_s = self.scene.ctl.grid[((k + 1) * NUM_SQUARES) + i]
      self.scene.ctl.grid[((k + 1) * NUM_SQUARES) + i] = not active_s

  #neighbor to the west
  if i > 0:
      var west_x = i - 1
      var west_y = k
      var active_w = self.scene.ctl.grid[(k * NUM_SQUARES) + i - 1]
      self.scene.ctl.grid[(k * NUM_SQUARES) + i - 1] = not active_w

  #neighbor to the east
  if i < NUM_SQUARES -1:
      var east_x = i + 1
      var east_y = k
      var active_e = self.scene.ctl.grid[(k * NUM_SQUARES) + i + 1]
      self.scene.ctl.grid[(k * NUM_SQUARES) + i + 1] = not active_e
