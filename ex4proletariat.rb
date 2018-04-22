use_bpm 70.5

# Hammock - Birds Flying In Sequence
# https://www.youtube.com/watch?v=5tGUB7cPUYA
# sample 'C:\Users\Pedro Soto\Desktop\hammock.wav', amp: 4
# Versión livecoding de Casi todos los males - La clave es la organización ?
# https://casitodoslosmales.bandcamp.com/track/la-clave-es-la-organizaci-n-3

bass = ([47]*16 + [49]*16 + [51]*16 + [42]*8 + [44]*8).ring
melody =       ([82, 75, 63, 75, 73, nil, nil, nil] +
                [70, 75, 78, 75, 82, nil, nil, nil]).map { |note| note - 12 }.ring
# Sample principal: sample de Hammock en reversa y estirado,
# pasado por un filtro lo-fi
live_loop :sample2 do
  sync :sixteen
  with_fx :reverb, mix: 0.7 do
    with_fx :lpf, cutoff: 100 do
      with_fx :hpf, cutoff: 75 do
        sample 'C:\Users\Pedro Soto\Desktop\hammock.wav', amp: 7, beat_stretch: 16, rate: -1
      end
    end
  end
end

# Bajo
live_loop :bass do
  with_fx :krush, mix: 0.2 do
    use_synth :fm
    note = bass.tick
    play note, amp: 1.5
    sleep 0.25
  end
end

# Batería: ritmo repetido de un sample pasado
# por un filtro lo-fi
live_loop :drums do
  with_fx :bitcrusher, sample_rate:12000, bits:24, mix: 1 do
    with_fx :lpf, cutoff: 110 do
      with_fx :distortion, mix: 0.2 do
        with_fx :krush, mix: 0.2 do
          with_fx :reverb, mix: 0.2 do
            sync :eight
            sample 'C:\Users\Pedro Soto\Desktop\dexterwansel-themefromtheplanets-79.4bpm.wav', amp: 4, beat_stretch: 8
          end
        end
      end
    end
  end
end

# Línea lider
live_loop :lead do
  with_fx :reverb, mix: 0.6 do
    with_fx :echo, mix: 0.9, decay: 5 do
      use_synth :pulse
      note = melody.tick
      play note, attack: 0.1, release: 0.02, decay: 0.02, sustain:0, amp:0.8
      sleep 1
    end
  end
end

live_loop :metronome do
  cue :sixteen
  cue :eight
  cue :four
  sleep 4
  cue :four
  sleep 4
  cue :eight
  cue :four
  sleep 4
  cue :four
  sleep 4
end
