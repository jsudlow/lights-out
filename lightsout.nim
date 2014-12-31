import graphics, colors, math, strutils, sdl, algorithm
from graphics import TRect

import app, scene
import controller, systems

type GameScene = object of Scene
  doNothingSystem: iterator(t, dt: int)

method enter(self: ref GameScene) =
  self.doNothingSystem = newDoNothingSystem(self.ctl)

method update(self: ref GameScene, t, dt: int) =
  self.doNothingSystem(t, dt)

method draw(self: ref GameScene) =
  # clear screen
  self.ctl.display.fillRect(graphics.TRect((0, 0, self.ctl.display.w, self.ctl.display.h)), colBlack)

  # draw stuff
  for i in 0..NUM_SQUARES - 1 :
      for k in 0..NUM_SQUARES - 1:
          let x = i * int(SQUARE_SIZE)
          let y = k * int(SQUARE_SIZE)
          let xoff = x + SQUARE_MARGIN
          let yoff = y + SQUARE_MARGIN
          let rect = graphics.TRect((xoff, yoff, int(SQUARE_BODY), int(SQUARE_BODY)))
          self.ctl.display.fillRect(rect, colFuchsia)




  #top row
  #self.ctl.display.fillRect((50, 50, 100, 100), colFuchsia)
  #self.ctl.display.fillRect((175, 50, 100, 100), colFuchsia)
  #self.ctl.display.fillRect((300, 50, 100, 100), colFuchsia)

  #middle row
  #self.ctl.display.fillRect((50, 175, 100, 100), colFuchsia)
  #self.ctl.display.fillRect((175, 175, 100, 100), colFuchsia)
  #self.ctl.display.fillRect((300, 175, 100, 100), colFuchsia)

  #bottm row
  #self.ctl.display.fillRect((50, 300, 100, 100), colFuchsia)
  #self.ctl.display.fillRect((175, 300, 100, 100), colFuchsia)
  #self.ctl.display.fillRect((300, 300, 100, 100), colFuchsia)


var game_scene = new(GameScene)
var game_app = new(App)
game_app.init(game_scene, WIDTH, HEIGHT, "Lights Out!")
game_app.run()
