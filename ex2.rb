# Melodía: arranca con la nota 62 y agrega 15 notas al azar
# de un grupo de 5 notas
melody = ([62] + (1..15).map {
            [50, 62, 67, 69, 74].choose
}).ring

# Bajo:
# En base a la primera nota de la melodía, arma un patrón
bass = [melody[0] -24,
        melody[0] -17,
        melody[0] -12,
        melody[0] -12].ring

# Acordes:
# Agarra la línea de bajo y genera todos acordes menores en la misma
# nota, una octava arriba.
chords = bass.map { |note|
  chord(note +12, :m)
}.ring

# Melodía
# Tira un dado, si sale 4 no suena la nota
# Si sale otro número, suena una nota y luego la misma nota una
# octava arriba
live_loop :melody do
  with_fx :reverb, mix: 0.8, decay: 0.2 do
    sleep 0.5 if dice == 4
    use_synth :pretty_bell
    note = melody.tick
    play note, decay: 0.2, release: 0.2
    sleep 0.25
    play note + 12, decay: 0.2, release: 0.2
    sleep 0.25
  end
end

# Bajo
# Cada loop suena la próxima nota de la línea que generó, pero
# espera a la batería para arrancar

live_loop :bass do
  with_fx :distortion, mix: 0.8, distort: 0.8 do
    sync :drum_start
    use_synth :square
    play bass.tick, release: 1, attack: 1.5, amp: 0.2
  end
end

live_loop :chords do
  use_synth :supersaw
  play chords.tick, amp: 1
  sleep 2
end

live_loop :drums do
  with_fx :reverb do
    cue :drum_start
    sample :drum_bass_hard, amp:1.2
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
    sample :drum_bass_hard, amp:1.2
    sample :drum_snare_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_bass_hard, amp:1.2
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
    sample :drum_bass_hard, amp:1.2
    sample :drum_snare_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_snare_hard, amp:0.5
    sample :drum_cymbal_closed
    sleep 0.125
  end
end