melody = (1..16).map {
  rrand_i(50, 85)
}.ring

bass = [melody[0] -12,
        melody[3] - 17,
        melody[7] -7,
        melody[11] - 5].ring

live_loop :melody do
  with_fx :echo, mix: 0.7, decay: 0.8 do
    with_fx :octaver, mix:0.2, sub_amp: 0.3 do
      sleep 0.5 if rand_i(5) > 3
      use_synth :sine
      play melody.tick
      sleep 0.5
    end
  end
end

puts bass
live_loop :bass do
  use_synth :square
  note = bass.tick
  play note - 12, release: 0.5, amp: 0.6
  sleep 0.5
  play note, release: 0.5, amp: 0.6
  sleep 0.5
  play note - 12, release: 0.5, amp: 0.6
  sleep 0.5
  play note, release: 0.5, amp: 0.6
  sleep 0.5
end