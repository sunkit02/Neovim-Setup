return {
  "theprimeagen/harpoon",
  keys = {
    { "<leader>m", function() require("harpoon.mark").add_file() end,        desc = "[M]ark file for harpoon." },
    { "<C-e>",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Show harpoon list." },
    { "<leader>z", function() require("harpoon.ui").nav_file(1) end,         desc = "Go to harpoon file 1." },
    { "<leader>x", function() require("harpoon.ui").nav_file(2) end,         desc = "Go to harpoon file 2." },
    { "<leader>c", function() require("harpoon.ui").nav_file(3) end,         desc = "Go to harpoon file 3." },
    { "<leader>v", function() require("harpoon.ui").nav_file(4) end,         desc = "Go to harpoon file 4." },
  }
}
