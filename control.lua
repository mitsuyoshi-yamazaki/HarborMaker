--require("prototypes.ground_zero")


script.on_event({defines.events.on_tick}, function (e)
  if e.tick % 60 == 0 then
    --PlayerPrint("hoge")
  end
end)

function PlayerPrint(message)
	for _,player in pairs(game.players) do
		player.print(message)
	end
end

script.on_event(defines.events.on_trigger_created_entity, function(event)
    local ent = event.entity
    PlayerPrint(ent.name)
    PlayerPrint(ent.position)
    if ent.name == "small-scorchmark" then -- this is the left upper quarter of the explosion graphics
      PlayerPrint("ATOMIC BLAST!!")
      local p = ent.position
      local tiles = {}

      math.randomseed(p.x)

      local r = math.random(14) + 1
      local r2 = r * r

      for x = p.x-r, p.x+r do
        local dx = p.x - x
        for y = p.y-r, p.y+r do
          local dy = p.y - y
          if ((dx * dx) + (dy * dy)) < r2 then
            table.insert( tiles , { name = "water" , position = { x = x , y = y }})
          end
        end
      end

      game.players[1].surface.set_tiles(tiles)  -- fuck

    end
end)

-- /c game.player.insert({ name = "rocket-launcher", count=1})
-- /c game.player.insert({ name = "atomic-bomb", count=100})