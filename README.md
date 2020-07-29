# two-hnys

Milestones:
- [x] Part 1: send event to one dataset within one team
- [ ] Part 2: send same event to two datasets within the same team
- [ ] Part 3: send same event to two datasets in two separate teams

## Part 1: send data to one dataset within one team
Does it even work? Does Shelby even know how to get data into Honeycomb?

- [x] initialize Honeycomb configuration
- [x] add dataset name
- [x] add API key from env vars
- [x] generate an event
- [x] watch my event arrive in Honeycomb UI

## Part 2: send same event to two datasets within the same team

- [ ] add second writekey to dotenv
- [ ] wrap Honeycomb class
- [ ] watch event arrive in both datasets

This is the trickiest part. Let's walk through what I'm trying to do.

- one SplitHoney
- passes event data into two Honeycomb classes
- should have the same interface as Honeycomb
- but also should have two Honeycomb objects

## Part 3: send same event to two datasets in two separate teams

- [ ] update writekey in env vars for second team
- [ ] (optional) update dataset name for second team
- [ ] watch event arrive in both teams
