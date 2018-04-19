use_bpm 70.5

with_fx :krush, mix: 0.2 do
  with_fx :reverb, mix: 0.6 do
    live_loop :bass do
      use_synth :fm
      notes = [47]*16 + [49]*16 + [51]*16 + [42]*8 + [44]*8
      play_pattern_timed notes, 0.25, attack: 0, release: 0.1, decay: 0.15
    end
  end
end


with_fx :reverb, mix: 0.6 do
  with_fx :echo, mix: 0.6 do
    live_loop :lead do
      use_synth :dsaw
      notes = [82, 75, 63, 75, 73, nil, nil, nil] +
        [70, 75, 78, 75, 82, nil, nil, nil]
      
      play_pattern_timed notes, 1, attack: 0.25, release: 0.01, decay: 0.01, amp:0.3
    end
  end
end

with_fx :bitcrusher, sample_rate:12000, bits:24, mix: 1 do
  live_loop :drums do
    with_fx :lpf, cutoff: 110 do
      with_fx :distortion, mix: 0.2 do
        with_fx :krush, mix: 0.2 do
          with_fx :reverb, mix: 0.2 do
            sample 'C:\Users\Pedro Soto\Desktop\dexterwansel-themefromtheplanets-79.4bpm.wav', amp: 4, beat_stretch: 8
            sleep 8
          end
        end
      end
    end
  end
end


with_fx :reverb, mix: 0.7 do
  with_fx :lpf, cutoff: 100 do
    with_fx :hpf, cutoff: 75 do
      live_loop :sample2 do
        sample 'C:\Users\Pedro Soto\Desktop\hammock.wav', amp: 4, beat_stretch: 16, rate: -1
        sleep 16
      end
    end
  end
end