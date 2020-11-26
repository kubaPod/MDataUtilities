
(* ::Chapter:: *)
(* Metadata*)




(* ::Chapter:: *)
(* Begin package*)


BeginPackage["`MDataUtilities`"];


  TimelineGraph::"TimelineGraph[{ <|'date'->_, 'entityIds' -> {__}|>]";


Begin["`TimelineGraph`"];



(* ::Chapter:: *)
(* Implementation code*)


$eventPattern = KeyValuePattern[{"date"->_, "entityIds" -> _List}];

TimelineGraph[events:{$eventPattern..}, opts:OptionsPattern[Graphics] ]:=Module[
  { entities }

  , entities = DeleteDuplicates @ Apply[Join] @ events[[All, "entityIds"]]
  ; entities = If[ ! AssociationQ[#], <|"id" -> #|>, #]& /@ entities
  ; entities = EnumerateRecords @ entities
  ; entities = ApplyKeyAdd[ "color" -> Function @ ColorData[97] @ #index ] /@ entities

  ; Graphics[
    {
      eventsPrimitive[#, entities]& /@ events
    }
    , opts
    , GridLines         -> { Automatic, entities // Query[All, Values@*{"index", "color"}] }
    , GridLinesStyle    -> { GrayLevel[.90], Thickness@0.002 }
    , PlotRange         -> { All, {1, Length@entities}}
    , Axes              -> False
    , Frame             -> True
    , FrameTicks        -> {
      {None, entities // Map[{#index, Style[#id, #color]}&]}
      , {Charting`getDateTicks[Automatic,{Automatic},(DateList/@{##1}&)[##],None,9,{{0.01`,0},{0.005`,0}},Automatic]&, Automatic}
    }
    , AspectRatio       -> 1/GoldenRatio
    , PlotRangeClipping -> True
    , PlotRangePadding  ->{Scaled[.05], 1}
    , BaseStyle         -> "Subsection"
  ]

]


eventsPrimitive[
  event: $eventPattern,
  entities_
]:= With[{
   time      = AbsoluteTime @ event["date"]
  , ent       = Select[entities, MemberQ[event["entityIds"], #id]&]
}
  ,{
    Arrowheads@.015,
    Thick,
    ent[[1, "color"]],
    AbsolutePointSize @ 4,
    Point @ {time,  ent[[1, "index"]]},
    Tooltip[
      Arrow[{
        {time,  ent[[1, "index"]]},
        {time,  ent[[2, "index"]]}
      }],
      Dynamic[Dataset@event,SingleEvaluation->True]
    ]
  }
]


(* ::Chapter:: *)
(* End package*)


End[];

EndPackage[];
