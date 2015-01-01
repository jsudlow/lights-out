import tables, sdl

proc pop*[T](s: var seq[T], idx: int): T =
    result = s[idx]
    for i in idx..s.high - 1:
        s[i] = s[i+1]
    setLen(s, s.len - 1)

type KeyMap* = Table[TKey, bool]

proc pressed*(self: KeyMap, key: TKey): bool =
    if not self.hasKey(key):
        return false
    return self[key]

type ModMap* = Table[TMod, bool]

proc iterSquares*(self: ref, task: proc(self: ref, i, k: int)) =
  for i in 0..NUM_SQUARES - 1:
    for k in 0..NUM_SQUARES -1:
      task(self, i, k)
