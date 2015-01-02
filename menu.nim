import graphics, colors, math, strutils, sdl, algorithm
from graphics import TRect
import controller
import app
import scene

type
  HoverSystem = object
    scene: ref MenuScene
    i, k: int

  ClickSystem = object
    scene: ref MenuScene

  MenuScene = object of Scene
    hoverSystem*: ref HoverSystem
    clickSystem*: ref ClickSystem
    hasWon: bool

  GameScene = object of Scene
    hoverSystem*: ref HoverSystem
    clickSystem*: ref ClickSystem
    hasWon: bool
  


#Constructor like procs to init new hover and click systems
proc newHoverSystem(scene: ref MenuScene): ref HoverSystem =
  result = new HoverSystem
  result.scene = scene
  result.i = 0
  result.k = 0

proc newClickSystem(scene: ref MenuScene): ref ClickSystem =
  result = new ClickSystem
  result.scene = scene

method mouse_down(self: ref ClickSystem, event: PMouseButtonEvent) =
  discard

proc update(self: ref HoverSystem, t, dt: int) =
  discard

method enter(self: ref MenuScene) =
  self.hoverSystem = newHoverSystem(self)
  self.clickSystem = newClickSystem(self)

method update(self: ref MenuScene, t, dt: int) =
  self.hoverSystem.update(t, dt)
  
 
method key_down(self: ref MenuScene, key: TKey, mods: TMod) =
  case key:
    of K_SPACE:
        echo "quitting"
        quit(0)
    of K_RETURN:
        var game_scene = new GameScene
        self.manager.set_scene(game_scene)


    else: discard

method mouse_down(self: ref MenuScene, event: PMouseButtonEvent) =
  self.clickSystem.mouse_down(event)

method draw(self: ref MenuScene) =
  # clear screen
  let screen_rect = graphics.TRect(
    (0, 0, self.ctl.display.w, self.ctl.display.h))
  self.ctl.display.fillRect(screen_rect, colBlack)
  
  #draw some stuff
  
      
var menu_scene = new MenuScene
var menu_app = new(App)
menu_app.init(menu_scene, WIDTH, HEIGHT, "Main Menu -*Lights Out!")
menu_app.run()
