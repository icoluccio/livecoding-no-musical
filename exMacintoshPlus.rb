use_bpm 43.5

live_loop :sample do
  with_fx :reverb, mix: 0.6 do
    sample 'C:\Users\Pedro Soto\Desktop\yourmove.wav', amp: 4
    # sample 'C:\Users\Pedro Soto\Desktop\yourmove.wav', amp: 4, beat_stretch: 16
    sleep 16
  end
end

live_loop :drums do
  with_fx :slicer, wave: 0, mix: 0, phase: 0.125 do
    # sample :loop_amen, amp: 1.7, beat_stretch:2
  end
  sleep 1
end

live_loop :bass do
  use_synth :saw
  notes = [nil, :e2, :e3, :e2]*4 + [nil, :b1, :b2, :b1]*4 +
    [nil, :e2, :e3, :e2]*4  + [nil, :b2, :b3, :b2]*4 +
    [nil, :e2, :e3, :e2]*4 + [nil, :b1, :b2, :b1]*4 +
    [nil, :cs2, :cs3, :cs2]*4  + [nil, :d2, :d3, :d2]*2 + [nil, :e1, :e2, :e1]*2
  # play_pattern_timed notes, 0.125, release: 0.1, amp: 1.5
end

with_fx :echo, mix: 0.3 do
  live_loop :lead do
    use_synth :piano
    # play choose(scale(:b4, :minor_pentatonic)), amp: 3, release: 0.1, attack: 0.1
  end
  sleep 0.125
end

with_fx :reverb, mix: 0.7 do
  with_fx :distortion, mix: 0.7 do
    with_fx :tremolo, mix: 0.7 do
      live_loop :chords do
        use_synth :dtri
        # play_pattern_timed chord(:b3, :minor7), 2, amp: 0.5, release: 1, attack: 1
      end
    end
  end
end