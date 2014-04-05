
(** Find bound for i-th variable in lhs of rule r *)
let findEntry globalSizeComplexities r i vars =
  let (_, (_, c)) = List.find (function (r', (j, _)) -> i = j && Rule.equal r r') globalSizeComplexities in
  Clocalsizecomplexity.toSmallestComplexity c vars

(** Extract map from variables to size complexities *)
let extractSizeMapFromRule globalSizeComplexities rule vars =
  List.mapi (fun i _ -> "X_" ^ (string_of_int (i + 1)), findEntry globalSizeComplexities rule i vars) vars
