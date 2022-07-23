local ref = {
	pitch     		 = menu.find("antiaim","main","angles","pitch"),
	yawbase   		 = menu.find("antiaim","main","angles","yaw base"),
	yawadd    		 = menu.find("antiaim","main","angles","yaw add"),
	rotate    		 = menu.find("antiaim","main","angles","rotate"),
	jmode  	  		 = menu.find("antiaim","main","angles","jitter mode"),
	jtype 	  		 = menu.find("antiaim","main","angles","jitter type"),
	jadd 	  		 = menu.find("antiaim","main","angles","jitter add"),
	bodylean  		 = menu.find("antiaim","main","angles","body lean"),
	sidestand 		 = menu.find("antiaim","main","desync","side#stand"),
	sidemove  		 = menu.find("antiaim","main","desync","override stand#move"),
	sidesw 	  		 = menu.find("antiaim","main","desync","override stand#slow walk"),
    l_fake           = menu.find("antiaim","main","desync","left amount"),
    r_fake           =  menu.find("antiaim","main","desync","right amount"),
}

menu.add_text("*>", '@' .. user.name .. ' [debug]')
local tabs           =  menu.add_selection("*>", " > Selection", {"Anti-Aim", 'Visuals', 'Player List'})
local antiaim_en 	 =  menu.add_checkbox("*>", "Override")
local breaker 		 =  menu.add_multi_selection("*>", "Break animations", {"Static legs on ground", "Static legs in Air"})
local selection      =  menu.add_selection("*>", "Preset", {"Custom", 'Aggresive', 'Jitter', 'Danger'})
local type           =  menu.add_selection("*>", "Type", {"Cheat Based", 'Solace'})
local states         =  menu.add_selection("*>", "Override Condition:", {"Stand","Crouch","Air","Air-C","Moving"})
local logs         	 =  menu.add_checkbox("*>", 'Custom logs on Screen')
local trashtalk      =  menu.add_checkbox("*>", 'Say on Kill')
local hitmarker      =  menu.add_checkbox("*>", 'Hit Marker')
local damage_marker  =  menu.add_checkbox("*>", 'Damage Marker')
local indicators     =  menu.add_selection("*>", "Indicators", {"Disabled", 'Default', 'Modern'})
local arrow          =  menu.add_selection("*>", "Arrows", {"Disabled", 'Team Skeet'})
local hitmarkercol   =  hitmarker:add_color_picker("Highlight color")
local highcol 		 =  indicators:add_color_picker("Highlight color")
local damagecol      =  damage_marker:add_color_picker("Highlight color")
local arrow_col      =  arrow:add_color_picker("Highlight color")
local arrow_col1     =  arrow:add_color_picker("Manual color")
local stand = {
	yawadd_lS        =  menu.add_slider("*>", "[S] Yaw Add Left", -180, 180),
	yawadd_rS        =  menu.add_slider("*>", "[S] Yaw Add Right", -180, 180),
	jitter_type      =  menu.add_selection("*>", "[S] Jitter type", {"Disabled","Center","Offset","Spin"}),
	jitter_degree    =  menu.add_slider("*>", "[S] Jitter Degree", -180, 180),
    bodyyaw   =  menu.add_slider("*>", "[S] Body Yaw", -180, 180),
}
local crouch = {
	yawadd_lC        =  menu.add_slider("*>", "[C] Yaw Add Left", -180, 180),
	yawadd_rC        =  menu.add_slider("*>", "[C] Yaw Add Right", -180, 180),
	jitter_type      =  menu.add_selection("*>", "[C] Jitter type", {"Disabled","Center","Offset","Spin"}),
	jitter_degree    =  menu.add_slider("*>", "[C] Jitter Degree", -180, 180),
    bodyyaw   =  menu.add_slider("*>", "[C] Body Yaw", -180, 180),
}
local jump = {
	yawadd_lJ        =  menu.add_slider("*>", "[J] Yaw Add Left", -180, 180),
	yawadd_rJ        =  menu.add_slider("*>", "[J] Yaw Add Right", -180, 180),
	jitter_type      =  menu.add_selection("*>", "[J] Jitter type", {"Disabled","Center","Offset","Spin"}),
	jitter_degree    =  menu.add_slider("*>", "[J] Jitter Degree", -180, 180),
    bodyyaw   =  menu.add_slider("*>", "[J] Body Yaw", -180, 180),
}
local airc = {
	yawadd_lAC       =  menu.add_slider("*>", "[JC] Yaw Add Left", -180, 180),
	yawadd_rAC       =  menu.add_slider("*>", "[JC] Yaw Add Right", -180, 180),
	jitter_type      =  menu.add_selection("*>", "[JC] Jitter type", {"Disabled","Center","Offset","Spin"}),
	jitter_degree    =  menu.add_slider("*>", "[JC] Jitter Degree", -180, 180),
    bodyyaw   =  menu.add_slider("*>", "[JC] Body Yaw", -180, 180),
}
local move = {
	yawadd_lM        =  menu.add_slider("*>", "[M] Yaw Add Left", -180, 180),
	yawadd_rM        =  menu.add_slider("*>", "[M] Yaw Add Right", -180, 180),
	jitter_type      =  menu.add_selection("*>", "[M] Jitter type", {"Disabled","Center","Offset","Spin"}),
	jitter_degree    =  menu.add_slider("*>", "[M] Jitter Degree", -180, 180),
    bodyyaw   =  menu.add_slider("*>", "[M] Body Yaw", -180, 180),
}
local c_stand = {
    c_yawadd_lS        =  menu.add_slider("*>", "[*S] Yaw Add Left", -180, 180),
    c_yawadd_rS        =  menu.add_slider("*>", "[*S] Yaw Add Right", -180, 180),
    c_jitter_type      =  menu.add_selection("*>", "[*S] Jitter type", {"Disabled","Center","Offset"}),
    c_jitter_degree    =  menu.add_slider("*>", "[*S] Jitter Degree", -180, 180),
    c_fakeL             =  menu.add_slider("*>", "[*S] Fake Left", 0, 100),
    c_fakeR             =  menu.add_slider("*>", "[*S] Fake Right", 0, 100),
}
local c_crouch = {
    c_yawadd_lC        =  menu.add_slider("*>", "[*C] Yaw Add Left", -180, 180),
    c_yawadd_rC        =  menu.add_slider("*>", "[*C] Yaw Add Right", -180, 180),
    c_jitter_type      =  menu.add_selection("*>", "[*C] Jitter type", {"Disabled","Center","Offset"}),
    c_jitter_degree    =  menu.add_slider("*>", "[*C] Jitter Degree", -180, 180),
    c_fakeL             =  menu.add_slider("*>", "[*C] Fake Left", 0, 100),
    c_fakeR             =  menu.add_slider("*>", "[*C] Fake Right", 0, 100),
}
local c_jump = {
    c_yawadd_lJ        =  menu.add_slider("*>", "[*J] Yaw Add Left", -180, 180),
    c_yawadd_rJ        =  menu.add_slider("*>", "[*J] Yaw Add Right", -180, 180),
    c_jitter_type      =  menu.add_selection("*>", "[*J] Jitter type", {"Disabled","Center","Offset"}),
    c_jitter_degree    =  menu.add_slider("*>", "[*J] Jitter Degree", -180, 180),
    c_fakeL             =  menu.add_slider("*>", "[*J] Fake Left", 0, 100),
    c_fakeR             =  menu.add_slider("*>", "[*J] Fake Right", 0, 100),
}
local c_airc = {
    c_yawadd_lAC       =  menu.add_slider("*>", "[*JC] Yaw Add Left", -180, 180),
    c_yawadd_rAC       =  menu.add_slider("*>", "[*JC] Yaw Add Right", -180, 180),
    c_jitter_type      =  menu.add_selection("*>", "[*JC] Jitter type", {"Disabled","Center","Offset"}),
    c_jitter_degree    =  menu.add_slider("*>", "[*JC] Jitter Degree", -180, 180),
    c_fakeL             =  menu.add_slider("*>", "[*JC] Fake Left", 0, 100),
    c_fakeR             =  menu.add_slider("*>", "[*JC] Fake Right", 0, 100),
}
local c_move = {
    c_yawadd_lM        =  menu.add_slider("*>", "[*M] Yaw Add Left", -180, 180),
    c_yawadd_rM        =  menu.add_slider("*>", "[*M] Yaw Add Right", -180, 180),
    c_jitter_type      =  menu.add_selection("*>", "[*M] Jitter type", {"Disabled","Center","Offset"}),
    c_jitter_degree    =  menu.add_slider("*>", "[*M] Jitter Degree", -180, 180),
    c_fakeL             =  menu.add_slider("*>", "[*M] Fake Left", 0, 100),
    c_fakeR             =  menu.add_slider("*>", "[*M] Fake Right", 0, 100),
}
local cfg         	 =  menu.add_selection("*>", "Settings", {"Developer"})
local load 			 =  menu.add_button("*>", "Load", function()
if cfg:get() == 1 then
    airc.yawadd_lAC:set(-9)
	airc.yawadd_rAC:set(18)
	airc.jitter_type:set(2)
	airc.jitter_degree:set(28)
	crouch.yawadd_lC:set(-18)
	crouch.yawadd_rC:set(28)
	crouch.jitter_type:set(2)
	crouch.jitter_degree:set(18)
	jump.yawadd_lJ:set(-5)
	jump.yawadd_rJ:set(14)
	jump.jitter_type:set(2)
	jump.jitter_degree:set(42)
	move.yawadd_lM:set(-10)
	move.yawadd_rM:set(16)
	move.jitter_type:set(2)
	move.jitter_degree:set(44)
	stand.yawadd_lS:set(-18)
	stand.yawadd_rS:set(9)
	stand.jitter_type:set(2)
	stand.jitter_degree:set(28)
end
end)
 local killsay_phrases = {
    "эй дэвушка ваша мама гроб не нужен?",
    "если я скажу мат, например бля меня папа бьдывэфsdaf",
    "азамат азамат азамат мне папа даст пизды",
    "я Mather finder: ваша мама сейчас в гробу, если мы вам помогли, крутаните рулетку",
    "анекдот: черные люди живут лучше белых, потому что много работают",
    "твоя мама герой, иметь сына дауна это тяжело",
    "анекдот: негр не работал",
    "еблан теперь кровь языком слизывай, нахуя под пулю залез",
    "а где даблтап в резольвере?",
    "чел ты еблан тупой",
    "АА как у асидтеча ты что еблан?",
    "норм ты шалава везучая я твой рот ебал изи",
    "бро а шо эта за антиаимка?",
    "я кароч ща заинжектил чит какойто и жестко обоссал тебя изи",
    "я Mather finder: итак, ваша мама теперь у меня под столом, хз, сказала пыль протирает",
    "я работаю в картеле, убиваю людей и собак, шучу я люблю животных",
    "если бы ты был кошкой то я б тебя выебал, дозревай собака",
    "1.",
    "ti ebanua shluha ya polka cybersportsmen",
    "ize dog",
    "1 /ez/",
    "1. дог сак май член",
    "1. я тебя и на пабе обоссал и кв выебу - HolaTV#8664",
    "переигран.",
    "координаты твоей мамы: мой стол по y - 10",
    'скит?',
}
local isDT = menu.find("aimbot", "general", "exploits", "doubletap", "enable") -- get doubletap
local isHS = menu.find("aimbot", "general", "exploits", "hideshots", "enable") -- get hideshots
local isAP = menu.find("aimbot", "general", "misc", "autopeek", "enable") -- get autopeek
local isSW = menu.find("misc","main","movement","slow walk", "enable") -- get Slow Walk
local isMD = menu.find("aimbot", "scout", "target overrides", "force min. damage") -- get damage override
local isBA = menu.find("aimbot", "scout", "target overrides", "force hitbox") -- get froce baim
local isSP = menu.find("aimbot", "scout", "target overrides", "force safepoint") -- get safe point
local isAA = menu.find("antiaim", "main", "angles", "yaw base") -- get yaw base
local isLEFT = menu.find("antiaim", "main", "manual", "left") -- get yaw base
local isRIGHT = menu.find("antiaim", "main", "manual", "right") -- get yaw base
local animations = {
    speed = 3.2,
    stored_values = {},
    active_this_frame = {},
    prev_realtime = global_vars.real_time(),
    realtime = global_vars.real_time(),
    multiplier = 0.0,
    clamp = function(b, c, d)
        return b > d and d or (b < c and c or b)
    end,
    new_frame = function(self)
        self.prev_realtime = self.realtime
        self.realtime = global_vars.real_time()
        self.multiplier = (self.realtime - self.prev_realtime) * self.speed
        for e, b in pairs(self.stored_values) do
            if self.active_this_frame[e] == nil then
                self.stored_values[e] = nil
            end
        end
        self.active_this_frame = {}
    end,
    reset = function(self, f)
        self.stored_values[f] = nil
    end,
    animate = function(self, f, g, h)
        h = h or 1.0
        g = g or false
        local i = self.multiplier * (g and -1 or 1)
        local b = self.clamp(self.stored_values[f] and self.stored_values[f] or 0.0, 0.0, h)
        b = self.clamp(b + i, 0.0, h)
        self.stored_values[f] = b
        self.active_this_frame[f] = true
        return b
    end
}
local function lerp(start, vend, time)
    return start + (vend - start) * time
