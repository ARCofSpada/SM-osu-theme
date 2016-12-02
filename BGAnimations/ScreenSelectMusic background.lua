local t = Def.ActorFrame{

    LoadActor(THEME:GetPathG("","common fallback background"))..{
    InitCommand=cmd(scaletocover,0,0,1280,720);
    
    };
    
    Def.Banner{
    --InitCommand=cmd(y,SCREEN_CENTER_Y);
    CurrentSongChangedMessageCommand=function(self)
            local song = GAMESTATE:GetCurrentSong();
            if song then
                if song:HasBackground() then
                    local background = song:GetBackgroundPath();
                    self:Load(background);
                    local bgWidth = self:GetWidth();
                    --self:x(bgWidth/2); --SM centers graphics, so find center
                    --self:addx(-20); --Shift to the left a bit because the song wheel covers some stuff
                    self:diffusealpha(1);
                else
                    self:diffusealpha(0);
                    --self:Load();
                end
                --self:basezoomy(1000)
                --self:zoomtowidth(530)
                self:scaletocover(0,0,1280,720)
            else
                self:diffusealpha(0);
            end;
		end;
    };


};
return t;