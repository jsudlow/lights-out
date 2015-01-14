import graphics,sdl,scene,messagebox

type
  GameScene* = object of Scene
    hoverSystem*: ref HoverSystem
    clickSystem*: ref ClickSystem
    grid*: array[0..TOTAL_SQUARES - 1, bool]
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
  

  
    