end

math.calc_count = function(string, search)
    local count = 0

    for i = 1, #string do
        if string:sub(i, i) == search then
            count = count + 1
        end
    end

    return count
end

MultiColorText = function(string, x, y, font_size)
    local old_text_size = 0

    for i = 1, math.calc_count(string, "{") do
        local start_prefix = string:find('{')
        local end_prefix = string:find('}')

        local string_color = string:sub(start_prefix, end_prefix)
        local load_color = loadstring('return ' .. string_color)()
        local next_string = string:sub(end_prefix + 1)
        local main_font = render.create_font("verdana", font_size, 0)
        local next_prefix_start = next_string:find('{')
        local new_string = next_prefix_start and next_string:sub(1, next_prefix_start - 1) or next_string

        string = next_string

        local color = color_t(unpack(load_color))

        render.text(main_font, new_string, vec2_t(x + old_text_size, y), color)

        old_text_size = old_text_size + render.get_text_size(main_font, new_string).x
    end
end
local prediction = render.create_font("smallest pixel-7", 11, 0, e_font_flags.DROPSHADOW,e_font_flags.ANTIALIAS)
local verdana = render.create_font("Verdana", 12, 800, e_font_flags.DROPSHADOW,e_font_flags.ANTIALIAS)
local function on_world_hitmarker(screen_pos, world_pos, alpha_factor, damage, is_lethal, is_headshot)
if hitmarker:get() then
render.push_alpha_modifier(alpha_factor)
render.line(vec2_t(screen_pos.x - 1, screen_pos.y - 5), vec2_t(screen_pos.x - 1, screen_pos.y), hitmarkercol:get())
render.line(vec2_t(screen_pos.x, screen_pos.y - 5), vec2_t(screen_pos.x, screen_pos.y), hitmarkercol:get())
render.line(vec2_t(screen_pos.x - 5, screen_pos.y - 1), vec2_t(screen_pos.x, screen_pos.y - 1), hitmarkercol:get())
render.line(vec2_t(screen_pos.x - 5, screen_pos.y), vec2_t(screen_pos.x, screen_pos.y), hitmarkercol:get())
render.line(vec2_t(screen_pos.x - 1, screen_pos.y + 4), vec2_t(screen_pos.x - 1, screen_pos.y), hitmarkercol:get())
render.line(vec2_t(screen_pos.x, screen_pos.y + 4), vec2_t(screen_pos.x, screen_pos.y), hitmarkercol:get())
render.line(vec2_t(screen_pos.x + 4, screen_pos.y - 1), vec2_t(screen_pos.x, screen_pos.y - 1), hitmarkercol:get())
render.line(vec2_t(screen_pos.x + 4, screen_pos.y), vec2_t(screen_pos.x, screen_pos.y), hitmarkercol:get())
render.pop_alpha_modifier()
end
    return true
