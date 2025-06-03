return {
  'olimorris/codecompanion.nvim',
  config = function()
    require('codecompanion').setup {
      strategies = {
        chat = {
          adapter = 'anthropic',
        },
        inline = {
          adapter = 'anthropic',
          keymaps = {
            accept_change = {
              modes = { n = 'C-l' },
              description = 'Accept the suggested change',
            },
          },
        },
        cmd = {
          adapter = 'anthropic',
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            show_result_in_chat = true,
            make_vars = true, -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          },
        },
      },
      display = {
        chat = {
          window = {
            width = 0.30,
          },
        },
        diff = {
          enabled = true,
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = 'vertical', -- vertical|horizontal split for default provider
          opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
          provider = 'default',
        },
      },
      opts = {
        system_prompt = function(opts)
          return [[
            You are an AI programming assistant named "CodeCompanion". You are currently plugged in to the Neovim text editor on a user's machine.

            Your core tasks include:
            - Answering general programming questions.
            - Explaining how the code in a Neovim buffer works.
            - Reviewing the selected code in a Neovim buffer.
            - Generating unit tests for the selected code.
            - Proposing fixes for problems in the selected code.
            - Scaffolding code for a new workspace.
            - Finding relevant code to the user's query.
            - Proposing fixes for test failures.
            - Answering questions about Neovim.
            - Running tools.

            You must:
            - Follow the user's requirements carefully and to the letter.
            - Keep your answers short and impersonal, especially if the user responds with context outside of your tasks.
            - Minimize other prose.
            - Use Markdown formatting in your answers.
            - Include the programming language name at the start of the Markdown code blocks.
            - Avoid including line numbers in code blocks.
            - Avoid wrapping the whole response in triple backticks.
            - Only return code that's relevant to the task at hand. You may not need to return all of the code that the user has shared.
            - Use actual line breaks instead of '\n' in your response to begin new lines.
            - Use '\n' only when you want a literal backslash followed by a character 'n'.
            - All non-code responses must be in %s.

            When given a task:
            1. Think step-by-step and describe your plan for what to build in pseudocode, written out in great detail, unless asked not to do so.
            2. Output the code in a single code block, being careful to only return relevant code.
            3. You should always generate short suggestions for the next user turns that are relevant to the conversation.
            4. You can only give one reply for each conversation turn.
            ]]
        end,
      },
    }
    vim.keymap.set('n', '<leader>aa', '<cmd>CodeCompanionChat<CR>', {
      desc = 'Chat',
      silent = true,
    })
    vim.keymap.set('v', '<leader>aa', '<cmd>CodeCompanionChat<CR>', {
      desc = 'Chat',
      silent = true,
    })

    vim.keymap.set('n', '<leader>ae', '<cmd>CodeCompanion<CR>', {
      desc = 'Edit Inline',
      silent = true,
    })
    vim.keymap.set('v', '<leader>ae', '<cmd>CodeCompanion<CR>', {
      desc = 'Edit Inline',
      silent = true,
    })
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
