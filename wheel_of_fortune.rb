# c1 = {"name"=>"Bob", "scores"=>[10, 65]}
# c2 = {"name"=>"Bill", "scores"=>[90, 5]}
# c3 = {"name"=>"Charlie", "scores"=>[40, 55]}
# Test.assert_equals(winner([c1, c2, c3]), "Bill")
# https://docs.google.com/document/d/1m6ddtZ3USKtqM75n18lhdqAvPzJr0vM55zhpHR73VP8/edit

def winner(candidates)
 puts candidates
 return false unless valid_game(candidates)
 result = {}
 candidates.map { |candidate| 
   result[candidate["name"]] = candidate["scores"].inject(0) { |total, score| total + score }
 }
 valid_scores = result.select { |name, score| score <= 100 }
 return false if valid_scores.empty?
 valid_scores.max_by { |x| x[1] }[0]
end

def valid_game(candidates)
  candidate_scores = candidates.inject([]) { |all_scores, candidate | all_scores << candidate["scores"]}
  candidate_scores.flatten!
  return false unless candidates.length == 3
  return false unless candidates.select { |candidate| candidate.has_key?("name") and candidate.has_key?("scores") }.length == 3
  return false if candidates.select { |candidate| candidate["scores"].empty? }.length > 0
  return false if candidates.select { |candidate| candidate["scores"].length > 2 }.length > 0
  return false if candidate_scores.select { |score| score > 100 }.length > 0
  return false if candidate_scores.select { |score| score % 5 != 0}.length > 0
  true
end
# Any? is a great tool for VALIDATION

# Far More Efficient
# def winner(candidates)

#   return false if (candidates.size != 3) || 
#                   (candidates.any?{|cand| cand.size != 2})|| 
#                   (candidates.any?{|cand| cand["scores"].size > 2}) || 
#                   (candidates.any?{|cand| cand["scores"].size < 1}) || 
#                   (candidates.any?{|cand| cand["scores"].any? { |score| (score % 5 != 0) || (score > 100)}}) 
                  
#   winner = candidates.map { |cand| [cand["name"], cand["scores"].reduce(:+)] }.delete_if {|(n,s)| s > 100}.max_by {|(n,s)| s }
  
#   winner ? winner[0] : false
# end