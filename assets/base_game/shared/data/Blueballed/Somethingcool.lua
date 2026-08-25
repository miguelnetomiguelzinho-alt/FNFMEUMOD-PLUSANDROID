function onCreate()
    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)
    setProperty('defaultCamZoom', 2)
    end

    function onSongStart()
    setProperty('camGame.alpha', 1)
    setProperty('camHUD.alpha', 1)
        setProperty('defaultCamZoom', 2)
        end
        


function onEvent(n,v1,v2)
    if n == 'camera_target' then
    if v1 == 'all' then
    folowcam = true
    
    else
    folowcam = false
     end
    end
    end
    
    

    function onEvent(n,v1,v2)
        if n == 'camera_target' then
        if v1 == 'all' then
        folowcam = true
        
        else
        folowcam = false
         end
        end
        end
        
        
        folowcam = false
        camX = 1300
        camY = 700
        function onUpdate()
        
        if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
        end
        end



        