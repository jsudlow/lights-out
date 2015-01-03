
proc newClickSystem(scene: ref GameScene): ref ClickSystem =
  result = new ClickSystem
  result.scene = scene

