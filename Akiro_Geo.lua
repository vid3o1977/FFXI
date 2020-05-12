-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal', 'Acc')
    state.CastingMode:options('Normal', 'Crits')--'Resistant',
    state.IdleMode:options('Normal', 'PDT', 'MDT')

	state.MagicBurst = M(false, 'Magic Burst')
	
    gear.default.weaponskill_waist = "Fotia Belt"

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
	sets.precast.JA['Cardinal Chant'] = {head="Geomancy Galero +2"}
	sets.precast.JA['Collimated Fervor'] = {head="Bagua Galero +1"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +2",back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +18','Pet: Damage taken -3%',}},}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines +1",head="Azimuth Hood +1"}
	sets.precast.JA['Bolster'] = {body="Bagua Tunic"}
	
    -- Fast cast sets for spells
	
	sets.precast.Waltz = {head="Geomancy Galero +2",body="Bagua Tunic +1",hands="Geomancy Mitaines +2",legs="Bagua Pants +1",feet="Geo. Sandals +1",neck="Unmoving Collar +1",ring1="Titan Ring",ring2="Titan Ring",
	ear1="Soil Pearl",ear2="Soil Pearl",back="Iximulew Cape"}
	
    sets.precast.FC = {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Nares Cap",
    body="Anhur Robe",
    hands="Jhakri Cuffs +2",
    legs="Geomancy pants +2",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+28','"Fast Cast"+6','INT+10','"Mag.Atk.Bns."+14',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Thureous Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Swith Cape",
	}

	sets.precast.FC.Cure = {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Nares Cap",
    body="Anhur Robe",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Geomancy pants +2",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+28','"Fast Cast"+6','INT+10','"Mag.Atk.Bns."+14',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Barkaro. Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Ogapepo Cape",
	}

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})
    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {head="Jhakri Coronal +1",neck="Fotia Gorget",ear1="Brutal Earring",
		ear2="Moonshade Earring",
		body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Petrov Ring",ring2="Rufescent Ring",
		back="Lifestream Cape",waist="Fotia Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}--Bagua Pants +1/Bagua Tunic +1/Geomancy Galero +1/Bagua Tunic +1
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Flash Nova'] = {
		head="Merlinic Hood",neck="Eddy Necklace",ear2="Friomisi Earring",ear1="Barkarole Earring",
		body="Jhakri Robe +1",hands="Amalric Gages",ring1="Fenrir Ring",ring2="Acumen Ring",
		back="Toro Cape",waist="Fotia Belt",legs="Merlinic Shalwar",feet="Merlinic Crackows"}--"Witching Robe"
    
	sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}

	sets.precast.WS['Exudation'] = {head="Buremte Hat",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Jhakri Robe +1",hands="Amalric Gages",ring1="Levia. Ring",ring2="Rufescent Ring",
		back="Toro Cape",waist="Fotia Belt",legs="Merlinic Shalwar",feet="Merlinic Crackows"}--Bagua Pants +1/Buremte Hat

	sets.precast.WS['Realmrazer'] = {head="Buremte Hat",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		body="Jhakri Robe +1",hands="Amalric Gages",ring1="Levia. Ring",ring2="Rufescent Ring",
		back="Toro Cape",waist="Fotia Belt",legs="Merlinic Shalwar",feet="Merlinic Crackows"}--Bagua Pants +1/Buremte Hat

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Nares Cap",
    body="Anhur Robe",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Geomancy pants +2",
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+28','"Fast Cast"+6','INT+10','"Mag.Atk.Bns."+14',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Barkaro. Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Ogapepo Cape",
	}

    sets.midcast.Geomancy = {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body={ name="Bagua Tunic +1", augments={'Enhances "Bolster" effect',}},
    hands="Geomancy Mitaines +2",
    legs="Bagua Pants",
    feet="Azimuth Gaiters +1",
    neck="Incanter's Torque",
    waist="Austerity Belt +1",
    left_ear="Genmei Earring",
    right_ear="Handler's Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +18','Pet: Damage taken -3%',}},
	}--"Stikini Ring"
		
    sets.midcast.Geomancy.Indi = {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body={ name="Bagua Tunic +1", augments={'Enhances "Bolster" effect',}},
    hands="Geomancy Mitaines +2",
    legs="Bagua Pants",
    feet="Azimuth Gaiters +1",
    neck="Incanter's Torque",
    waist="Austerity Belt +1",
    left_ear="Genmei Earring",
    right_ear="Handler's Earring",
    left_ring="Stikini Ring",
    right_ring="Stikini Ring",
    back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +18','Pet: Damage taken -3%',}},
	}--"Stikini Ring"

    sets.midcast.Cure = set_combine(sets.precast.FC, {
	main={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}},
    sub="Dominie's Grip",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +1",
    body="Geomancy Tunic +2",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +16','"Cure" spellcasting time -5%','Magic dmg. taken -2',}},
    legs="Geo. Pants +1",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Phalaina Locket",
    waist="Luminary sash",
    left_ear="Mendi. Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Stikini Ring",
    right_ring="Sirona's Ring",
    back="Solemnity Cape",
	})--Nares Trews
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = set_combine(sets.precast.FC, {main="Solstice",head="Umuthi Hat",ring1="Sheltered Ring",ring2="Stikini Ring"})
	sets.midcast.Protect = sets.midcast.Protectra
	
	sets.midcast.Shellra = set_combine(sets.precast.FC, {main="Solstice",head="Umuthi Hat",ring1="Sheltered Ring",ring2="Stikini Ring"})
	sets.midcast.Shell = sets.midcast.Shellra

	sets.midcast.Stoneskin = set_combine(sets.precast.FC, {main="Solstice",head="Umuthi Hat",waist="Siegel Sash",ear1="Earthcry Earring",legs="Haven Hose",neck="Nodens Gorget",ring1="Stikini Ring",ring2="Stikini Ring"})

	sets.midcast.Cursna = set_combine(sets.precast.FC, {main="Solstice",ring1="Ephedra Ring",ring2="Ephedra Ring",neck="Malison Medallion"})
	
	sets.midcast.Regen = set_combine(sets.precast.FC, {main="Bolelabunga",head="Umuthi Hat",body="Telchine Chas.",ring1="Stikini Ring",ring2="Stikini Ring"})

	sets.midcast['Elemental Magic'] = {
	main={ name="Grioavolr", augments={'"Conserve MP"+1','INT+20','Mag. Acc.+23','"Mag.Atk.Bns."+24','Magic Damage +3',}},
    sub="Enki Strap",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+9%','MND+4','"Mag.Atk.Bns."+14',}},
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+6%','VIT+9','"Mag.Atk.Bns."+14',}},
    feet="Jhakri Pigaches +2",
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear="Barkaro. Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Strendu Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}--Buremte Hat/Azimuth Coat/Lengo Pants/Loagaeth Cuffs/Welkin Crown/Azimuth Coat/Jhakri Robe +1/Witching Robe/Wretched Coat/Count's Garb
	
	sets.midcast['Elemental Magic'].Crits = {
	 main={ name="Grioavolr", augments={'"Conserve MP"+1','INT+20','Mag. Acc.+23','"Mag.Atk.Bns."+24','Magic Damage +3',}},
    sub="Niobid Strap",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+9%','MND+4','"Mag.Atk.Bns."+14',}},
    body="Jhakri Robe +2",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+6%','VIT+9','"Mag.Atk.Bns."+14',}},
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Barkaro. Earring",
    right_ear="Friomisi Earring",
    left_ring="Jhakri Ring",
    right_ring="Strendu Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}--Buremte Hat/Azimuth Coat/Lengo Pants/Loagaeth Cuffs/Welkin Crown/Azimuth Coat/Jhakri Robe +1/Witching Robe/Wretched Coat/Count's Garb
	
	sets.magic_burst = {
	main={ name="Grioavolr", augments={'"Conserve MP"+1','INT+20','Mag. Acc.+23','"Mag.Atk.Bns."+24','Magic Damage +3',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+9%','MND+4','"Mag.Atk.Bns."+14',}},
    body="Ea Houppelande",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+6%','VIT+9','"Mag.Atk.Bns."+14',}},
    feet="Jhakri Pigaches +2",
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Barkaro. Earring",
    right_ear="Friomisi Earring",
    left_ring="Mujin Band",
    right_ring="Locus Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast['Enfeebling Magic'] = {
	main={ name="Grioavolr", augments={'"Conserve MP"+1','INT+20','Mag. Acc.+23','"Mag.Atk.Bns."+24','Magic Damage +3',}},
    sub="Enki Strap",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Geomancy Galero +2",
    body="Geomancy Tunic +2",
    hands="Geo. Mitaines +2",
    legs="Geomancy pants +2",
    feet="Jhakri Pigaches +2",
    neck="Erra Pendant",
    waist="Luminary sash",
    left_ear="Barkaro. Earring",
    right_ear="Digni. Earring",
    left_ring="Stikini Ring",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}--Nahtirah Hat
	
	sets.midcast.Drain = {
	main={ name="Rubicundity", augments={'Mag. Acc.+5','"Mag.Atk.Bns."+5','"Conserve MP"+4',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +8','"Mag.Atk.Bns."+14',}},
    body="Geomancy Tunic +2",
    hands="Geo. Mitaines +2",
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+23','"Drain" and "Aspir" potency +10','CHR+4','Mag. Acc.+9',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21','"Drain" and "Aspir" potency +10','CHR+1','"Mag.Atk.Bns."+1',}},
    neck="Erra Pendant",
    waist="Austerity Belt +1",
    left_ear="Dark Earring",
    right_ear="Digni. Earring",
    left_ring="Evanescence Ring",
    right_ring="Stikini Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}

	sets.midcast.Aspir = sets.midcast.Drain
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {main="Bolelabunga",head="Azimuth Hood +1",neck="Lissome Necklace",ear1="Lifestorm Earring",ear2="Psystorm Earring",
		body="Jhakri Robe +1",hands="Bagua Mitaines +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Umbra Cape",waist="Fucho-No-Obi",legs="Assiduity Pants +1",feet="Serpentes Sabots"}--Refresh Head soon.

		
																	-- EMPERYAN ARMOR :

--Azimuth Hood = DEF:72 HP+15 MP+46 STR+10 DEX+10 VIT+10 AGI+2 INT+21 MND+13 CHR+13 Evasion+15 Magic Evasion+58 "Magic Def. Bonus"+3 Haste+5% Geomancy skill +10 "Full Circle"+1 Luopan: "Regen"+2 Set: MP occasionally not depleted when using geomancy spells


--Azimuth Coat = DEF:92 HP+23 MP+56 STR+12 DEX+12 VIT+12 AGI+12 INT+22 MND+17 CHR+17 Evasion+17 Magic Evasion+62 Magic Accuracy+13 "Magic Atk. Bonus"+13 "Magic Def. Bonus"+3 Haste+2% Elemental magic skill +13 Enmity-7 "Refresh"+2 Set: MP occasionally not depleted when using geomancy spells
--Azimuth Coat = DEF:92 HP+23 MP+56 STR+12 DEX+12 VIT+12 AGI+12 INT+22 MND+17 CHR+17 Evasion+17 Magic Evasion+62 Magic Accuracy+13 "Magic Atk. Bonus"+13 "Magic Def. Bonus"+3 Haste+2% Elemental magic skill +13 Enmity-7 "Refresh"+2 Set: MP occasionally not depleted when using geomancy spells


--Azimuth Gloves = DEF:62 HP+8 MP+57 STR+4 DEX+16 VIT+14 AGI+3 INT+13 MND+20 CHR+11 Magic Accuracy+17 Evasion+8 Magic Evasion+32 "Magic Def. Bonus"+1 Enfeebling magic skill +13 Haste+3% Enmity-10 Set: MP occasionally not depleted when using geomancy spells


--Azimuth Tights = DEF:80 HP+18 MP+36 STR+13 VIT+5 AGI+10 INT+31 MND+14 CHR+11 Magic Accuracy+10 "Magic Atk. Bonus"+10 Evasion+11 Magic Evasion+80 "Magic Def. Bonus"+3 Dark magic skill +15 Haste+4% Set: MP occasionally not depleted when using geomancy spells


--Azimuth Gaiters = DEF:49 HP+34 MP+47 STR+5 DEX+5 VIT+5 AGI+18 INT+12 MND+11 CHR+20 Evasion+28 Magic Evasion+80"Magic Def. Bonus"+3 Haste+3% "Indicolure" spell duration +15 Physical damage taken -3% Set: MP occasionally not depleted when using geomancy spells

--Solstice = Handbell Skill+5 Conserve MP+6 Indi Spell +15

--Lifestream Cape (DEF:13 HP+50 MP+50 Enfeebling Magic Skill +10 Fast Cast+10% GEOMANCY SKILL +15 Indi. Duration+15 DT-2% PET: DT-4%)

--Nantosuelta's Cape (DEF:15 Indicolure effect duration +20 "Life Cycle"+10)

    -- Idle sets

    sets.idle = {
	main="Bolelabunga",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Geomancy Galero +2",
    body="Jhakri Robe +2",
    hands="Geomancy Mitaines +2",
    legs="Assid. Pants +1",
    feet="Geomancy Sandals +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Infused Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
	}

    sets.idle.PDT = {
	main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Geomancy Galero +2",
    body="Jhakri Robe +2",
    hands="Geomancy Mitaines +2",
    legs="Assid. Pants +1",
    feet="Geomancy Sandals +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Infused Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
	}

	sets.idle.MDT = {
	main="Bolelabunga",
    sub="Genmei Shield",
    ammo="Staunch Tathlum",
    head="Geomancy Galero +2",
    body="Jhakri Robe +2",
    hands="Geomancy Mitaines +2",
    legs="Assid. Pants +1",
    feet="Geomancy Sandals +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Infused Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
	}	
		
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Evasion+14','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    body="Mallquis Saio +2",
    hands="Geo. Mitaines +2",
    legs={ name="Telchine Braconi", augments={'Evasion+20','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Genmei Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'MP+27','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}

    sets.idle.PDT.Pet = {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Evasion+14','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    body="Mallquis Saio +2",
    hands="Geo. Mitaines +2",
    legs={ name="Telchine Braconi", augments={'Evasion+20','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Genmei Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'MP+27','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	}
	
    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Evasion+14','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    body="Mallquis Saio +2",
    hands="Geo. Mitaines +2",
    legs={ name="Telchine Braconi", augments={'Evasion+20','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Genmei Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'MP+27','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Evasion+14','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    body="Mallquis Saio +2",
    hands="Geo. Mitaines +2",
    legs={ name="Telchine Braconi", augments={'Evasion+20','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Genmei Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'MP+27','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Evasion+14','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    body="Mallquis Saio +2",
    hands="Geo. Mitaines +2",
    legs={ name="Telchine Braconi", augments={'Evasion+20','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Genmei Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'MP+27','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {
	main={ name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}},
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head={ name="Telchine Cap", augments={'Evasion+14','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    body="Mallquis Saio +2",
    hands="Geo. Mitaines +2",
    legs={ name="Telchine Braconi", augments={'Evasion+20','Pet: "Regen"+3','Pet: Damage taken -3%',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Genmei Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back={ name="Nantosuelta's Cape", augments={'MP+27','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	})

    sets.idle.Town = {
	main="Bolelabunga",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Geomancy Galero +2",
    body="Jhakri Robe +2",
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs="Assid. Pants +1",
    feet="Geomancy Sandals +1",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Infused Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
	}

    sets.idle.Weak = {
	main="Bolelabunga",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Geomancy Galero +2",
    body="Jhakri Robe +2",
    hands="Geomancy Mitaines +2",
    legs="Assid. Pants +1",
    feet="Geomancy Sandals",
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Genmei Earring",
    right_ear="Infused Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
	}

    -- Defense sets

    sets.defense.PDT = {main="Idris",sub="Culminus",range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Jhakri Coronal +1",neck="Loricate collar",ear1="Handler's Earring +1",ear2="Loquacious Earring",
		body="Jhakri Robe +1",hands="Jhakri Cuff +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Umbra Cape",waist="Isa Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

    sets.defense.MDT = {main="Idris",sub="Culminus",range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Nahtirah Hat",neck="Loricate collar",ear1="Handler's Earring +1",ear2="Loquacious Earring",
		body="Jhakri Robe +1",hands="Telchine Gloves",ring1="Dark Ring",ring2="Defending Ring",
		back="Umbra Cape",waist="Isa Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}

    sets.Kiting = {feet="Geo. Sandals +1"}

    sets.latent_refresh = {waist="Fucho-No-Obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Idris",range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Jhakri Coronal +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Count's Garb",hands="Geomancy Mitaines +2",ring1="Petrov Ring",ring2="Varar Ring",
		back="Umbra Cape",waist="Cetl Belt",legs="Geo. Pants +1",feet="Geo. Sandals +1"}--K'ayres Ring

	sets.engaged.Acc = {main="Idris",range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Jhakri Coronal +1",neck="Subtley Spec.",ear1="Steelflash Earring",ear2="Heartseeker Earring",
		body="Jhakri Robe +1",hands="Jhakri Cuffs +1",ring1="Varar Ring",ring2="Varar Ring",
		back="Umbra Cape",waist="Cetl Belt",legs="Jhakri Slops +1",feet="Jhakri Pigaches +1"}
		
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)

    if spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.self_healing)
    end
    --if spell.action_type == 'Magic' then
       -- apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    --end
	if spell.skill == 'Elemental Magic'  then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip({waist="Hachirin-No-Obi"})
            --add_to_chat(8,'----- Hachirin-no-Obi Equipped. -----')
        end
    end
	if spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value then
        equip(sets.magic_burst)
        end
	end
	if spell.type == "WeaponSkill" then
      if spell.element == world.weather_element or spell.element == world.day_element then
        --equip({waist="Hachirin-no-Obi"})
        --add_to_chat(8,'----- Hachirin-no-Obi Equipped. -----')
      end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 11)
end
