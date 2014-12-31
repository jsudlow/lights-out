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

var game_scene = new(GameScene)
var game_app = new(App)
game_app.init(game_scene, WIDTH, HEIGHT, "Lights Out!")
game_app.run()
