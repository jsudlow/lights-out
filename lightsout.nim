import graphics, colors, math, strutils, sdl, algorithm
from graphics import TRect
import controller
import app
import menu
import hoversystem
import clicksystem
import game

var menu_scene = new MenuScene      
#var game_scene = new GameScene
var game_app = new(App)
#game_app.init(game_scene, WIDTH, HEIGHT, "Lights Out!")
game_app.init(menu_scene, WIDTH, HEIGHT, "Main Menu - Lights Out!")
game_app.run()