end

local hitlogs = {}
local hitgroups = {
    [0] = "generic",
    [1] = "head",
    [2] = "chest",
    [3] = "stomach",
    [4] = "left arm",
    [5] = "right arm",
    [6] = "left leg",
    [7] = "right leg",
    [10] = "gear"
}
local function on_aimbot_miss(miss)
	local text1
   	local text2
   	text1 = string.format('{255,255,255,255}Missed {205,139,139,255}%s`{255,255,255,255}s in the {204,139,139,255}%s{255,255,255,255} due to {204,139,139,255}%s', miss.player:get_name(),hitgroups[miss.aim_hitgroup], miss.reason_string)
   	text2 = string.format('Missed %s`s in the %s due to %s', miss.player:get_name(),hitgroups[miss.aim_hitgroup], miss.reason_string)
    table.insert(hitlogs, {
	text1 = text1,
	text2 = text2,
	alpha = 0,
	x = 0,
	time = global_vars.real_time()})
end
local function on_aimbot_hit(hit)
	local text1
	local text2
    text1 = string.format('{255,255,255,255}Hit {108,195,18,255}%s{255,255,255,255} in the {108,195,18,255}%s {255,255,255,255}for {108,195,18,255}%s{255,255,255,255} ({108,195,18,255}%s{255,255,255,255} health remaining)', hit.player:get_name(),hitgroups[hit.hitgroup], hit.damage, hit.player:get_prop('m_iHealth'))
    text2 = string.format('Hit %s in the %s for %s(%s health remaining)', hit.player:get_name(),hitgroups[hit.hitgroup], hit.damage, hit.player:get_prop('m_iHealth'))
    table.insert(hitlogs, {
	text1 = text1,
	text2 = text2,
	alpha = 0,
	x = 0,
	time = global_vars.real_time()})
