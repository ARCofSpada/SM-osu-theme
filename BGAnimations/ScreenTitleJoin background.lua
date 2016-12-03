--[[if FILEMAN:DoesFileExist(THEME:GetPathG("", "@")) then
    SCREENMAN:SystemMessage("true");
else
    SCREENMAN:SystemMessage("false")
end;]]
--SCREENMAN:SystemMessage(THEME:GetCurrentThemeDirectory());


--Because SM doesn't have a fucking HasPreview() function!
local function getSongWithPreview()
    local HasPreview = false;
    local songPath = "";
    local attempts = 0;
    
    while (HasPreview == false and attempts < 25)do
        local song = SONGMAN:GetRandomSong();
        songPath = song:GetPreviewMusicPath();
        if songPath ~= "" then
            HasPreview = true;
        else
            attempts = attempts + 1;
        end;
    end;
    
    return songPath;
end;

local songPreview = getSongWithPreview();
--SCREENMAN:SystemMessage(songPreview);

local function playSample()
    local song = SONGMAN:GetRandomSong();
    local songSample = song:GetSampleStart();
    --[[if songSample == 0 then
        getSongWithPreview();
    else
        local timingData = song:GetTimingData();
    end;]]
    if song:GetMusicPath() ~= nil then
        --SCREENMAN:SystemMessage(song:GetMusicPath());
        SCREENMAN:SystemMessage(song:GetSampleLength());
        SOUND:PlayMusicPart(song:GetMusicPath(),songSample,song:GetSampleLength(),0,0,false,false,true)
    end;
end;

--playSample();

return Def.ActorFrame{

    LoadActor(loadOsuGraphic("menu-background"))..{
        InitCommand=cmd(Center;scaletocover,0,0,1280,720);
    
    };
    LoadActor(songPreview)..{
        OnCommand=cmd(play);
        OffCommand=cmd(stop);
    };
    
    LoadActor(loadOsuSound("click-short"))..{
        OnCommand=cmd(play);
    };
    
    Def.Quad{
        InitCommand=function(self)
            self:setsize(1280,20);
            self:Center();
        end;
        --OnCommand=cmd(effectclock,"beat";diffuseramp;effectcolor1,color(".4,.4,.4,1");effectcolor2,color("1,1,1,1"));
    };
    

};