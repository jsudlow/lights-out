import graphics, colors, math, strutils, sdl, algorithm
from graphics import TRect
import controller
import app
import scene


method enter(self: ref MenuScene) =
  discard

method update(self: ref MenuScene, t, dt: int) =
  discard
   
method key_down(self: ref MenuScene, key: TKey, mods: TMod) =
  case key:
    of K_SPACE:
        echo "quitting"
        quit(0)
    of K_RETURN:
        var game_scene = new GameScene
        self.manager.set_scene(game_scene)


    else: discard

method draw(self: ref MenuScene) =
  # clear screen
  let screen_rect = graphics.TRect(
    (0, 0, self.ctl.display.w, self.ctl.display.h))
  self.ctl.display.fillRect(screen_rect, colBlack)
  
  
      

