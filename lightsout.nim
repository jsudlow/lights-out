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
          let
            x = i * int(SQUARE_SIZE)
            y = k * int(SQUARE_SIZE)
            xoff = x + SQUARE_MARGIN
            yoff = y + SQUARE_MARGIN
            rect = graphics.TRect((xoff, yoff, int(SQUARE_BODY), int(SQUARE_BODY)))
            mx = self.ctl.mouseX
            my = self.ctl.mouseY

          var color: Color
          if mx >= x and mx <= x + int(SQUARE_SIZE) and my >= y and my <= y + int(SQUARE_SIZE):
            color = SQUARE_HIGHLIGHT
            if self.ctl.mouseDown:
                #test if mous down is working correctly; it is
                #echo "MOUSE DOWN"
                #get all squares around the square that is clicked
                
                #establish row and col coordinate mapping
                echo i  #cols
                echo k  #rows

                #find neighbor to the north
                if k > 0:
                    var north_x = i
                    var north_y = k -1
                    echo "found valid north neighbor at:"
                    echo north_x
                    echo north_y
                
                #find neighbor to the south
                if k < NUM_SQUARES -1:
                    var south_x = i
                    var south_y = k + 1
                    echo "found valid south neighbor at:"
                    echo south_x
                    echo south_y

                #find neighbors to the west
                if i > 0:
                    var west_x = i - 1
                    var west_y = k
                    echo "found valid west neighbor at: "
                    echo west_x
                    echo west_y
                #find neighbors to the east    
                if i < NUM_SQUARES -1:
                    var east_x = i + 1
                    var east_y = k
                    echo "found valid east neighbor at: "
                    echo east_x
                    echo east_y




          else:
            color = SQUARE_COLOR
          self.ctl.display.fillRect(rect, color)

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
