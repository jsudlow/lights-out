import graphics,sdl

type
  App* = object
    display*: graphics.PSurface
    manager*: ref SceneManager
    ctl*: ref Controller

  Controller* = object
    display*: graphics.PSurface
    should_close*: bool
    keys*: KeyMap
    mods*: ModMap
    mouseX*, mouseY*: int
    mouseDown*: bool
    grid*: array[0..TOTAL_SQUARES - 1, bool]
    fonts*: Table[string, PFont]
    messages*: seq[ref MessageBox]


  Scene* = object of RootObj
    ctl*: ref Controller
    manager*: ref SceneManager

  SceneManager* = object of RootObj
    ctl*: ref Controller
    scene*: ref Scene

  GameScene* = object of Scene
    hoverSystem*: ref HoverSystem
    clickSystem*: ref ClickSystem
    hasWon*: bool

  MenuScene* = object of Scene
    title_msg*: ref MessageBox
    play_msg*: ref MessageBox
    quit_msg*: ref MessageBox

  HoverSystem* = object
    scene*: ref GameScene
    i*, k*: int

  ClickSystem* = object
    scene*: ref GameScene

  MessageBox* = object
    messageText*: string
    x*,y*,size*: int
    font*: PFont
    s*: graphics.PSurface
    isVisible*: bool


