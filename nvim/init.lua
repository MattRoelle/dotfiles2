vim.cmd([[
set number
let g:conjure#filetype#fennel = "conjure.client.fennel.stdio"
let g:conjure#client#fennel#stdio#command = "love ./"

set background=dark
colorscheme jellybeans-black

inoremap jj <ESC>

nnoremap <C-n> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>lc :ConjureLogVSplit<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>r :Rg 
nnoremap <leader>o :NvimTreeToggle<CR>
vnoremap <leader>c :Commentary<CR>
nnoremap <leader>c :Commentary<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

inoremap <C-l> λ

nnoremap <C-q> :vertical resize -8<CR>
nnoremap <C-w> :vertical resize +8<CR>

nnoremap <leader>a :Goyo 160<CR>

highlight NormalFloat ctermbg=black guibg=black

set autowrite

set expandtab
set shiftwidth=2
set autoindent
]])

local cmp = require'cmp'

cmp.setup({
  -- snippet = {
  --   -- REQUIRED - you must specify a snippet engine
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  --     -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
  --   end,
  -- },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    --{ name = 'nvim_lsp' },
    --{ name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
    { name = 'rg' },
  })
})

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'rktjmp/hotpot.nvim',
    config = function() require("hotpot") end
  }

  use 'bakpakin/fennel.vim'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'eraserhd/parinfer-rust'
  use 'Olical/conjure'
  use 'andreasvc/vim-256noir'
  use 'jremmen/vim-ripgrep'
  use 'tpope/vim-commentary'
  use 'relastle/bluewery.vim'
  use 'rafi/awesome-vim-colorschemes'
  use 'xolox/vim-misc'
  use 'xolox/vim-colorscheme-switcher'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'lukas-reineke/cmp-rg'
  use 'tikhomirov/vim-glsl'
  -- use 'vim-airline/vim-airline'
  -- use 'vim-airline/vim-airline-themes'
  use 'junegunn/goyo.vim'
  use 'ggandor/lightspeed.nvim'


  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
end)
