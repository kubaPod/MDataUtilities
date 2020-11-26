# MDataUtilities

Data wrangling and visualization utilities for Mathematica


## Installation
 
### Manual
 
   Go to 'releases' tab and download appropriate .paclet file.
    
   Run `PacletInstall @ path/to/the.paclet` file
   
### Via WRF:GitHubInstall
   
    ResourceFunction["GitHubInstall"]["kubapod", "MDataUtilities"]

## Load


```mathematica
<< MDataUtilities`
```

### Examples

#### TimelineGraph

```
$entities = CharacterRange["a", "j"];
SeedRandom[10];
$events = Table[
   <|
    "date" -> 
     ResourceFunction["RandomDate"][{DateObject@{2020, 1, 1}, Today}],
    "entityIds" -> RandomSample[$entities, 2]
    |>,
   20
   ];

TimelineGraph[$events, ImageSize -> 700]

```

![1ovopttx9vnge](img/1ovopttx9vnge.png)

#### GroupByMerge

```
$dataset = {<|"a" -> 1, "c" -> 2|>, <|"a" -> 1, "b" -> 2|>, <|
    "a" -> 2, "c" -> 1|>};

GroupByMerge[$dataset, Key["a"], First]
```

#### EnumerateRecords

```
EnumerateRecords@$dataset

EnumerateRecords[$dataset, "pos"]
```

#### ApplyKeyAdd

```
ApplyKeyAdd["x" -> (#a^2 &)] /@ $dataset
```