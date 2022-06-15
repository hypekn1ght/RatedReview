Rated Review V1

So all we are storing on the blockchain so far is 

- id of review (uint256)
- address of review submitter (address)
- score of review (uint256)
- google CID relevant to review (uint256)

The Centralized rating system then can :

1. poll all available reviews from the blockchain of choice
2. poll review strings on centralized database based on review ID
3. calculate address karma and serve ⇒ website
4. calculate business rating and serve ⇒ website

## RatedReview.sol

Main structure
```
Struct Review {

cid: uint256,

score: uint8,

reviewer: address

}

mapping (uint256⇒ Review) reviewDatabase;
```

## Functions :

1. setReview
2. getter functions