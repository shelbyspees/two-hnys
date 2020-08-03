# two-hnys

This time, we're using the Beeline's presend hook to update the second copy of the event to gain an additional field before sending it to the second dataset.

At this point we've established that we can send the same event to two separate teams, so I won't worry about that, I'll just send to two datasets within the same team so I don't have to switch back and forth.

Using the presend hook requires the Beeline config setup, so I can't use my previous Libhoney implementation of SplitHoney. So we might have to back up a bit.

Milestones:
- [x] Part 1: send event to one dataset within one team
- [ ] Part 2: send same event to two datasets with same fields
- [ ] Part 3: send same event to two datasets where one has a bonus field

## Part 1: send data to one dataset within one team
This time we're using the Beeline instead of Libhoney.

- [x] initialize Honeycomb configuration
- [x] add dataset name
- [x] add API key from env vars
- [x] generate an event
- [x] watch my event arrive in Honeycomb UI

## Part 1.5 send same event to two datasets using Beeline and SplitHoney

We can pass in SplitHoney as the Beeline config's `client` object and it'll send each event to both Libhoneys underneath. Unfortunately, this doesn't set us up to use the Beeline's presend hook.

## Part 2: send same event to two datasets with same fields
Using the Beeline requires different SplitHoney logic compared to the previous Libhoney version.

Still kinda figuring out the plan here, but we're gonna try inheriting the `Honeycomb::Client` object to see if we can extend the interface and use two client objects and configurations underneath.

## Part 3: add bonus field to second copy of the event

Using the presend hook in one of our two Honeycomb configuration objects.
