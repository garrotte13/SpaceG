--require("prototypes/electrify-offshore-pump")





local air_working_sound = {
  sound = { filename = "__SpaceG__/sounds/air-purifier.ogg" },
  idle_sound = { filename = "__base__/sound/idle1.ogg" },
  apparent_volume = 1.2,
}
data.raw["assembling-machine"]["air-filter-rampant-industry"].working_sound = air_working_sound
data.raw["assembling-machine"]["air-filter-2-rampant-industry"].working_sound = air_working_sound
