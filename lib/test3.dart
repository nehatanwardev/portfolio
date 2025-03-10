/// Solution for the gas station queue problem.
///
/// This function calculates the maximum waiting time for cars in a queue
/// to refuel at three dispensers with initial fuel amounts X, Y, and Z.
/// If any car is unable to refuel, the function returns -1.
int solution(List<int> A, int X, int Y, int Z) {
  if (A.isEmpty) return 0;

  // Number of cars
  int n = A.length;

  // Initial fuel in dispensers X, Y, Z
  List<int> fuel = [X, Y, Z];

  // Dispensers currently in use (-1 if free, otherwise car index)
  List<int> dispensers = [-1, -1, -1];

  // Time when each dispenser will be free
  List<int> freeTime = [0, 0, 0];

  // Queue of cars waiting to be served (indices)
  List<int> queue = List.generate(n, (i) => i);

  // Waiting time for each car
  List<int> waitingTime = List.filled(n, 0);

  // Current time
  int currentTime = 0;

  // Process until all cars are served or we determine it's impossible
  while (queue.isNotEmpty) {
    // Check if any dispensers are free at current time
    List<int> freeDispensers = [];
    for (int i = 0; i < 3; i++) {
      if (freeTime[i] <= currentTime) {
        dispensers[i] = -1; // Mark dispenser as free
        freeDispensers.add(i);
      }
    }

    // Try to assign cars to free dispensers
    bool carAssigned = false;

    // Process the first car in the queue
    if (queue.isNotEmpty && freeDispensers.isNotEmpty) {
      int carIndex = queue[0];
      int fuelNeeded = A[carIndex];

      // Find the best dispenser (smallest letter with enough fuel)
      int bestDispenser = -1;
      for (int i in freeDispensers) {
        if (fuel[i] >= fuelNeeded) {
          bestDispenser = i;
          break; // X < Y < Z, so we can take the first one that fits
        }
      }

      // If a suitable dispenser was found
      if (bestDispenser != -1) {
        // Calculate waiting time
        waitingTime[carIndex] = currentTime;

        // Assign car to dispenser
        dispensers[bestDispenser] = carIndex;
        freeTime[bestDispenser] = currentTime + fuelNeeded;
        fuel[bestDispenser] -= fuelNeeded;

        // Remove car from queue
        queue.removeAt(0);
        carAssigned = true;
      }
    }

    // If no car was assigned, advance time to next dispenser free time
    if (!carAssigned) {
      // If all dispensers are free but first car can't be served, return -1
      if (freeDispensers.length == 3 && queue.isNotEmpty) {
        return -1; // Impossible to serve all cars
      }

      // Find the next time a dispenser will be free
      int nextTime = -1;
      for (int i = 0; i < 3; i++) {
        if (dispensers[i] != -1 && (nextTime == -1 || freeTime[i] < nextTime)) {
          nextTime = freeTime[i];
        }
      }

      if (nextTime == -1) {
        // This shouldn't happen if the code is correct
        return -1;
      }

      currentTime = nextTime;
    }
  }

  // Calculate maximum waiting time
  int maxWaitingTime = 0;
  for (int i = 0; i < n; i++) {
    maxWaitingTime =
        waitingTime[i] > maxWaitingTime ? waitingTime[i] : maxWaitingTime;
  }

  return maxWaitingTime;
}

// Test cases
void main() {
  // Test case 1
  List<int> A1 = [2, 8, 4, 3, 2];
  int X1 = 7, Y1 = 11, Z1 = 3;
  print("Test case 1: ${solution(A1, X1, Y1, Z1)}"); // Expected: 8

  // Test case 2
  List<int> A2 = [5];
  int X2 = 4, Y2 = 0, Z2 = 3;
  print("Test case 2: ${solution(A2, X2, Y2, Z2)}"); // Expected: -1
}
