-- TargetFile: a simple code runner plugin written and configured in lua for Neovim
-- Author: Tiger Ding
-- Last updated: 2023/07/27

-- Writing code related infrastructure

-- Absolute file path
local target_file_path = vim.fn.expand('%:p')
local target_file_window_size = 60
local target_file_window_location = 2 -- 1: north; 2: east; 3: south; 4: west; 5: float
local locations = { 'North', 'East', 'South', 'West', 'Float' }
local location_cmd = { 'K', 'L', 'J', 'H', '' }
local location_split_cmd = { 'v', '', 'v', '', '' }
local resize_cmd = { '', 'vertical', '', 'vertical', '' }

local fterm = require('FTerm')

local targetfile_leader = [[<leader>\]]

-- Markings:
-- %fp: full file path
-- %fen: full file path without file extension
-- %fben: full file path without file extension with build directory
-- %fdb: full file path without file name or extension with build directory
-- %fn: file name (without extension)
local supported_languages = {
    ['.cpp'] = {
        name = 'C++',
        ext = '.cpp',
        compile_cmd = 'g++ -g -Wshadow -Wall -Wextra --std=c++17 %fp -o %fben',
        execute_cmd = '%fben',
        debug_cmd = nil,
        debut_window_cmd = nil,
        -- debug_cmd = 'gdb -tui %fben',
        -- debut_window_cmd = 'tabe | set nowrap | startinsert | term ',
    },
    ['.c'] = {
        name = 'C',
        ext = '.c',
        compile_cmd = 'gcc -g -Wshadow -Wall -Wextra -std=c99 %fp -o %fben',
        execute_cmd = '%fben',
        debug_cmd = nil,
        debut_window_cmd = nil,
        -- debug_cmd = 'gdb -tui %fben',
        -- debut_window_cmd = 'tabe | set nowrap | startinsert | term ',
    },
    ['.rs'] = {
        name = 'Rust',
        ext = '.rs',
        compile_cmd = 'rustc %fp',
        execute_cmd = '%fen',
        debug_cmd = nil,
        debut_window_cmd = nil,
        -- debug_cmd = 'gdb -tui %fben',
        -- debut_window_cmd = 'tabe | set nowrap | startinsert | term ',
    },
    ['.java'] = {
        name = 'Java',
        ext = '.java',
        compile_cmd = 'javac -d %fdb %fp',
        execute_cmd = 'java -cp %fdb %fp',
        debug_cmd = nil,
        debut_window_cmd = nil,
    },
    ['.js'] = {
        name = 'Javascript',
        ext = '.js',
        compile_cmd = nil,
        execute_cmd = 'node %fp',
        debug_cmd = nil,
        debut_window_cmd = nil,
    },
}

-- Keymappings
vim.keymap.set('n', targetfile_leader .. 'ps', vim.cmd.TargetFilePath, { desc = 'target file [P]ath [S]how' })
vim.keymap.set('n', targetfile_leader .. 'pr', vim.cmd.TargetFilePathReset, { desc = 'target file [P]ath [R]eset' })
vim.keymap.set('n', targetfile_leader .. "pc", vim.cmd.TargetFilePathCustom, { desc = 'target file [P]ath [C]ustom' })
vim.keymap.set('n', targetfile_leader .. "e", vim.cmd.TargetFileExecute, { desc = '[E]xecute target file' })
vim.keymap.set('n', targetfile_leader .. "c", vim.cmd.TargetFileCompile, { desc = '[C]ompile target file' })
vim.keymap.set('n', targetfile_leader .. "<space>", vim.cmd.TargetFileCompileExecute,
    { desc = 'compiles & executes target file' })
vim.keymap.set('n', targetfile_leader .. "d", vim.cmd.TargetFileDebug, { desc = '[D]ebugs target file' })
vim.keymap.set('n', targetfile_leader .. "ws", vim.cmd.TargetFileWindow, { desc = 'target file [W]indow preview [S]how' })
vim.keymap.set('n', targetfile_leader .. "wr", vim.cmd.TargetFileWindowReset, { desc = 'target file [W]indow [R]eset' })
vim.keymap.set('n', targetfile_leader .. "ss", vim.cmd.TargetFileWindowSize,
    { desc = 'target file window [S]ize [S]how' })
vim.keymap.set('n', targetfile_leader .. "sr", vim.cmd.TargetFileWindowSizeReset,
    { desc = 'target file window [S]ize [R]eset' })
