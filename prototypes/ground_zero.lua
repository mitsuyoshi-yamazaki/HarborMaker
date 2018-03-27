function add_mushroom_cloud_effect(effect)
    table.insert(effect, 2, {
                            type = "create-entity",
                            entity_name = "small-scorchmark",
                            trigger_created_entity = "true"                
                        })
end


local projectiles = 
{
    data.raw["projectile"]["atomic-rocket"],
}

for k,i in pairs(projectiles) do
    if i ~= nil then
        add_mushroom_cloud_effect(i.action.action_delivery.target_effects)
        --remove_vanilla_effect(i.action.action_delivery.target_effects)
    end
end