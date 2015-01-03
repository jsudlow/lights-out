import sdl, graphics, colors,sdl_ttf
import app
import scene

method enter*(self: ref MenuScene) =
  #var myFont = openFont("src/fonts/Pacifo.ttf",14)
  #var myColor = sdl.TColor(r:250, g:250, b:250)
  #var surfaceText = renderTextSolid(myFont,"My test Font",myColor)
  var blankSurface = newSurface(100,100)
  self.menuText = blankSurface
method key_down*(self: ref MenuScene, key: TKey, mods: TMod) =
  case key:
    of K_SPACE:
        quit(0)
    of K_RETURN:
        var game_scene = new GameScene
        self.manager.set_scene(game_scene)
    else: discard

method draw*(self: ref MenuScene) =
  # clear screen
  let screen_rect = graphics.TRect(
    (0, 0, self.ctl.display.w, self.ctl.display.h))
  self.ctl.display.fillRect(screen_rect, colBlack)
  var tpoint:TPoint = (x: 25, y:25);
  graphics.drawText(self.menuText,tpoint,"Hiiii")
  
