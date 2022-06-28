
if arg[#arg] == "-debug" then require"mobdebug".start() end

local lgi = require"lgi"
local Gtk = lgi.require("Gtk", "3.0")

local Builder = Gtk.Builder.new_from_file("grid.ui")
local UI      = Builder.objects

local App = Gtk.Application{
  application_id = "com.github.Miqueas.Lua-GTK3-Examples.GtkButton3"
}

function button_set_text(button, text)
  button.child[1].label = text
end

function grid_set()
  for row=1,size do
    for col=1,size do
      local name="button"..row..col
      local button=UI[name]
      local text=table_grid[row][col]
      button_set_text(button, text)
    end
  end
end

size=3
function table_grid_sorted()
  local table_grid = {}
  
  for row_id = 1,size do
  
    local row = {}
    for column_id = 1,size do
      local number
      
      -- sorted number
      number = column_id + (row_id-1)*size
      if row_id==size and column_id==size then
        number = 0
      end
      
      table.insert(row, number)
    end
    table.insert(table_grid, row)
  
  end
  
  return table_grid
end

function App:on_startup()
  local window = UI.Window
  self:add_window(window)
  table_grid=table_grid_sorted()
  grid_set()
end

function table_grid_swap(grid,row1,column1,row2,column2)
  grid[row1][column1], grid[row2][column2] = grid[row2][column2], grid[row1][column1]
end

function grid_click(button,row_id,column_id)
  function button:on_clicked()
    
    function swap(row_id_2, column_id_2)
      table_grid_swap(table_grid,row_id,column_id,row_id_2,column_id_2)
      grid_set()
    end
    
    -- left
    if column_id > 1 and table_grid[row_id][column_id - 1] == 0 then
      swap(row_id, column_id - 1)
    end
    
    -- right
    if column_id < size and table_grid[row_id][column_id + 1] == 0 then
      swap(row_id, column_id + 1)
    end
    
    -- up
    if row_id > 1 and table_grid[row_id - 1][column_id] == 0 then
      swap(row_id - 1, column_id)
    end
    
    -- down
    if row_id < size and table_grid[row_id + 1][column_id] == 0 then
      swap(row_id + 1, column_id)
    end
  end
end

function App:on_activate()
  local window = self.active_window
  for row=1,3 do
    for col=1,3 do
      local name="button"..row..col
      grid_click(UI[name],row,col)
    end
  end
  window:present()
end

return App:run(arg)