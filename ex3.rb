use_bpm 125

bass = (1..16).map {
  random = rrand_i(1,6)
  if random < 4
    [50, 53, 57, 55].choose
  else
    38
  end
}.ring
strings = bass

with_fx :reverb, mix: 0.5 do
  with_fx :distortion, mix:0.3 do
    with_fx :compressor do
      live_loop :bass do
        use_synth :tb303
        note = bass.tick
        play note, release: 0.125, cutoff: 100, res: 0.8, wave: 0
        sleep 0.25
      end
    end
  end
end

with_fx :reverb, mix: 0.5 do
  live_loop :strings do
    use_synth :dpulse
    note = strings.tick
    play chord(note + 12, :m), amp: 3, release:2, attack: 0.25
    play chord(note + 24, :m), amp: 3, release:2, attack: 0.25
    sleep 2
  end
end

live_loop :drums do
  sample :bd_fat, amp: 10
  sleep 0.5
  sample :drum_cymbal_closed, amp: 6
  sleep 0.5
  sample :bd_fat, amp: 10
  sample :drum_splash_hard, amp: 1
  sample :elec_hi_snare, amp: 5
  sleep 0.5
  sample :drum_cymbal_closed, amp: 6
  sleep 0.5
  sample :bd_fat, amp: 10
  sleep 0.5
  sample :drum_cymbal_closed, amp: 6
  sleep 0.5
  sample :bd_fat, amp: 10
  sample :drum_snare_hard, amp: 5
  sleep 0.5
  sample :drum_cymbal_closed, amp: 6
  sleep 0.5
end
