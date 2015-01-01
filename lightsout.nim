import graphics, colors, math, strutils, sdl, algorithm
from graphics import TRect

import app

type
  HoverSystem = object
    scene: ref GameScene
    i, k: int

  ClickSystem = object
    scene: ref GameScene

  GameScene = object of Scene
    hoverSystem*: ref HoverSystem
    clickSystem*: ref ClickSystem

proc newHoverSystem(scene: ref GameScene): ref HoverSystem =
  result = new HoverSystem
  result.scene = scene
  result.i = 0
  result.k = 0

proc newClickSystem(scene: ref GameScene): ref ClickSystem =
  result = new ClickSystem
  result.scene = scene

method mouse_down(self: ref ClickSystem, event: PMouseButtonEvent) =
  let
    scene: ref GameScene = self.scene
  let
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

proc update(self: ref HoverSystem, t, dt: int) =
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

method enter(self: ref GameScene) =
  self.hoverSystem = newHoverSystem(self)
  self.clickSystem = newClickSystem(self)

method update(self: ref GameScene, t, dt: int) =
  self.hoverSystem.update(t, dt)

method mouse_down(self: ref GameScene, event: PMouseButtonEvent) =
  self.clickSystem.mouse_down(event)

method draw(self: ref GameScene) =
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

      let
        x = i * int(SQUARE_SIZE)
        y = k * int(SQUARE_SIZE)
        xoff = x + SQUARE_MARGIN
        yoff = y + SQUARE_MARGIN
        rect = graphics.TRect(
          (xoff, yoff, int(SQUARE_BODY), int(SQUARE_BODY)))

      self.ctl.display.fillRect(rect, color)
      
var game_scene = new GameScene
var game_app = new(App)
game_app.init(game_scene, WIDTH, HEIGHT, "Lights Out!")
game_app.run()