vim.keymap.set('n', targetfile_leader .. "sc", vim.cmd.TargetFileWindowSizeCustom,
    { desc = 'target file window [S]ize [C]ustom' })
vim.keymap.set('n', targetfile_leader .. "ls", vim.cmd.TargetFileWindowLocation,
    { desc = 'target file window [L]ocation [S]how' })
vim.keymap.set('n', targetfile_leader .. "lr", vim.cmd.TargetFileWindowLocationReset,
    { desc = 'target file window [L]ocation [R]eset' })
vim.keymap.set('n', targetfile_leader .. "lc", vim.cmd.TargetFileWindowLocationCustom,
    { desc = 'target file window [L]ocation [C]ustom' })

-- vim.keymap.set('i', '<C-e>', '<C-o>A', { desc = 'Puts cursor at the end of the line without exiting insert mode' })
-- vim.keymap.set('n', '<leader>e', function() vim.cmd [[NERDTreeToggle]] end, { desc = 'Open file explorer (NERDTree)' })

-- print(expand_to_cmd(compile_cmd['.cpp']))

-- User commands
vim.api.nvim_create_user_command("TargetFilePath", function()
    print(target_file_path)
end, {})

vim.api.nvim_create_user_command("TargetFilePathReset", function()
    file_path_reset()
    print(target_file_path)
end, {})

vim.api.nvim_create_user_command("TargetFilePathCustom", function()
    file_path_reset(vim.fn.input("Absolute target file path > "))
end, {})

vim.api.nvim_create_user_command("TargetFileExecute", function()
    local filetype = supported_languages[file_ext(target_file_path)]
    if filetype == nil then
        print 'No assigned executable for current file type'
        return
    elseif filetype.execute_cmd ~= nil then
        if target_file_window_location <= 4 then
            vim.cmd(window_open_cmd().open_cmd .. 'term ' .. expand_to_cmd(filetype.execute_cmd))
        else
            fterm.run(expand_to_cmd(filetype.execute_cmd))
            vim.cmd('stopinsert')
        end
    end
end, {})

vim.api.nvim_create_user_command("TargetFileCompile", function()
    local filetype = supported_languages[file_ext(target_file_path)]
    if filetype == nil then
        print 'No assigned compiler for current file type'
        return
    elseif filetype.compile_cmd ~= nil then
        if target_file_window_location <= 4 then
            vim.cmd(window_open_cmd().open_cmd .. 'term ' .. expand_to_cmd(filetype.compile_cmd))
        else
            fterm.run(expand_to_cmd(filetype.compile_cmd))
            vim.cmd('stopinsert')
        end
    end
end, {})

vim.api.nvim_create_user_command("TargetFileCompileExecute", function()
    local window_cmds = window_open_cmd()
    local filetype = supported_languages[file_ext(target_file_path)]
    if filetype == nil then
        print('No assigned compiler / executable for current file type')
        return
    elseif filetype.compile_cmd ~= nil then
        if target_file_window_location <= 4 then
            vim.cmd(window_cmds.open_cmd .. 'term ' .. expand_to_cmd(filetype.compile_cmd))
            local exit_code = vim.fn.jobwait({ vim.b.terminal_job_id }, -1)[1]
            if (exit_code == 0) then
                vim.cmd(window_cmds.split_cmd .. 'term ' .. expand_to_cmd(filetype.execute_cmd))
            end
        else
            fterm.run(expand_to_cmd(filetype.compile_cmd))
            fterm.run(expand_to_cmd(filetype.execute_cmd))
            vim.cmd('stopinsert')
        end
    elseif filetype.execute_cmd then
        if target_file_window_location <= 4 then
            vim.cmd(window_open_cmd().open_cmd .. 'term ' .. expand_to_cmd(filetype.execute_cmd))
        else
            fterm.run(expand_to_cmd(filetype.execute_cmd))
            vim.cmd('stopinsert')
        end
    end
end, {})

vim.api.nvim_create_user_command("TargetFileDebug", function()
    local filetype = supported_languages[file_ext(target_file_path)]
    if filetype == nil then
        print 'No assigned debugger for current file type'
    elseif filetype.debug_cmd ~= nil then
        vim.cmd(filetype.debut_window_cmd .. expand_to_cmd(filetype.debug_cmd))
    end
end, {})


