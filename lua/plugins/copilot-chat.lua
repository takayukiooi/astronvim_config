---@module CopilotChat.nvim
---@description Neovim用のCopilot Chatインテグレーションを提供するプラグイン
---@author CopilotC-Nvim

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- または zbirenbaum/copilot.lua を使用可能
      { "nvim-lua/plenary.nvim", branch = "master" }, -- curl、ログ、非同期関数のために必要
    },
    build = "make tiktoken", -- MacOSまたはLinuxのみ
    config = function()
      local select = require "CopilotChat.select"
      require("CopilotChat").setup {
        -- デバッグモードを有効にする
        debug = true,
        -- プロキシ設定（nilの場合はプロキシを使用しない）
        proxy = nil,
        -- 安全でない接続を許可するかどうか
        allow_insecure = false,
        -- 使用するAIモデル
        model = "claude-3.7-sonnet",
        -- 生成テキストの多様性（0.0-1.0、低いほど一貫性が高い）
        temperature = 0.1,
        -- 定義済みプロンプトのセット
        prompts = {
          -- コード説明用プロンプト
          Explain = {
            prompt = "/COPILOT_EXPLAIN 選択したコードの説明を段落をつけて書いてください。",
            system_prompt = "あなたは優れたプログラマーであり、ドキュメント作成の専門家です。言語は日本語を使います。",
            context = { "buffer: 'current'" },
          },
          -- バグ修正用プロンプト
          Fix = {
            prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。",
            system_prompt = "あなたは優れたプログラマーです。言語は日本語を使います。",
            context = { "buffer: 'current'" },
          },
          -- コード最適化用プロンプト
          Optimize = {
            prompt = "/COPILOT_OPTIMIZE このコードを最適化し、パフォーマンスと可読性を向上させてください。",
            system_prompt = "あなたは優れたプログラマーであり、パフォーマンスチューニングの専門家です。言語は日本語を使います。",
            context = { "buffer: 'current'" },
          },
          -- ドキュメント生成用プロンプト
          Docs = {
            prompt = "/COPILOT_DOCS このコードのドキュメントを書いてください。ドキュメントをコメントとして追加した元のコードを含むコードブロックで回答してください。使用するプログラミング言語に最も適したドキュメントスタイルを使用してください（例：JavaScriptのJSDoc、Pythonのdocstringsなど）",
            system_prompt = "あなたは優れたプログラマーであり、ドキュメント作成の専門家です。言語は日本語を使います。",
            context = { "buffer: 'current'" },
          },
          -- テスト生成用プロンプト
          Tests = {
            prompt = "/COPILOT_TESTS 選択したコードの詳細な単体テスト関数を書いてください。",
            system_prompt = "あなたは優れたプログラマーであり、テスト駆動開発の専門家です。言語は日本語を使います。",
            context = { "buffer: 'current'" },
          },
          -- 診断修正用プロンプト
          FixDiagnostic = {
            prompt = "/COPILOT_FIXDIAGNOSTIC ファイル内の次のような診断上の問題を解決してください：",
            selection = select.diagnostics or select.selection or function() return {} end,
          },
          -- コミットメッセージ生成用プロンプト
          Commit = {
            prompt = "/COPILOT_COMMIT この変更をコミットしてください。",
            selection = select.gitdiff or select.selection or function() return {} end,
          },
          -- ステージング済み変更のコミット用プロンプト
          CommitStaged = {
            prompt = "変更のコミットメッセージをcommitizenの規約に従って日本語で書いてください。タイトルは最大50文字、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語のコードブロックで囲んでください。",
            context = { "git:staged" },
          },
          -- コードレビュー用プロンプト
          Review = {
            prompt = "/COPILOT_REVIEW 選択したコードをレビューしてください。",
            selection = select.selection or function() return {} end,
          },
        },
        -- ウィンドウ設定
        window = {
          -- レイアウト種別（vertical/horizontal/floating）
          layout = "vertical",
          -- ウィンドウの幅（相対サイズ）
          width = 0.3,
          -- ウィンドウの高さ（相対サイズ）
          height = 0.3,
          -- 配置の基準
          relative = "editor",
          -- ウィンドウの枠線スタイル
          border = "single",
          -- 上端からの位置
          row = 0,
          -- 左端からの位置
          col = 0,
          -- ウィンドウのタイトル
          title = "Copilot Chat",
          -- ウィンドウのフッター
          footer = nil,
          -- Z軸の重なり順（大きいほど前面）
          zindex = 1,
        },
        -- キーマッピング設定
        mapping = {
          yank_diff = {
            -- 差分をヤンクするための通常モードキー
            normal = "cy",
            -- ヤンク時に使用するレジスタ
            register = '"', -- デフォルトレジスタ
          },
        },
      }

      ---@function CopilotChatBuffer
      ---@description 現在のバッファについてCopilotに質問するためのクイックチャット機能を提供する
      ---@return nil
      function CopilotChatBuffer()
        local input = vim.fn.input "Quick Chat: "
        if input ~= "" then require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer }) end
      end

      -- キーマップの設定
      -- クイックチャットを開始
      vim.api.nvim_set_keymap("n", "<leader>gpq", "<cmd>lua CopilotChatBuffer()<cr>", { noremap = true, silent = true })
      -- プロンプト一覧を表示
      vim.api.nvim_set_keymap("n", "<leader>gpp", "<cmd>CopilotChatPrompts<cr>", { noremap = true, silent = true })
      -- Copilot Chatの表示/非表示を切り替え
      vim.api.nvim_set_keymap("n", "<leader>gpt", "<cmd>CopilotChatToggle<cr>", { noremap = true, silent = true })
    end,
  },
}
