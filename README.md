# Wi-Fi Fingerprinting Indoor Positioning (MATLAB)
Wi-Fi fingerprinting indoor positioning using RSSI measurements. Course project with provided dataset and problem statement.




**Academic Exercise** | Positioning & Location-Based Services Course

MATLAB implementation of a Wi-Fi fingerprinting-based indoor positioning system. This project uses provided calibration data and RSSI measurements to estimate user positions in a rectangular room.

##  Context

This is an **academic exercise** from the **Positioning & Location-Based Services** course. The problem statement, room configuration, and datasets were provided by the instructor.

### Problem Statement

**Given**:
- A 20m × 10m rectangular room with 10 Wi-Fi beacons on the walls
- Calibration database with 36 control points (known positions + RSSI measurements)
- User measurements from 25 unknown positions

**Task**:
- Estimate the user's trajectory using fingerprinting technique
- Visualize the results

##  Solution Approach

The implementation uses a **nearest neighbor** algorithm in RSSI space:
- Distance metric: `abs(min(user_rssi - control_rssi))`
- For each user point, find the control point with most similar RSSI signature
- Assign the control point's position as the estimated location

##  Provided Dataset

**Control Points Database** (`control_points_db.txt`):
- 36 rows (control points)
- Columns: ID, X coordinate, Y coordinate, 10 RSSI values (dBm)
- Spacing: 2 meters between points

**User Measurements** (`user_db.txt`):
- 25 rows (measurement points)
- Columns: ID, 10 RSSI values (dBm)
- Unknown positions (to be estimated)

## Technologies

- **Language**: MATLAB
- **Algorithm**: Fingerprinting with nearest neighbor matching
- **Visualization**: MATLAB plotting functions
