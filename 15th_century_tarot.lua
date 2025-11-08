SMODS.Atlas {
    key = "15C_tarot",
    px = 71,
    py = 95,
    path = "assets/1x/15th_century_tarot.png"
}

-- This will need a new 15C set to be created to create specifically 15C tarots --
SMODS.Consumable({
    set = "Tarot",
    key = "giove",
    pos = {
        x = 0,
        y = 0
    },
    atlas = "15C_tarot",
    loc_txt = {
        name = 'Giove',
        text = "Creates 2 random 15C Tarot Cards"
    },
    config = {},
    loc_vars = function(self, info_queue, card)

    end,
    can_use = function(self, card)
    
    end,
    use = function(self, card, area, copier)
        for i = 1, math.min((self.ability.consumeable.tarots or self.ability.consumeable.planets), G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    local card = create_card((self.ability.name == 'The Emperor' and 'Tarot'), G.consumeables, nil, nil, nil, nil, nil, (self.ability.name == 'The Emperor' and 'emp'))
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    used_tarot:juice_up(0.3, 0.5)
                end
                return true end }))
        end
    end,
    cost = 10,
    discovered = true
})

SMODS.Consumable({
    set = "Tarot", key = "giunone", cost = 10, discovered = true, atlas = "15C_tarot", 
    pos = {
        x = 1,
        y = 0
    },
    loc_txt = {
        name = 'Giunone',
        text = {
            "Enhances {C:attention}3{} selected cards", 
            "to {C:attention}Mult Cards{}"
        }
    },
    config = {
        vars = {max_highlighted = 3, mod_conv = 'm_mult'}
    },

    can_use = function(self, card)
        if G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT then
            return true
        end
    end,

    use = function(self, card, area, copier)
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end }))
        end
        delay(0.2)
        for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                G.hand.highlighted[i]:set_ability(G.P_CENTERS[self.ability.consumeable.mod_conv]);
            return true end }))
        end
        for i=1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999)/(#G.hand.highlighted - 0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15, func = function()
                G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3);
            return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            G.hand:unhighlight_all();
        return true end }))
        delay(0.5)
    end
})

SMODS.Consumable({
    set = "Tarot",
    key = "pallas",
    pos = {
        x = 2,
        y = 0
    },
    atlas = "15C_tarot",
    loc_txt = {
        name = 'Pallas',
        text = "Changes rank of 2 selected cards to the rank which is most common in your deck (currently <rank>)"
    },
    config = { 
        vars = { 
            max_highlighted = 2
        } 
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    can_use = function(self, card)
    
    end,
    use = function(self, card, area, copier)
    
    end,
    cost = 10,
    discovered = true
})

SMODS.Consumable({
    set = "Tarot",
    key = "venus",
    pos = {
        x = 3,
        y = 0
    },
    atlas = "15C_tarot",
    loc_txt = {
        name = 'Venus',
        text = "Enhances 2 selected cards to the suit which is most common in your deck (currently <suit>)"
    },
    config = {},
    loc_vars = function(self, info_queue, card)

    end,
    can_use = function(self, card)
    
    end,
    use = function(self, card, area, copier)
    
    end,
    cost = 10,
    discovered = true
})

SMODS.Consumable({
    set = "Tarot",
    key = "apollo",
    pos = {
        x = 4,
        y = 0
    },
    atlas = "15C_tarot",
    loc_txt = {
        name = 'Apollow',
        text = "Disables (or changes?) current boss blind"
    },
    config = {},
    loc_vars = function(self, info_queue, card)

    end,
    can_use = function(self, card)
    
    end,
    use = function(self, card, area, copier)
    
    end,
    cost = 10,
    discovered = true
})

SMODS.Consumable({
    set = "Tarot",
    key = "nettuno",
    pos = {
        x = 5,
        y = 0
    },
    atlas = "15C_tarot",
    loc_txt = {
        name = 'Nettuno',
        text = "Select 2 cards, convert both to the most common card in your deck (currently <suit><number>)"
    },
    config = {},
    loc_vars = function(self, info_queue, card)

    end,
    can_use = function(self, card)
    
    end,
    use = function(self, card, area, copier)
    
    end,
    cost = 10,
    discovered = true
})

SMODS.Consumable({
    set = "Tarot",
    key = "diana",
    pos = {
        x = 6,
        y = 0
    },
    atlas = "15C_tarot",
    loc_txt = {
        name = 'Diana',
        text = "Enhances {C:attention}3{} selected cards to {C:attention}Wild Cards{}"
    },
    config = {},
    loc_vars = function(self, info_queue, card)

    end,
    can_use = function(self, card)
    
    end,
    use = function(self, card, area, copier)
    
    end,
    cost = 10,
    discovered = true
})

SMODS.Consumable({
    set = "Tarot",
    key = "bacco",
    pos = {
        x = 7,
        y = 0
    },
    atlas = "15C_tarot",
    loc_txt = {
        name = 'Bacco',
        text = "Spend total sell value of all current Jokers ($<total_cost>) to add negative to a random Joker"
    },
    config = {},
    loc_vars = function(self, info_queue, card)

    end,
    can_use = function(self, card)
    
    end,
    use = function(self, card, area, copier)
    
    end,
    cost = 10,
    discovered = true
})