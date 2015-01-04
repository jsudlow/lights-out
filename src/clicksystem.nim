import sdl
import random
import game, hoversystem

proc newClickSystem*(scene: ref GameScene): ref ClickSystem =
  result = new ClickSystem
  result.scene = scene

proc flip_neighbors*(self: ref ClickSystem,  i :int, k :int) =
  var active = self.scene.ctl.grid[(k * NUM_SQUARES) + i]
  self.scene.ctl.grid[(k * NUM_SQUARES) + i] = not active

  #neighbor to the north
  if k > 0:
      var north_x = i
      var north_y = k -1
      var active_n = self.scene.ctl.grid[((k - 1) * NUM_SQUARES) + i]
      self.scene.ctl.grid[((k - 1) * NUM_SQUARES) + i] = not active_n

  #neighbor to the south
  if k < NUM_SQUARES -1:
      var south_x = i
      var south_y = k + 1
      var active_s = self.scene.ctl.grid[((k + 1) * NUM_SQUARES) + i]
      self.scene.ctl.grid[((k + 1) * NUM_SQUARES) + i] = not active_s

  #neighbor to the west
  if i > 0:
      var west_x = i - 1
      var west_y = k
      var active_w = self.scene.ctl.grid[(k * NUM_SQUARES) + i - 1]
      self.scene.ctl.grid[(k * NUM_SQUARES) + i - 1] = not active_w

  #neighbor to the east
  if i < NUM_SQUARES -1:
      var east_x = i + 1
      var east_y = k
      var active_e = self.scene.ctl.grid[(k * NUM_SQUARES) + i + 1]
      self.scene.ctl.grid[(k * NUM_SQUARES) + i + 1] = not active_e

method mouse_down*(self: ref ClickSystem, event: PMouseButtonEvent) =
  echo "mouse down detected"
  let
    scene: ref GameScene = self.scene
    system = scene.hoverSystem
    i = system.i
    k = system.k
    
  flip_neighbors(self,i,k)
  

proc randomGridWalk*(scene: ref GameScene) =
  #lets get a random number i and k on the grid
 
  #set num_squares to a var bc random cant take a const
  var num_squares = (NUM_SQUARES)

  #generate i and k within our range
  var random_i = randomInt(num_squares)
  var random_k = randomInt(num_squares)
  
  #echo out to test RNG
  echo random_i
  echo random_k
  
  flip_neighbors(scene.clicksystem,random_i,random_k)
  
  
  