-- Window
-- Shows a brief preview of window
vim.api.nvim_create_user_command("TargetFileWindow", function()
    vim.cmd(window_preview_cmd())
end, {})

-- Resets to default window size and location
vim.api.nvim_create_user_command("TargetFileWindowReset", function()
    window_reset()
    vim.cmd(window_preview_cmd())
end, {})

-- Displays windows size
vim.api.nvim_create_user_command("TargetFileWindowSize", function()
    print(target_file_window_size)
end, {})

-- Resets default window size
vim.api.nvim_create_user_command("TargetFileWindowSizeReset", function()
    window_size_reset()
    vim.cmd(window_preview_cmd())
end, {})

-- Sets a custom window size from uesr
vim.api.nvim_create_user_command("TargetFileWindowSizeCustom", function()
    window_size_reset(vim.fn.input("Window size > "))
    vim.cmd(window_preview_cmd())
end, {})

-- Displays windows location
vim.api.nvim_create_user_command("TargetFileWindowLocation", function()
    print(locations[target_file_window_location])
end, {})

-- Resets default window location
vim.api.nvim_create_user_command("TargetFileWindowLocationReset", function()
    window_location_reset()
    vim.cmd(window_preview_cmd())
end, {})

-- Sets a custom window location from user
vim.api.nvim_create_user_command("TargetFileWindowLocationCustom", function()
    window_location_reset(vim.fn.input("\n1: North\n2: East\n3: South\n4: West\n5: Float\nWindow location > "))
    vim.cmd(window_preview_cmd())
end, {})

-- Window
-- Generates command to open the specified window
function window_open_cmd()
    if target_file_window_location <= 4 then
        local open_cmd = 'new | wincmd ' ..
            location_cmd[target_file_window_location] ..
            ' | ' ..
            resize_cmd[target_file_window_location] ..
            ' resize ' ..
            target_file_window_size ..
            ' | set nowrap | redraw | '
        local split_cmd = location_split_cmd[target_file_window_location] .. 'new | set nowrap | redraw | '
        return { open_cmd = open_cmd, split_cmd = split_cmd }
    else
        return 'FTermOpen \n'
    end
end

-- Generates command to preview the window
function window_preview_cmd()
    local window_cmds = window_open_cmd()
    if target_file_window_location <= 4 then
        return (window_cmds.open_cmd .. window_cmds.split_cmd .. 'sleep 500m | bd! | bd!')
    else
        return (window_cmds .. 'redraw \n sleep 500m \n FTermClose')
    end
end

function window_reset()
    target_file_window_size = 60
    target_file_window_location = 2
end

function window_size_reset(window_size)
    window_size = tonumber(window_size)
    target_file_window_size = 20
    if (target_file_window_location % 2 == 0) then
        target_file_window_size = 60
    end
    target_file_window_size = window_size or target_file_window_size
end

function window_location_reset(window_location)
    window_location = tonumber(window_location)
    local old_location = target_file_window_location
    target_file_window_location = window_location or target_file_window_location
    if old_location % 2 ~= target_file_window_location % 2 then
        window_size_reset()
    end
end

-- Target file related
function file_path_reset(file_path)
    if file_path == '' or file_path == nil then
        file_path = vim.fn.expand('%:p')
    end
    target_file_path = file_path
    print(target_file_path)
end

function file_ext(flnm)
    return flnm:match("(%.%w+)$") or ""
end

function file_name(flnm)
    return flnm:sub(string.find(flnm, "/[^/]*$") + 1, #flnm - #file_ext(flnm))
end

function expand_to_cmd(unexpanded_cmd)
    local expanded_cmd = string.gsub(unexpanded_cmd, "%%fp", target_file_path)
    expanded_cmd = string.gsub(expanded_cmd, "%%fen",
        target_file_path:sub(0, #target_file_path - #file_ext(target_file_path)))
    expanded_cmd = string.gsub(expanded_cmd, "%%fben",
        target_file_path:sub(0, #target_file_path - #file_ext(target_file_path) - #file_name(target_file_path)) ..
        '.build/' .. file_name(target_file_path))
    expanded_cmd = string.gsub(expanded_cmd, "%%fdb",
        target_file_path:sub(0, #target_file_path - #file_ext(target_file_path) - #file_name(target_file_path)) ..
        '.build/')
    expanded_cmd = string.gsub(expanded_cmd, "%%fn", file_name(target_file_path))
    return expanded_cmd
end
