const
  WIDTH* = 500
  HEIGHT* = 500

  H_WIDTH* = WIDTH / 2
  H_HEIGHT* = HEIGHT / 2

  NUM_SQUARES* = 20
  SQUARE_SIZE* = WIDTH / NUM_SQUARES
  MARGIN_RATIO = 0.20
  SQUARE_MARGIN* = int(SQUARE_SIZE * MARGIN_RATIO)
  SQUARE_BODY* = SQUARE_SIZE - (SQUARE_MARGIN * 2)
