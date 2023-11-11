function love.load()
    toggleButton = {
        x = 10,
        y = 10,
        width = 100,
        height = 40,
        text = "Open",
        font = love.graphics.newFont(20),
        backgroundColor = {0.188, 0.188, 0.188},
        textColor = {0.867, 0.867, 0.867},
        isOpen = false
    }

    executorMenu = {
        x = 50,
        y = 50,
        width = 500,
        height = 400,
        backgroundColor = {0.129, 0.129, 0.129},
        borderColor = {0.192, 0.192, 0.192},
        titleFont = love.graphics.newFont(24),
        inputFont = love.graphics.newFont(18),
        buttonFont = love.graphics.newFont(16),
        scriptInput = "",
        runButton = {
            x = 50,
            y = 300,
            width = 150,
            height = 40,
            backgroundColor = {0.267, 0.753, 0.314},
            textColor = {0.0, 0.0, 0.0},
            text = "Execute"
        },
        clearButton = {
            x = 210,
            y = 300,
            width = 150,
            height = 40,
            backgroundColor = {0.957, 0.263, 0.212},
            textColor = {0.0, 0.0, 0.0},
            text = "Clear"
        }
    }
end

function love.draw()
    love.graphics.setBackgroundColor(0.063, 0.063, 0.063)

    love.graphics.setColor(executorMenu.backgroundColor)
    love.graphics.rectangle("fill", executorMenu.x, executorMenu.y, executorMenu.width, executorMenu.height)
    love.graphics.setColor(executorMenu.borderColor)
    love.graphics.rectangle("line", executorMenu.x, executorMenu.y, executorMenu.width, executorMenu.height)

    love.graphics.setFont(executorMenu.titleFont)
    love.graphics.setColor(1.0, 1.0, 1.0)
    love.graphics.printf("ScriptLabs.LOL", executorMenu.x, executorMenu.y + 20, executorMenu.width, "center")

    if toggleButton.isOpen then
        love.graphics.setFont(executorMenu.inputFont)
        love.graphics.setColor(1.0, 1.0, 1.0)
        love.graphics.rectangle("fill", executorMenu.x + 10, executorMenu.y + 70, executorMenu.width - 20, 40)
        love.graphics.setColor(0.0, 0.0, 0.0)
        love.graphics.printf(executorMenu.scriptInput, executorMenu.x + 20, executorMenu.y + 80, executorMenu.width - 40, "left")

        love.graphics.setColor(executorMenu.runButton.backgroundColor)
        love.graphics.rectangle("fill", executorMenu.runButton.x, executorMenu.runButton.y, executorMenu.runButton.width, executorMenu.runButton.height)
        love.graphics.setColor(executorMenu.runButton.textColor)
        love.graphics.setFont(executorMenu.buttonFont)
        love.graphics.printf(executorMenu.runButton.text, executorMenu.runButton.x, executorMenu.runButton.y + 10, executorMenu.runButton.width, "center")

        love.graphics.setColor(executorMenu.clearButton.backgroundColor)
        love.graphics.rectangle("fill", executorMenu.clearButton.x, executorMenu.clearButton.y, executorMenu.clearButton.width, executorMenu.clearButton.height)
        love.graphics.setColor(executorMenu.clearButton.textColor)
        love.graphics.setFont(executorMenu.buttonFont)
        love.graphics.printf(executorMenu.clearButton.text, executorMenu.clearButton.x, executorMenu.clearButton.y + 10, executorMenu.clearButton.width, "center")
    end

    love.graphics.setFont(toggleButton.font)
    love.graphics.setColor(toggleButton.backgroundColor)
    love.graphics.rectangle("fill", toggleButton.x, toggleButton.y, toggleButton.width, toggleButton.height)
    love.graphics.setColor(toggleButton.textColor)
    love.graphics.printf(toggleButton.text, toggleButton.x, toggleButton.y + 10, toggleButton.width, "center")
end

function love.mousepressed(x, y, button)
    if button == 1 then
        if x >= toggleButton.x and x <= toggleButton.x + toggleButton.width and y >= toggleButton.y and y <= toggleButton.y + toggleButton.height then
            toggleButton.isOpen = not toggleButton.isOpen
            toggleButton.text = toggleButton.isOpen and "Close" or "Open"
            executorMenu.scriptInput = ""
        elseif toggleButton.isOpen then
            if x >= executorMenu.runButton.x and x <= executorMenu.runButton.x + executorMenu.runButton.width and y >= executorMenu.runButton.y and y <= executorMenu.runButton.y + executorMenu.runButton.height then
                executeScript()
            elseif x >= executorMenu.clearButton.x and x <= executorMenu.clearButton.x + executorMenu.clearButton.width and y >= executorMenu.clearButton.y and y <= executorMenu.clearButton.y + executorMenu.clearButton.height then
                executorMenu.scriptInput = ""
            end
        end
    end
end

function love.textinput(text)
    if toggleButton.isOpen then
        executorMenu.scriptInput = executorMenu.scriptInput .. text
    end
end

function executeScript()
    print("Executing script: " .. executorMenu.scriptInput)
    executorMenu.scriptInput = ""
end
