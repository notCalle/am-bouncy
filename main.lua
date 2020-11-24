--- A bouncy box "DVD" screen saver demo
--
-- @author Calle Englund &lt;git@notcalle.xyz&gt;
-- @copyright &copy; 2020 Calle Englund
-- @license
-- The MIT License (MIT)
--
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
--
-- The above copyright notice and this permission notice shall be included
-- in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
-- CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-- Seed the random generator for less predictable randomness
math.randomseed(os.time())

-- Configure the game window at 1280x720, for HD Ready displays only
local window = am.window{
  width = 1280,
  height = 720,
  title = "Bouncy Box"
}

-- Pick a random binary direction
local function direction()
  if math.random() > 0.5 then return 1 else return -1 end
end

-- Change color of a node to a new random color
local function randomcolor(node)
  local new_color = math.randvec3()
  while node.color.rgb == new_color do
    new_color = math.randvec3()
  end
  node.color = vec4(new_color, 1.0)
end

-- Bounce the thing along the X axis
local dx = direction()
local function bounce_x(node)
  node.x1 = node.x1 + dx
  node.x2 = node.x2 + dx
  if node.x1 <= window.left or node.x2 >= window.right then
    dx = -dx
    randomcolor(node)
  end
end

-- Bounce the thing along the Y axis
local dy = direction()
local function bounce_y(node)
  node.y1 = node.y1 + dy
  node.y2 = node.y2 + dy
  if node.y1 <= window.bottom or node.y2 >= window.top then
    dy = -dy
    randomcolor(node)
  end
end

-- Toggle the paused state of our 'box' node when the player presses space
local function pause(node)
  if window:key_pressed'space' then
    node'box'.paused = not node'box'.paused
  end
end

-- Attach scene graph to window
window.scene =
  am.group{
    -- The player character sprite, with a name tag, so that scene wide actions
    -- can find it amongst all the nodes in the graph.
    am.rect(-25, -25, 25, 25)
    :tag'box'
    :action(am.parallel{ bounce_x, bounce_y })
  }
  :action(pause)
