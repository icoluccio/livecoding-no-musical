use_bpm 60

# Genera una secuencia de 16 notas sin restricciones
use_random_seed 0
melody = (1..16).map do
  rrand_i(50, 85)
end.ring

# Genera un bajo tomando 4 notas de la melodía generada
bass = [melody[0]  - 24,
        melody[3]  - 17,
        melody[7]  - 19 ,
        melody[11] - 17 ].ring

# Melodía:
# Tira una moneda: si cae cara, no suena la nota
#                  si cae ceca, suena la próxima nota de la melodía
live_loop :melody do
  with_fx :pitch_shift, pitch: 12, mix: 0.4, decay: 0.8 do
    sleep 0.5 if one_in(2)
    use_synth :sine
    play melody.tick
    sleep 0.5
  end
end

# Bajo:
# Repite 4 veces cada nota
live_loop :bass do
  use_synth :fm
  note = bass.tick
  play_pattern_timed [note]*4, 0.5, amp: 0.4
end