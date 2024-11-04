# Bike Ride Independent Challenge (IC): Overview and Structure

The **Bike Ride IC** is a project focused on building a Ruby application using object-oriented programming principles. It simulates the main features of a biking app within a bike club setting. The idea is to design classes and methods that capture the activities and interactions of bikers and track details about their rides.

## Project Concept

In this challenge, I’ll create a program that keeps track of different biking routes (rides) and individual bikers, each with their preferences and ride records. A `BikeClub` class will serve as the central manager, allowing the club to organize and analyze rides, biker records, and even group events.

I’ll build out functionality progressively, with each iteration adding new features and complexity to bring the biking experience closer to real life.

## Project Structure and Logic

Here’s a breakdown of each iteration:

---

### Iteration 1: `Ride` Class

The `Ride` class represents an individual biking route with:

- **Attributes**: `name`, `distance`, `loop` (if it’s a circular route), and `terrain`.
- **Behaviors**:
  - `total_distance`: Returns the distance of the ride, which doubles for non-loop routes (round trip).
  - `loop?`: Returns whether the route is a loop.

The `Ride` class allows bikers to easily check if a route meets their preferences, especially regarding distance and loop type.

**Checklist for Iteration 1:**
- [ ] Create `Ride` class with `name`, `distance`, `loop`, and `terrain` attributes.
- [ ] Implement `loop?` method to return if the ride is a loop.
- [ ] Implement `total_distance` method to calculate the total distance.
- [ ] Write and pass tests for each method.

**Reflection for Iteration 1:**
- **Name:** Qory
**Reflection:** How did you feel completing this iteration? What went well, and what could you improve on in the future?

---

### Iteration 2: `Biker` Class

The `Biker` class models a biker’s individual preferences and ride history:

- **Attributes**: `name`, `max_distance`, `acceptable_terrain`, and `rides` (a log of each ride and its recorded times).
- **Behaviors**:
  - `learn_terrain!`: Adds new types of terrain to the biker’s acceptable list.
  - `log_ride`: Logs a ride if the biker meets the ride’s requirements (matching terrain and within max distance).
  - `personal_record`: Finds the biker’s best (lowest) time for a specific ride.

This class introduces constraints, such as restricting bikers from logging rides that don’t match their preferences, creating a more realistic simulation.

**Checklist for Iteration 2:**
- [ ] Create `Biker` class with `name`, `max_distance`, `acceptable_terrain`, and `rides` attributes.
- [ ] Implement `learn_terrain!` method to add acceptable terrain.
- [ ] Implement `log_ride` method to log rides if they meet requirements.
- [ ] Implement `personal_record` to find the best time for a ride.
- [ ] Write and pass tests for each method.

**Reflection for Iteration 2:**
- **Name:** Qory
- **Reflection:** How did you feel completing this iteration? What challenges did you face, and how did you overcome them?

---

### Iteration 3: `BikeClub` Class

The `BikeClub` class represents a club where bikers can share their activities and achievements:

- **Attributes**: `name` and `bikers` (a list of all club members).
- **Behaviors**:
  - `add_biker`: Adds a new biker to the club.
  - `most_rides`: Identifies the biker with the most logged rides.
  - `best_time`: Finds the biker with the best time on a specific ride.
  - `bikers_eligible`: Filters and lists bikers who are eligible for a particular ride based on terrain and distance limits.

This class enables group-level tracking, helping determine the most experienced or fastest riders.

**Checklist for Iteration 3:**
- [ ] Create `BikeClub` class with `name` and `bikers` attributes.
- [ ] Implement `add_biker` to add a biker to the club.
- [ ] Implement `most_rides` to find the biker with the most logged rides.
- [ ] Implement `best_time` to find the best time for a specific ride.
- [ ] Implement `bikers_eligible` to list eligible bikers based on terrain and distance.
- [ ] Write and pass tests for each method.

**Reflection for Iteration 3:**
- **Name:** Qory
- **Reflection:** How did you feel completing this iteration? Any new insights or areas to improve for future iterations?

---

### Iteration 4: Extensions (Advanced Bike Club Features)

This final iteration adds the `record_group_ride` feature, which simulates a group event where all eligible bikers start a ride at the same time and finish individually:

- **Features**:
  - Records the start time (same for all bikers) and individual finish times for each biker.
  - Uses Ruby’s `Time` class to capture these events. Testing this feature involves using mocks or stubs to simulate different times.
  - Keeps a log of all recorded group rides, enabling the club to review and find the best time among bikers across all rides.

**Checklist for Iteration 4:**
- [ ] Implement `record_group_ride` method to record start and finish times.
- [ ] Implement `group_rides` to log recorded group rides.
- [ ] Write tests using mocks and stubs to simulate time for group rides.
- [ ] Ensure `self.best_rider` accurately finds the best rider across all clubs.

**Reflection for Iteration 4:**
- **Name:** Qory
- **Reflection:** How did this final iteration go? Any additional thoughts on the challenge as a whole or ways you’d improve next time?
