function onCreatePost()
makeLuaSprite('whitebg', '', 0, 0)
setScrollFactor('whitebg', 0, 0)
makeGraphic('whitebg', 3840, 2160, 'ffffff')
addLuaSprite('whitebg', false)
screenCenter('whitebg', 'xy')
setProperty('gf.visible', false)

if songName == 'Amostradinho' then
setProperty('whitebg.color', getColorFromHex('162138'))

elseif songName == 'Sla q bixo vei eh esse' then
setProperty('whitebg.color', getColorFromHex('898989'))

elseif songName == 'Vibes Songs' then
setProperty('whitebg.color', getColorFromHex('000000'))
end
end