return Def.Sprite {
    InitCommand=function(self)
        self:Load(loadOsuGraphic("menu-button-background"))
    end;
    OnCommand=cmd(zoom,0.5);
};