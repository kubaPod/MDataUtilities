
(* Mathematica Package *)

(* :Title: MDataUtilities *)
(* :Context: MDataUtilities` *)
(* :Author: Kuba Podkalicki (kuba.pod@gmail.com) *)
(* :Date: Thu 26 Nov 2020 09:50:48 *)


Map[Get] @
Map[FileNameJoin[{DirectoryName @ $InputFileName, #}]& ] @
  {
    "Wrangling.m",
    "TimelineGraph.m"
  }