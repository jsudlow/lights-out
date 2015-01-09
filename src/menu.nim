import sdl, graphics, colors,sdl_ttf

import app
import scene
import controller

method enter*(self: ref MenuScene) =
  self.ctl.newFont("title", "fonts/Pacifico.ttf", 36, colGreen)

  self.title_msg = self.ctl.addMessage(
    "Lights Out!", "title", 100, 100)
  self.play_msg = self.ctl.addMessage(
    "Press Enter to Play", "title", 100, 200)
  self.quit_msg = self.ctl.addMessage(
    "Press Space to Quit", "title", 100, 280)

  self.title_msg.isVisible = true
  self.play_msg.isVisible = true
  self.quit_msg.isVisible = true

method leave*(self: ref MenuScene) =
  self.title_msg.isVisible = false
  self.play_msg.isVisible = false
  self.quit_msg.isVisible = false

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
