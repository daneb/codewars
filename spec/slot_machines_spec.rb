require './slot_machines'

describe SlotMachines do
  subject { SlotMachines.new }

  it 'produces a final score of 100' do
    reels = %w[Wild Star Bell Shell Seven Cherry Bar King Queen Jack]
    spins = [0,0,0]
    score = subject.fruit(reels, spins)
    expect(score).to eq 100
  end

  it 'determines the values of the spin for a single reel' do
    reels = %w[Wild Star Bell Shell Seven Cherry Bar King Queen Jack]
    spin = [0,0,0]
    value = subject.get_spin(reels, spin)
    expect(value).to eq %w[Wild Wild Wild]
  end

  it 'determines the values of the spin for three reels' do
    reel1 = %w[Wild Star Bell Shell Seven Cherry Bar King Queen Jack]
    reel2 = %w[Bar Wild Queen Bell King Seven Cherry Jack Star Shell]
    reel3 = %w[Bell King Wild Bar Seven Jack Shell Cherry Queen Star]
    spin = [5,4,3]
    value = subject.get_spin([reel1, reel2, reel3], spin)
    expect(value).to eq %w[Cherry King Bar]
  end

  it 'determines the score when the spin is three of the same' do
    reel = %w[Wild Star Bell Shell Seven Cherry Bar King Queen Jack]
    spin = [3,3,3]
    value = subject.get_spin(reel, spin)
    score = subject.get_three_of_same_score(value[0])
    expect(score).to eq 70
  end

  it 'determines the score when the spin is two of the same' do
    reel = %w[Wild Star Bell Shell Seven Cherry Bar King Queen Jack]
    spin = [3,3,0]
    value = subject.get_spin(reel, spin)
    score = subject.get_two_of_same_score(value[0])
    expect(score).to eq 7
  end

  it 'determines the score when the spin is two of the same and there is a Wild' do
    reel = %w[Wild Star Bell Shell Seven Cherry Bar King Queen Jack]
    spin = [3,3,1]
    value = subject.get_spin(reel, spin)
    score = subject.get_two_of_same_score(value[0])
    expect(score).to eq 7
  end

  it 'produces a final score of 6' do
    reel1 = %w[King Jack Wild Bell Star Seven Queen Cherry Shell Bar]
    reel2 = %w[Star Bar Jack Seven Queen Wild King Bell Cherry Shell]
    reel3 = %w[King Bell Jack Shell Star Cherry Queen Bar Wild Seven]
    spin = [0, 5, 0]
    expect(subject.fruit([reel1, reel2, reel3], spin)).to eq 6
  end

end