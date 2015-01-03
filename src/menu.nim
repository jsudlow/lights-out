import sdl, graphics, colors,sdl_ttf
import app
import scene

method enter*(self: ref MenuScene) =
  initDefaultFont("fonts/Pacifico.ttf", 36, colGreen)
  let
    play_text = "Press Enter to Play"
    quit_text = "Press Space to Quit"
    title_text = "Lights Out!"

    play_size = textBounds(play_text)
  self.menuRect = graphics.TRect((
    0, 0, 400, 400))
  self.menuText = newSurface(400, 400)
  self.menuText.drawText((x: 100, y: 100), title_text)
  self.menuText.drawText((x: 100, y: 200), play_text)
  self.menuText.drawText((x: 100, y:250), quit_text)
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
