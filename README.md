# two-hnys

Milestones:
- [x] Part 1: send event to one dataset within one team
- [x] Part 2: send same event to two datasets within the same team
- [x] Part 3: send same event to two datasets in two separate teams

## Part 1: send data to one dataset within one team
Does it even work? Does Shelby even know how to get data into Honeycomb?

- [x] initialize Libhoney
- [x] add dataset name
- [x] add API key from env vars
- [x] generate an event
- [x] watch my event arrive in Honeycomb

## Part 2: send same event to two datasets within the same team

- [x] add second writekey to dotenv
- [x] wrap libhoney
- [x] watch event arrive in both datasets

This is the trickiest part. Let's walk through what I'm trying to do.

- one SplitHoney
- passes event data into two Libhoneys
- should have the same interface as Libhoney
- but also should have two Libhoney objects

HA GOT IT.

![Raw data view in Honeycomb shown in two browser windows with the same event timestamp in two separate datasets](https://p-81fa8j.b1.n0.cdn.getcloudapp.com/items/d5uWKReB/Image%202020-07-20%20at%206.27.33%20PM.png)

## Part 3: send same event to two datasets in two separate teams

- [x] update writekey in env vars for second team
- [x] (optional) update dataset name for second team
- [x] watch event arrive in both teams

A HA!

Here's an event being sent to the `two-hnys-1` dataset in my novalogic team:

![Raw data view in novalogic team with an arrow pointing to the most recent event timestamp](https://p-81fa8j.b1.n0.cdn.getcloudapp.com/items/OAuBAnoB/Screen%20Shot%202020-07-20%20at%206.51.35%20PM.png?v=0c005d2772a69166740e28735ff58b26)

and here's the same event arriving in the `two-hnys` dataset of the Honeycomb internal team!

![Raw data view in Honeycomb internal team with an arrow pointing to the only event, with the same timestamp as the previous example](https://p-81fa8j.b1.n0.cdn.getcloudapp.com/items/mXuAlKxO/Image%202020-07-20%20at%206.48.10%20PM.png)

I DID IT.
