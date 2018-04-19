use_bpm 75
melody = []
scale_notes = scale(:f, :minor)
File.open("C:\\Users\\Pedro Soto\\Desktop\\monalisa.bmp", 'rb') do |fi|
  byte_block = fi.read(1024)
  old_note = nil
  use_synth :beep
  byte_block.each_byte do |b|
    puts b % 8
    new_note = scale_notes[b%8]
    new_note += 12 if one_in(3)
    same_note = old_note == new_note
    old_note = new_note
    next if same_note
    melody.push new_note
  end
end
puts melody


live_loop :lead do
  with_fx :reverb, mix: 0.3 do
    with_fx :echo, mix: 0.1 do
      use_synth :sine
      play_pattern_timed melody, 0.25, decay:0.15, release:0.1
      sleep 0.25
    end
  end
end


with_fx :reverb, mix: 0.3 do
  with_fx :echo, mix: 0.1 do
    live_loop :break do
      part = [0,0,0,0,5,11,12,12].sample
      if one_in(6)
        sample :loop_amen, onset: part, beat_stretch: 2, amp: 2
        sleep 0.125
        sample :loop_amen, onset: part, beat_stretch: 2, amp: 2
        sleep 0.125
      else
        sample :loop_amen, onset: part, beat_stretch: 4, amp: 2
      end
      sleep one_in(8) ? 0.5 : 0.25
    end
  end
end

live_loop :bass do
  use_synth :square
  play_pattern_timed [scale_notes[0] - 24,
                      scale_notes[2] - 24,
                      scale_notes[5] - 24,
                      scale_notes[3] - 24], 1, release: 0.25
end

