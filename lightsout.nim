import app, src/menu, src/game

var menu_scene = new MenuScene
var game_app = new(App)
game_app.init(menu_scene, WIDTH, HEIGHT, "Lights Out!")
game_app.run()
