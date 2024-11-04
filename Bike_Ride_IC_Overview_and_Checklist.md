# Bike Ride Independent Challenge (IC): Overview and Structure

The **Bike Ride IC** is a project focused on building a Ruby application using object-oriented programming principles. It simulates the main features of a biking app within a bike club setting. The idea is to design classes and methods that capture the activities and interactions of bikers and track details about their rides.

## Project Concept

In this challenge, I’ll create a program that keeps track of different biking routes (rides) and individual bikers, each with their preferences and ride records. A `BikeClub` class will serve as the central manager, allowing the club to organize and analyze rides, biker records, and even group events.

I’ll build out functionality progressively, with each iteration adding new features and complexity to bring the biking experience closer to real life.

## Project Structure and Logic

Here’s a breakdown of each iteration:

---

# Iteration 1: `Ride` Class

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

# Iteration 1 Reflection: Ride Class

### Overview:
In **Iteration 1**, the goal was to create a `Ride` class that models an individual biking route with attributes like `name`, `distance`, `loop`, and `terrain`. This class also included methods to check if the route was a loop and calculate the total distance accordingly.

### Challenges and Fixes:
1. **Forgotten `attr_reader`**: Initially, some attributes like `name` and `distance` weren’t accessible outside the class because `attr_reader` wasn’t added. Adding `attr_reader` for each attribute fixed this issue and allowed easy access to these values.
2. **Missing Method `loop?`**: I initially forgot to define the `loop?` method, which led to an error when trying to check if the ride was a loop. Adding `def loop?` and returning the `@loop` instance variable fixed this.
3. **End Keyword Errors**: While defining methods, I encountered errors because I missed the `end` keyword in a couple of places. Adding the correct `end` statements resolved these syntax issues.

### Key Takeaways:
- Understanding the role of `attr_reader` and how it enables read-only access to instance variables.
- The importance of defining all methods required by the iteration, such as `loop?` and `total_distance`.

---

# Iteration 2: `Biker` Class

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

# Iteration 2 Reflection: Biker Class

### Overview:
**Iteration 2** focused on building the `Biker` class, which included attributes like `name`, `max_distance`, `acceptable_terrain`, and `rides`. This class was designed to log rides based on terrain and distance requirements and keep track of each biker’s personal best time for specific rides.

### Challenges and Fixes:
1. **Empty Hash Initialization for `rides`**: Initially, `rides` wasn’t initialized as a hash, causing errors when trying to log rides. Adding `@rides = {}` in the initializer resolved this issue.
2. **Missing `learn_terrain!` Method**: The first attempt to add terrain failed because the `learn_terrain!` method wasn’t defined. Adding this method allowed bikers to store acceptable terrains in the `acceptable_terrain` array.
3. **Errors in `personal_record` Logic**: There were issues when `personal_record` returned incorrect results or errors for unlogged rides. Adding a check with `|| false` helped ensure that `personal_record` returned `false` when no time was recorded for a ride.
4. **End Keyword Issues**: A missing `end` keyword in one of the methods caused syntax errors, and adding it corrected this.

### Key Takeaways:
- Initializing instance variables correctly is essential, especially when the variable is expected to be a specific data type like a hash or array.
- Using `|| false` in methods to handle cases where no data is present, which helped avoid unexpected errors.

---

# Iteration 3: `BikeClub` Class

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

# Iteration 3 Reflection: BikeClub Class

### Overview
**Iteration 3**, I created the `BikeClub` class, designed to manage multiple `Biker` instances. This iteration included methods to add bikers, find the biker with the most rides, determine the best time for a ride, and check eligibility based on terrain and distance.

### Challenges and Fixes:
1. **Forgot to Add `attr_reader` for `bikers` and `name`**: Initially, I couldn’t access `bikers` and `name` outside the class because `attr_reader` was missing. Adding `attr_reader` fixed this issue.
2. **Logic Errors in `most_rides`**: The initial implementation of `most_rides` didn’t account for counting total rides across all bikers. Using `max_by { |biker| biker.rides.values.flatten.size }` resolved this by flattening the nested arrays and accurately counting rides.
3. **Missing `end` in `bikers_eligible` Method**: There was a syntax error due to a missing `end` keyword. Adding the `end` at the correct place fixed this.
4. **Testing Issues with Eligibility**: While testing `bikers_eligible`, I realized it wasn’t filtering bikers correctly due to a logic error. Adjusting the conditions in the `select` block to check both `terrain` and `max_distance` solved this problem.

### Key Takeaways:
- Flattening nested arrays using `flatten` can be very helpful for counting elements across multiple nested levels.
- The `select` method is powerful for filtering based on multiple conditions, and adjusting logic within it helped fix filtering issues.

---

# Iteration 4: Extensions (Advanced Bike Club Features)

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

# Iteration 4 Reflection: Advanced Features in BikeClub

### Overview:
**Iteration 4** introduced advanced features in `BikeClub`, including tracking group rides and identifying the best rider across all instances of `BikeClub`. This iteration also required mocking time to make testing predictable.

### Challenges and Fixes:
1. **Initialization of `group_rides` Array**: Initially, `group_rides` was not set up correctly due to a typo (`@group_rides + []` instead of `@group_rides = []`). Fixing this allowed `group_rides` to store recorded rides correctly.
2. **Testing `record_group_ride` with Stubs**: Setting up `Time.now` stubs was tricky, but using `allow(Time).to receive(:now).and_return(...)` in the test setup made it predictable and ensured tests could verify specific start times.
3. **Referencing `@group_rides` in Methods**: I initially used `group_rides` instead of `@group_rides`, which created a local variable rather than updating the instance variable. Adding `@` fixed this issue.
4. **Finding Best Rider Across All Clubs**: Implementing `best_rider` was challenging because it needed to check all instances of `BikeClub`. Using `ObjectSpace.each_object(BikeClub)` allowed the method to iterate through all clubs and find the best rider.

### Key Takeaways:
- Stubbing `Time.now` is crucial for predictable test results, especially when time is involved in business logic.
- Referencing instance variables correctly with `@` is essential to avoid creating unintended local variables.
- `ObjectSpace.each_object` can be useful for iterating through all instances of a class, especially when implementing class-level methods that operate across multiple instances.