end
parse = function()
return killsay_phrases[client.random_int(1, #killsay_phrases)]:gsub('\"', '')
end
local hitgroup_to_hitbox = {0, 5, 2, 13, 14, 7, 8}
local show_time = 2
local array = {}
local shot_data = {}
local function damagemarker_render()
    --local lp = entity_list.get_local_player()
    --if not lp then return end
    if not damage_marker:get() then return end
    local realtime = global_vars.real_time()
    local frametime = global_vars.frame_time()
    for i=1, #shot_data do
        local shot = shot_data[i]
        if shot.draw then
        if shot.position.z >= shot.target then
            shot.alpha = shot.alpha - 1
        end
        if shot.alpha <= 0 then
            shot.draw = false
        end
        if shot.remains == 0 then
            color = color_t(155, 200, 21)
        else
            color = damagecol:get()
        end
        local wts = render.world_to_screen(shot.position)
        if wts ~= nil then
        render.push_alpha_modifier(shot.alpha/255)
        render.text(verdana, tostring(shot.damage), wts, color)
        render.pop_alpha_modifier()
        end
        end
        shot.position.z = shot.position.z + 150 * frametime
        end
    --[[for k, v in ipairs(array) do
        v.position.z = v.position.z + 50 * frametime
        if v.position.z >= v.target then
            v.alpha = v.alpha - 1
        end
        if v.alpha <= 0 then
            table.remove(array, k)
        end
        render.push_alpha_modifier(v.alpha/255)
        if v.remains <= 0 then
            color = color_t(155, 200, 21)
        else
            color = damagecol:get()
        end
        local pos = render.world_to_screen(v.position)
        if pos ~= nil then
        render.text(verdana, tostring(v.damage), vec2_t(pos.x,pos.y), color)
        end
        render.pop_alpha_modifier()]]

end
local function damagemarker_event(event)
    if not damage_marker:get() then return end
    if event.name ~= 'player_hurt' then
        return
    end

    local victim = entity_list.get_player_from_userid(event.userid) 
    local attacker = entity_list.get_player_from_userid(event.attacker)

    if attacker == nil or victim == nil then
        return
    end

    if attacker ~= entity_list.get_local_player() then
        return
    end

    local lol = victim:get_render_origin() 
    local x, y, z = lol.x, lol.y, lol.z
    local duck_amount = victim:get_prop("m_flDuckAmount")
    z = z + (46 + (1 - duck_amount) * 18)

   --[[ local hitgroup = event.hitgroup
    local hitbox = hitgroup_to_hitbox[hitgroup]
    if hitbox == nil then
        hitbox = 5
    end
    local position = victim:get_hitbox_pos(hitbox)]]

    shot_data[#shot_data + 1] = {
        position = lol,
        target  = lol.z + 100,
        damage  = event.dmg_health,
        alpha   = 255,
        draw    = true,
        remains = event.health
       --[[ time = global_vars.real_time() + show_time,
        damage = event.dmg_health,
        remains = event.health,
        alpha = 255,
        position = position,
        target = position.z + 50,
        hitgroup = hitgroups[hitgroup]]
    }
end
local function trashtalk_event(event)
if trashtalk:get() then
	if event.name ~= 'player_death' then return end
	
	local victim = entity_list.get_player_from_userid(event.userid)	
	if not victim then return end
	local attacker = entity_list.get_player_from_userid(event.attacker)
	if not attacker then return end
	if victim == attacker or attacker ~= entity_list.get_local_player() then return end
	engine.execute_cmd('say "' .. parse() .. '"')

	end

end
local function hitlogs_event(event)
    if event.name == "round_start" then
    	hitlogs = {}
    end
    if event.name ~="player_hurt" then return end

    local target_player = entity_list.get_player_from_userid(event.userid)
    if not target_player then return end

    local attacker_player = entity_list.get_player_from_userid(event.attacker)
    if not attacker_player then return end

    local wpn = event.weapon

    if target_player~=entity_list.get_local_player() and attacker_player==entity_list.get_local_player() then
    local prefix

    if wpn=="hegrenade"  then prefix = "Naded"
    elseif wpn=="taser" then prefix = "Zeused"
    elseif wpn=="inferno" then prefix = "Burned"
    elseif wpn=="knife" then prefix = "Knifed"
    else
    	return
    end

    local text1
	local text2
    text1 = string.format('{255,255,255,255}%s {108,195,18,255}%s{255,255,255,255} for {108,195,18,255}%s{255,255,255,255} ({108,195,18,255}%s{255,255,255,255} health remaining)', prefix, target_player:get_name(), event.dmg_health, event.health)
    text2 = string.format('%s %s for %s (%s health remaining)', prefix, target_player:get_name(), event.dmg_health, event.health)
    table.insert(hitlogs, {
	text1 = text1,
	text2 = text2,
	alpha = 0,
	x = 0,
	time = global_vars.real_time()})

    end

end
local jit = 1
local function jitter()

    if engine.get_choked_commands() ~= 0 then
       jit = jit * -1
    end

end
conditions = function()
    local lp = entity_list.get_local_player()
    local lp_vel = lp:get_prop("m_vecVelocity")
    local vel_real = math.floor(lp_vel:length2d())
    if bit.band(lp:get_prop("m_fFlags"), bit.lshift(1,0)) == 0 and lp:get_prop("m_flDuckAmount") == 1 then 
        return 'JUMPC'
    elseif bit.band(lp:get_prop("m_fFlags"), bit.lshift(1,0)) == 0 and lp:get_prop("m_flDuckAmount") ~= 1 then 
        return 'JUMP'
    elseif lp:get_prop("m_flDuckAmount") > 0.8 then 
        return 'CROUCH'
    elseif vel_real > 25 then 
        return 'MOVE'
    end
    return 'STAND'
end
local x_switch = 0
local main_font1 = render.create_font("verdana", 12, 0)
local screen_size = render.get_screen_size()
local quest = function(cond , T , F )
    if cond then return true else return false end
end
local function ts()
local rnd = client.random_int(1,2)
local ar_c = arrow_col:get()
local ar_b = arrow_col1:get()
if arrow:get() == 2 then
local lp = entity_list.get_local_player()
if lp then
if antiaim.get_manual_override() == 1 then
render.polygon({vec2_t(screen_size.x/2 + 43, screen_size.y/2 + 9), vec2_t(screen_size.x/2 + 56, screen_size.y/2), vec2_t(screen_size.x/2 + 43, screen_size.y/2 - 9)}, color_t(ar_b.r,ar_b.g,ar_b.b,255))
render.polygon({vec2_t(screen_size.x/2 - 43, screen_size.y/2 + 9), vec2_t(screen_size.x/2 - 56, screen_size.y/2), vec2_t(screen_size.x/2 - 43, screen_size.y/2 - 9)}, color_t(25,25,25,150))
elseif antiaim.get_manual_override() == 3 then
render.polygon({vec2_t(screen_size.x/2 + 43, screen_size.y/2 + 9), vec2_t(screen_size.x/2 + 56, screen_size.y/2), vec2_t(screen_size.x/2 + 43, screen_size.y/2 - 9)}, color_t(25,25,25,150))
render.polygon({vec2_t(screen_size.x/2 - 43, screen_size.y/2 + 9), vec2_t(screen_size.x/2 - 56, screen_size.y/2), vec2_t(screen_size.x/2 - 43, screen_size.y/2 - 9)}, color_t(ar_b.r,ar_b.g,ar_b.b,255))
else
render.polygon({vec2_t(screen_size.x/2 + 43, screen_size.y/2 + 9), vec2_t(screen_size.x/2 + 56, screen_size.y/2), vec2_t(screen_size.x/2 + 43, screen_size.y/2 - 9)}, color_t(25,25,25,150))
render.polygon({vec2_t(screen_size.x/2 - 43, screen_size.y/2 + 9), vec2_t(screen_size.x/2 - 56, screen_size.y/2), vec2_t(screen_size.x/2 - 43, screen_size.y/2 - 9)}, color_t(25,25,25,150))
end
if rnd == 1 then
render.rect_filled(vec2_t(screen_size.x/2 - 42, screen_size.y/2 - 9), vec2_t(2, 18), color_t(25,25,25,150))
render.rect_filled(vec2_t(screen_size.x/2 + 40, screen_size.y/2 - 9), vec2_t(2, 18), color_t(ar_c.r,ar_c.g,ar_c.b,255))
else
render.rect_filled(vec2_t(screen_size.x/2 - 42, screen_size.y/2 - 9), vec2_t(2, 18), color_t(ar_c.r,ar_c.g,ar_c.b,255))
render.rect_filled(vec2_t(screen_size.x/2 + 40, screen_size.y/2 - 9), vec2_t(2, 18), color_t(25,25,25,150))
end
end
end
end
local function hitlogsrender()
if logs:get() then
local y = render.get_screen_size().y - 330
if #hitlogs > 10 then 
    table.remove(hitlogs, 1) 
end
for i, hitlog in ipairs(hitlogs) do
        local hlalpha = math.floor(hitlog.alpha)
        x = render.get_screen_size().x / 2 - render.get_text_size(main_font1, hitlog.text2).x / 2
        hitlog.x = lerp(hitlog.x, x, 0.3)
        if hitlog.time + 8 < global_vars.real_time() then
                hitlog.x = lerp(hitlog.x, x + 1000, 0.01)
                hitlog.alpha = math.max(0, hitlog.alpha - 15)
        else
                hitlog.x = lerp(hitlog.x, x, 0.3)
                hitlog.alpha = math.min(hitlog.alpha + 3, 255)
        end
        if hitlog.time + 8.2 < global_vars.real_time() then 
            table.remove(hitlogs, i) 
        end
        render.push_alpha_modifier(hlalpha/255)
        MultiColorText(hitlog.text1, hitlog.x, y, 12)
        render.pop_alpha_modifier()
        y = y + 10
end
end
end

local function ad()
local lp = entity_list.get_local_player()
if not lp then return end
local cond = conditions()
local scoped = entity_list.get_local_player():get_prop("m_bIsScoped")
local add_y1 = 0
if scoped == 1 then
    x_switch = lerp(x_switch, 28,0.4)
else
    x_switch = lerp(x_switch, 0,0.4)
end
local w5 = render.get_text_size(prediction, 'SOLACE LUA')
render.pred = function(text, col, col2, col3, col4)
    local width = render.get_text_size(prediction, text)
    local alpha = animations:animate(text .. "_Center")
    render.push_alpha_modifier(alpha)
    render.text(prediction, text, vec2_t(screen_size.x / 2 - width.x / 2 + 1 + x_switch, screen_size.y / 2 + add_y1 + 41), color_t(col, col2, col3, 255))
    render.pop_alpha_modifier()
    add_y1 = add_y1 + 7
end
render.pred1 = function(text, col, col2, col3, col4)
    local width = render.get_text_size(prediction, text)
    local alpha = animations:animate(text .. "_Center")
    render.push_alpha_modifier(alpha)
    render.text(prediction, text, vec2_t(screen_size.x / 2 - width.x / 2 + w5.x/2 + 7, screen_size.y / 2 + add_y1 + 41), color_t(col, col2, col3, 255))
    render.pop_alpha_modifier()
    add_y1 = add_y1 + 7
end
animations:new_frame()
local col = highcol:get()
local w2 = render.get_text_size(prediction, 'SOLACELUA')
local w3 = render.get_text_size(prediction, 'SOLACE')
local w4 = render.get_text_size(prediction, 'ALPHA')
local w1 = render.get_text_size(prediction, cond)
if indicators:get() == 3 then
render.text(prediction, 'SOLACE', vec2_t(screen_size.x / 2 + 5, screen_size.y / 2 + 27), color_t(255,255,255, 255))
render.text(prediction, 'LUA', vec2_t(screen_size.x / 2 + 5 + w3.x + 2, screen_size.y / 2 + 27), color_t(col.r,col.g,col.b, 255))
local al12 = math.min(math.floor(math.sin((global_vars.real_time() % 3) * 4) * 125 + 200), 255)
render.push_alpha_modifier(al12)
render.text(prediction, 'ALPHA', vec2_t(screen_size.x / 2 + 5, screen_size.y / 2 + 34), color_t(col.r,col.g,col.b, 255))
render.pop_alpha_modifier()
render.text(prediction, 'ALPHA', vec2_t(screen_size.x / 2 + 5, screen_size.y / 2 + 34), color_t(col.r,col.g,col.b, 50))
render.text(prediction, cond, vec2_t(screen_size.x / 2 + w5.x/2 + w4.x - 13, screen_size.y / 2 + 34), color_t(255,255,255, 255))
if isDT[2]:get() then
if exploits.get_charge() >= 1 then
render.pred1('DT', 123, 194, 21)
end
if exploits.get_charge() < 1 then
render.pred1('DT', 100, 100, 100)
end
end
if isMD[2]:get() then
render.pred1('DMG', 200, 200, 255)
end
if isHS[2]:get() then
render.pred1('ONSHOT', 123, 194, 21)
end
if isBA[2]:get() then
render.pred1('BAIM', 255, 0, 0)
end
end
end
if indicators:get() == 2 then
if jit == 1 then
render.text(prediction, 'SOLACE', vec2_t(screen_size.x / 2 - w2.x / 2 + x_switch, screen_size.y / 2 + 27), color_t(255,255,255, 255))
render.text(prediction, 'LUA', vec2_t(screen_size.x / 2 - w2.x / 2 + w3.x + x_switch, screen_size.y / 2 + 27), color_t(col.r,col.g,col.b, 255))
render.text(prediction, cond, vec2_t(screen_size.x / 2 - w1.x / 2 + x_switch, screen_size.y / 2 + 34), color_t(col.r,col.g,col.b, 255))
else
render.text(prediction, 'SOLACE', vec2_t(screen_size.x / 2 - w2.x / 2 + x_switch, screen_size.y / 2 + 27), color_t(col.r,col.g,col.b, 255))
render.text(prediction, 'LUA', vec2_t(screen_size.x / 2 - w2.x / 2 + w3.x + x_switch, screen_size.y / 2 + 27), color_t(255,255,255, 255))
end
render.text(prediction, cond, vec2_t(screen_size.x / 2 - w1.x / 2 + x_switch, screen_size.y / 2 + 34), color_t(col.r,col.g,col.b, 255))
if isMD[2]:get() then
render.pred('DMG', 200, 200, 255)
end
if isHS[2]:get() then
render.pred('ONSHOT', 123, 194, 21)
end
if isDT[2]:get() then
if exploits.get_charge() >= 1 then
render.pred('DT', 123, 194, 21)
end
if exploits.get_charge() < 1 then
render.pred('DT', 100, 100, 100)
end
end
if isBA[2]:get() == 2 then
render.pred('BAIM', 255, 0, 0)
end
end

local function menu_first()
local is_aa     = quest(tabs:get() == 1)
local is_visual = quest(tabs:get() == 2)
local is_pl     = quest(tabs:get() == 3)
breaker:set_visible(antiaim_en:get() and is_aa)
cfg:set_visible(antiaim_en:get() and selection:get() == 1 and is_aa)
load:set_visible(antiaim_en:get() and selection:get() == 1 and is_aa)
states:set_visible(antiaim_en:get() and selection:get() == 1 and is_aa)
selection:set_visible(antiaim_en:get() and is_aa)
antiaim_en:set_visible(is_aa)
arrow:set_visible(is_visual)
type:set_visible(is_aa and selection:get() == 1 and antiaim_en:get())


-- SOLACE BASED
-- stand
stand.yawadd_lS:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and type:get() == 2)
stand.yawadd_rS:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
stand.jitter_type:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
stand.jitter_degree:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
stand.bodyyaw:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
--crouch
crouch.yawadd_lC:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
crouch.yawadd_rC:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
crouch.jitter_type:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
crouch.jitter_degree:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
crouch.bodyyaw:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
--jump
jump.yawadd_lJ:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
jump.yawadd_rJ:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
jump.jitter_type:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
jump.jitter_degree:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
jump.bodyyaw:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
--jumpc
airc.yawadd_lAC:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
airc.yawadd_rAC:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
airc.jitter_type:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
airc.jitter_degree:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
airc.bodyyaw:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa)
--move
move.yawadd_lM:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
move.yawadd_rM:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
move.jitter_type:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
move.jitter_degree:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
move.bodyyaw:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 2)
end
local function menu_second()
local is_aa     = quest(tabs:get() == 1)
local is_visual = quest(tabs:get() == 2)
local is_pl     = quest(tabs:get() == 3)
-- CHEAT BASED
-- stand
c_stand.c_yawadd_lS:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and type:get() == 1)
c_stand.c_yawadd_rS:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_stand.c_jitter_type:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_stand.c_jitter_degree:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_stand.c_fakeR:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_stand.c_fakeL:set_visible(antiaim_en:get() and states:get() == 1 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
--crouch
c_crouch.c_yawadd_lC:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_crouch.c_yawadd_rC:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_crouch.c_jitter_type:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_crouch.c_jitter_degree:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_crouch.c_fakeR:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_crouch.c_fakeL:set_visible(antiaim_en:get() and states:get() == 2 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
--jump
c_jump.c_yawadd_lJ:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_jump.c_yawadd_rJ:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_jump.c_jitter_type:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_jump.c_jitter_degree:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_jump.c_fakeR:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_jump.c_fakeL:set_visible(antiaim_en:get() and states:get() == 3 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
--jumpc
c_airc.c_yawadd_lAC:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_airc.c_yawadd_rAC:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_airc.c_jitter_type:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_airc.c_jitter_degree:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_airc.c_fakeR:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_airc.c_fakeL:set_visible(antiaim_en:get() and states:get() == 4 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
--move
c_move.c_yawadd_lM:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_move.c_yawadd_rM:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_move.c_jitter_type:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_move.c_jitter_degree:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_move.c_fakeR:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)
c_move.c_fakeL:set_visible(antiaim_en:get() and states:get() == 5 and selection:get() == 1 and is_aa and is_aa and type:get() == 1)


logs:set_visible(is_visual)
trashtalk:set_visible(is_visual)
indicators:set_visible(is_visual)
hitmarker:set_visible(is_visual)
damage_marker:set_visible(is_visual)
hitmarkercol:set_visible(is_visual)
highcol:set_visible(is_visual)
damagecol:set_visible(is_visual)
end
local yaw = 0
local function on_finish_command(cmd)
    yaw = cmd.viewangles.y
end 
local function on_antiaim(ctx)
	local cond = conditions()
	local choked = engine.get_choked_commands()

	if breaker:get(1) then
		ctx:set_render_pose(e_poses.RUN, 0)
	end

    if breaker:get(2) then
        ctx:set_render_pose(e_poses.JUMP_FALL, 1)
    end

	if not antiaim_en:get() then return end
	-- @note: not mine code \\ do yawbase normal
   	-- @note: do main aa
    if selection:get() == 1 and type:get() == 1 then
    ref.sidestand:set(4)
    ref.sidemove:set(false)
    ref.sidesw:set(false)
    ref.rotate:set(false)
    ref.jmode:set(1)
    ref.bodylean:set(0)

    if cond == 'STAND' then
    ref.yawadd:set(antiaim.get_desync_side() == 1 and c_stand.c_yawadd_rS:get() or c_stand.c_yawadd_lS:get())
    ref.jmode:set(2)
    ref.jtype:set(c_stand.c_jitter_type:get())
    ref.jadd:set(c_stand.c_jitter_degree:get())
    ref.l_fake:set(c_stand.c_fakeL:get())
    ref.r_fake:set(c_stand.c_fakeR:get())
    end

    if cond == 'MOVE' then
    ref.yawadd:set(antiaim.get_desync_side() == 1 and c_move.c_yawadd_rM:get() or c_move.c_yawadd_lM:get())
    ref.jmode:set(2)
    ref.jtype:set(c_move.c_jitter_type:get())
    ref.jadd:set(c_move.c_jitter_degree:get())
    ref.l_fake:set(c_move.c_fakeL:get())
    ref.r_fake:set(c_move.c_fakeR:get())
    end

    if cond == 'CROUCH' then
    ref.yawadd:set(antiaim.get_desync_side() == 1 and c_crouch.c_yawadd_rC:get() or c_crouch.c_yawadd_lC:get())
    ref.jmode:set(2)
    ref.jtype:set(c_crouch.c_jitter_type:get())
    ref.jadd:set(c_crouch.c_jitter_degree:get())
    ref.l_fake:set(c_crouch.c_fakeL:get())
    ref.r_fake:set(c_crouch.c_fakeR:get())
    end

    if cond == 'JUMP' then
    ref.yawadd:set(antiaim.get_desync_side() == 1 and c_jump.c_yawadd_rJ:get() or c_jump.c_yawadd_lJ:get())
    ref.jmode:set(2)
    ref.jtype:set(c_jump.c_jitter_type:get())
    ref.jadd:set(c_jump.c_jitter_degree:get())
    ref.l_fake:set(c_jump.c_fakeL:get())
    ref.r_fake:set(c_jump.c_fakeR:get())
    end

    if cond == 'JUMPC' then
    ref.yawadd:set(antiaim.get_desync_side() == 1 and c_airc.c_yawadd_rAC:get() or c_airc.c_yawadd_lAC:get())
    ref.jmode:set(2)
    ref.jtype:set(c_airc.c_jitter_type:get())
    ref.jadd:set(c_airc.c_jitter_degree:get())
    ref.l_fake:set(c_airc.c_fakeL:get())
    ref.r_fake:set(c_airc.c_fakeR:get())
    end

    end
	if selection:get() == 1 and type:get() == 2 then
    if choked == 0 then
        yaw = engine.get_view_angles().y - 180
        return
    end
    ref.sidestand:set(1)
    ref.sidemove:set(false)
    ref.sidesw:set(false)
    ref.yawadd:set(0)
    ref.rotate:set(false)
    ref.jmode:set(0)
    ref.jtype:set(0)
    ref.jadd:set(0)
    ref.bodylean:set(0)
	if cond == 'STAND' then
	local ya = jit==1 and stand.yawadd_rS:get() or stand.yawadd_lS:get()
    yaw = yaw + (stand.bodyyaw:get()) + ya
    ctx:set_invert_desync(false)
	if stand.jitter_type:get()     == 2 then -- center
		yaw = yaw + (stand.jitter_degree:get()/2) * jit
	elseif stand.jitter_type:get() == 3 then -- offset
		yaw = yaw + stand.jitter_degree:get() * ((jit+1)/2)
	elseif stand.jitter_type:get() == 4 then -- spin
		yaw = yaw - (global_vars.tick_count()*3) % stand.jitter_degree:get()
	else

	end
	ctx:set_yaw(yaw)
    end
	if cond == 'MOVE' then
	local ya = jit==1 and move.yawadd_rM:get() or move.yawadd_lM:get()
    yaw = yaw + (move.bodyyaw:get()) + ya
    ctx:set_invert_desync(false)
	if move.jitter_type:get()     == 2 then -- center
		yaw = yaw + (move.jitter_degree:get()/2) * jit
	elseif move.jitter_type:get() == 3 then -- offset
		yaw = yaw + move.jitter_degree:get() * ((jit+1)/2)
	elseif move.jitter_type:get() == 4 then -- spin
		yaw = yaw - (global_vars.tick_count()*3) % move.jitter_degree:get()
	else

	end
	ctx:set_yaw(yaw)	
	end
	if cond == 'CROUCH' then
	local ya = jit==1 and crouch.yawadd_rC:get() or crouch.yawadd_lC:get()
    yaw = yaw + (crouch.bodyyaw:get()) + ya
    ctx:set_invert_desync(false)
	if crouch.jitter_type:get()     == 2 then -- center
		yaw = yaw + (crouch.jitter_degree:get()/2) * jit
	elseif crouch.jitter_type:get() == 3 then -- offset
		yaw = yaw + crouch.jitter_degree:get() * ((jit+1)/2)
	elseif crouch.jitter_type:get() == 4 then -- spin
		yaw = yaw - (global_vars.tick_count()*3) % crouch.jitter_degree:get()
	else

	end
	ctx:set_yaw(yaw)	
	end
	if cond == 'JUMP' then
	local ya = jit==1 and jump.yawadd_rJ:get() or jump.yawadd_lJ:get()
    yaw = yaw + (jump.bodyyaw:get()) + ya
    ctx:set_invert_desync(false)
	if jump.jitter_type:get()     == 2 then -- center
		yaw = yaw + (jump.jitter_degree:get()/2) * jit
	elseif jump.jitter_type:get() == 3 then -- offset
		yaw = yaw + jump.jitter_degree:get() * ((jit+1)/2)
	elseif jump.jitter_type:get() == 4 then -- spin
		yaw = yaw - (global_vars.tick_count()*3) % jump.jitter_degree:get()
	else

	end
	ctx:set_yaw(yaw)	
	end
	if cond == 'JUMPC' then
	local ya = jit==1 and airc.yawadd_rAC:get() or airc.yawadd_lAC:get()
    yaw = yaw + (airc.bodyyaw:get()) + ya
    ctx:set_invert_desync(false)
	if airc.jitter_type:get()     == 2 then -- center
		yaw = yaw + (airc.jitter_degree:get()/2) * jit
	elseif airc.jitter_type:get() == 3 then -- offset
		yaw = yaw + airc.jitter_degree:get() * ((jit+1)/2)
	elseif airc.jitter_type:get() == 4 then -- spin
		yaw = yaw - (global_vars.tick_count()*3) % airc.jitter_degree:get()
	else

	end
	ctx:set_yaw(yaw)	
	end
end
end
local function on_event(event)
	hitlogs_event(event)
	trashtalk_event(event)
    damagemarker_event(event)
end
local function draw()
    ad()
    damagemarker_render()
    ts()
    hitlogsrender()
end
callbacks.add(e_callbacks.WORLD_HITMARKER, on_world_hitmarker)
callbacks.add(e_callbacks.EVENT, on_event)
callbacks.add(e_callbacks.AIMBOT_MISS, on_aimbot_miss)
callbacks.add(e_callbacks.AIMBOT_HIT, on_aimbot_hit)
callbacks.add(e_callbacks.RUN_COMMAND, jitter)
callbacks.add(e_callbacks.FINISH_COMMAND, on_finish_command)
callbacks.add(e_callbacks.ANTIAIM, on_antiaim)
callbacks.add(e_callbacks.PAINT, draw)
