--[[if FILEMAN:DoesFileExist(THEME:GetPathG("", "@")) then
    SCREENMAN:SystemMessage("true");
else
    SCREENMAN:SystemMessage("false")
end;]]
SCREENMAN:SystemMessage(THEME:GetCurrentThemeDirectory());

return Def.ActorFrame{

    LoadActor(loadOsuGraphic("menu-background"))..{
        InitCommand=cmd(Center;scaletocover,0,0,1280,720);
    
    }
    

};