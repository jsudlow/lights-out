import sdl

import game, hover

proc newClickSystem(scene: ref GameScene): ref ClickSystem =
  result = new ClickSystem
  result.scene = scene

method mouse_down(self: ref ClickSystem, event: PMouseButtonEvent) =
  let
    scene: ref GameScene = self.scene
    system = scene.hoverSystem
    i = system.i
    k = system.k
    active = self.scene.ctl.grid[(k * NUM_SQUARES) + i]

  self.scene.ctl.grid[(k * NUM_SQUARES) + i] = not active

  #find neighbor to the north
  if k > 0:
      var north_x = i
      var north_y = k -1
      echo "found valid north neighbor at:"
      echo north_x
      echo north_y
      var active_n = self.scene.ctl.grid[((k - 1) * NUM_SQUARES) + i]
      self.scene.ctl.grid[((k - 1) * NUM_SQUARES) + i] = not active_n

  #find neighbor to the south
  if k < NUM_SQUARES -1:
      var south_x = i
      var south_y = k + 1
      echo "found valid south neighbor at:"
      echo south_x
      echo south_y
      var active_s = self.scene.ctl.grid[((k + 1) * NUM_SQUARES) + i]
      self.scene.ctl.grid[((k + 1) * NUM_SQUARES) + i] = not active_s

  #find neighbors to the west
  if i > 0:
      var west_x = i - 1
      var west_y = k
      echo "found valid west neighbor at: "
      echo west_x
      echo west_y
      var active_w = self.scene.ctl.grid[(k * NUM_SQUARES) + i - 1]
      self.scene.ctl.grid[(k * NUM_SQUARES) + i - 1] = not active_w

  #find neighbors to the east
  if i < NUM_SQUARES -1:
      var east_x = i + 1
      var east_y = k
      echo "found valid east neighbor at: "
      echo east_x
      echo east_y
      var active_e = self.scene.ctl.grid[(k * NUM_SQUARES) + i + 1]
      self.scene.ctl.grid[(k * NUM_SQUARES) + i + 1] = not active_e
