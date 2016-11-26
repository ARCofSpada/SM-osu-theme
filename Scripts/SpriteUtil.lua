--If you're wondering why I can't use THEME:GetPathG(): https://github.com/stepmania/stepmania/issues/1351
function loadOsuGraphic(fileName)
        --Path to osu theme directory. FILEMAN:DoesFileExist() assumes you're working from the StepMania directory
        local path = THEME:GetCurrentThemeDirectory().."Graphics/_skin/"
        
        local file2x = path..fileName.."@2x.png";
        local file = path..fileName..".png"
        
        if FILEMAN:DoesFileExist(file2x) then
            return THEME:GetPathG("", "_skin/"..fileName.."@2x.png")
        elseif FILEMAN:DoesFileExist(file) then
            return THEME:GetPathG("", "_skin/"..fileName..".png")
        else
            return THEME:GetPathG("", "_fallback/"..fileName..".png")
        end;
end