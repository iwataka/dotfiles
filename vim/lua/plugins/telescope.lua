local actions = require "telescope.actions"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local action_state = require "telescope.actions.state"
local previewers = require "telescope.previewers"

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

local M = {}

local live_grep_for_current_selection = function()
  local selection = action_state.get_selected_entry()
  require('telescope.builtin').live_grep({cwd=selection[1]})
end

-- our picker function: colors
M.find_dirs = function(opts)
  opts = opts or {}
  local picker = pickers.new(opts, {
    prompt_title = "Directory",
    finder = finders.new_table {
      results = vim.api.nvim_eval("FuzzyFinderDirs()")
    },
    sorter = conf.generic_sorter(opts),
    previewer = conf.file_previewer(opts),
    attach_mappings = function(_, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        require('telescope.builtin').find_files({cwd=selection[1]})
      end)
      map("i", "<c-f>", live_grep_for_current_selection)
      map("n", "<c-f>", live_grep_for_current_selection)
      return true
    end,
  }):find()
end

return M
