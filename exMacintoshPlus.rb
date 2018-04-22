use_bpm 43.5

# MACINTOSH PLUS - ??????420 / ????????
# https://www.youtube.com/watch?v=cU8HrO7XuiE
# Sample de Diana Ross - It's your move
# https://www.youtube.com/watch?v=Uno7f5IGAPI

live_loop :sample do
  with_fx :reverb, mix: 0.6 do
    # sample 'C:\Users\Pedro Soto\Desktop\yourmove.wav', amp: 4
    sample 'C:\Users\Pedro Soto\Desktop\yourmove.wav', amp: 4, beat_stretch: 16
    sleep 16
  end
end

live_loop :drums do
  with_fx :slicer, wave: 0, mix: 0, phase: 0.125 do
    sample :loop_amen, amp: 1.7, beat_stretch:2
  end
  sleep 1
end
