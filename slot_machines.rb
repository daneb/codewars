class SlotMachines
  SCORE_MAPPING = { Wild: 100, Star: 90, Bell: 80, Shell: 70, Seven: 60,
                     Cherry: 50, Bar: 40, King: 30, Queen: 20, Jack: 10 }.freeze
  DOUBLE_SCORE_MARKER = 'Wild'

  def fruit(reels, spin)
    values = get_spin(reels, spin)
    count_of_values = group_same_and_rest(values)
    return get_three_of_same_score(count_of_values[3]) if count_of_values.key?(3)
    return get_two_of_same_with_wild_score(count_of_values[2]) if count_of_values.key?(2) && count_of_values[1] == DOUBLE_SCORE_MARKER
    return get_two_of_same_score(count_of_values[2]) if count_of_values.key?(2)
    0
  end

  def group_same_and_rest(values)
    items = values.uniq
    items.map { |item| [ values.count { |value| value == item }, item ] }.to_h
  end

  def get_spin(reels, spin)
    return [ reels[spin[0]], reels[spin[1]], reels[spin[2]] ] unless reels[0].is_a?(Array)
    [ reels[0][spin[0]], reels[1][spin[1]], reels[2][spin[2]] ]
  end

  def get_three_of_same_score(item)
    SCORE_MAPPING[item.to_sym]
  end

  def get_two_of_same_score(item)
    SCORE_MAPPING[item.to_sym] / 10
  end

  def get_two_of_same_with_wild_score(item)
    SCORE_MAPPING[item.to_sym] / 10 * 2
  end

end