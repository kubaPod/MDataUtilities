(* ::Package:: *)

(* ::Chapter:: *)
(* Metadata*)


(* ::Chapter:: *)
(* Begin package*)


BeginPackage["`MDataUtilities`"];


GroupByMerge::usage     = "GroupByMerge[dataset, by, mergeOperator]";

EnumerateRecords::usage = "EnumerateRecords[dataset, indexKeyName_:'index']";

ApplyKeyAdd::usage      = "ApplyKeyAdd[recordAsso, newKeyName->operator]";

DateHistogramList::usage= "!Experimental!"




Begin["`Wrangling`"];



(* ::Chapter:: *)
(* Implementation code*)


GroupByMerge[dataset : {Association__}, by_, mergeOp_ : List] :=  Values @ GroupBy[dataset, by, Merge[mergeOp]]


EnumerateRecords[dataset : {__Association}, key_ : "index"] := MapIndexed[Append[#, key -> First[#2] ] & ] @ dataset

ApplyKeyAdd[ record_, key_ -> foo_ ] :=  ApplyKeyAdd[key -> foo] @ record

ApplyKeyAdd[ key_ -> foo_ ] :=  Function[record, Append[record, key -> foo@record] ]


DateHistogramList[dates_, bSpec_]:= HistogramList[
  dates
, System`TimeVisualizationsDump`dateHistogramBinning[
    dates
  , bSpec
  , Identity (*smoothing function - at least the pattern name says so*)
  , $TimeZone
  ] 
];


(* ::Chapter:: *)
(* End package*)


End[];

EndPackage[];
