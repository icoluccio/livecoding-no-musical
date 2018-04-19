melody = ([62] + (1..15).map {
            [50, 62, 67, 69, 74].choose
}).ring

bass = [melody[0] -24,
        melody[0] -17,
        melody[0] -12,
        melody[0] -12].ring

chords = bass.map { |note|
  chord(note +12, :m)
}.ring

live_loop :melody do
  with_fx :reverb, mix: 0.8, decay: 0.2 do
    sleep 0.5 if rand_i(5) == 4
    use_synth :pretty_bell
    note = melody.tick
    play note, decay: 0.2, release: 0.2
    sleep 0.25
    play note + 12, decay: 0.2, release: 0.2
    sleep 0.25
  end
end

live_loop :bass do
  with_fx :distortion, mix: 0.8, distort: 0.8 do
    use_synth :square
    play bass.tick - 12, release: 1, attack: 1, amp: 0.4
    sleep 2
  end
end

live_loop :chords do
  use_synth :supersaw
  play chords.tick, amp: 1
  sleep 2
end

live_loop :drums do
  with_fx :reverb do
    sample :drum_bass_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
    sample :drum_bass_hard
    sample :drum_snare_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_bass_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.25
    sample :drum_bass_hard
    sample :drum_snare_hard
    sleep 0.25
    sample :drum_cymbal_closed
    sleep 0.125
    sample :drum_snare_hard, amp:0.5
    sample :drum_cymbal_closed
    sleep 0.125
  end
end