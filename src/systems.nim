import controller

proc newDoNothingSystem*(ctl: ref Controller): iterator(t, dt: int) =
  result = iterator(t, dt: int) {.closure.} =
    while true:
      yield