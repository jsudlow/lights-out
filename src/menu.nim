import sdl, graphics, colors,sdl_ttf
import app
import scene

method enter*(self: ref MenuScene) =
  initDefaultFont("fonts/Pacifico.ttf", 14, colBlue)
  let
    menu_text = "Hello World"
    menu_size = textBounds(menu_text)
  self.menuRect = graphics.TRect((
    0, 0, menu_size.width, menu_size.height))
  self.menuText = newSurface(menu_size.width, menu_size.height)
  self.menuText.drawText((x: 0, y: 0), menu_text)

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
  self.ctl.display.blit(screen_rect, self.menuText, self.menuRect)
