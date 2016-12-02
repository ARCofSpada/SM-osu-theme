return Def.ActorFrame{

    Def.Sprite{
        OnCommand=function(self)
            self:Load(loadOsuGraphic("playfield"));
            self:FullScreen()
        end;
    };
};