#!/usr/bin/ruby

# Centripetal force by latitude:
# http://justinparrtech.com/JustinParr-Tech/centrifugal-force-at-the-earths-surface/

ARTIFACT_MASS = 0.0241 # kg

EARTH_MEAN_RADIUS = 6371008.8 # meters
HOUSTON_LATITUDE = 29.801445 * Math::PI/180.0 # radians N at 908 Winston St, Houston, TX
EARTH_MAJOR_RADIUS = 6378137.0
EARTH_FLATTENING   = 1.0 / 298.257223563
EARTH_MINOR_RADIUS = EARTH_MAJOR_RADIUS * (1.0 - EARTH_FLATTENING)
EARTH_DAY_LENGTH = 24.0 * 60.0 * 60.0 # seconds
EARTH_CIRCUMFERENCE = 40070000.0 # meters
EARTH_EQUATORIAL_VELOCITY = EARTH_CIRCUMFERENCE / EARTH_DAY_LENGTH
HOUSTON_GRAVITATIONAL_ACCELERATION = 9.79197

def radius_at_geodetic_latitude phi, a: EARTH_MAJOR_RADIUS, b: EARTH_MINOR_RADIUS
  # http://gis.stackexchange.com/questions/20200/how-do-you-compute-the-earths-radius-at-a-given-geodetic-latitude
  numerator   = (a*a * Math.cos(phi))**2 + (b*b*Math.sin(phi))**2
  denominator = (a * Math.cos(phi))**2 + (b * Math.sin(phi))**2
  Math.sqrt(numerator / denominator)
end

def velocity_at_geodetic_latitude phi, v_equator: EARTH_EQUATORIAL_VELOCITY
  v_equator * Math.cos(phi)
end

def centripetal_acceleration_at_geodetic_latitude phi, v_equator: EARTH_EQUATORIAL_VELOCITY, a: EARTH_MAJOR_RADIUS, b: EARTH_MINOR_RADIUS
  v = velocity_at_geodetic_latitude(phi, v_equator: v_equator)
  r = radius_at_geodetic_latitude(phi, a: a, b: b) * Math.cos(phi)
  v * v / r
end

def centripetal_force_at_geodetic_latitude mass, phi, v_equator: EARTH_EQUATORIAL_VELOCITY, a: EARTH_MAJOR_RADIUS, b: EARTH_MINOR_RADIUS
  force = mass * centripetal_acceleration_at_geodetic_latitude(phi, v_equator: v_equator, a: a, b: b)
end

def gravitational_force_at_geodetic_latitude mass, phi, v_equator: EARTH_EQUATORIAL_VELOCITY, a: EARTH_MAJOR_RADIUS, b: EARTH_MINOR_RADIUS
  force = mass * HOUSTON_GRAVITATIONAL_ACCELERATION
end

puts "v = "
puts velocity_at_geodetic_latitude(HOUSTON_LATITUDE)

puts "ac(Houston) = "
puts centripetal_acceleration_at_geodetic_latitude(HOUSTON_LATITUDE)

puts "ac(0.0) = "
puts centripetal_acceleration_at_geodetic_latitude(0.0)

puts "ac(90.0) = "
puts centripetal_acceleration_at_geodetic_latitude(Math::PI / 2.0)

force_c = centripetal_force_at_geodetic_latitude(ARTIFACT_MASS, HOUSTON_LATITUDE)
force_g = gravitational_force_at_geodetic_latitude(ARTIFACT_MASS, HOUSTON_LATITUDE)
puts "Fc = "
puts force_c
puts "Fg = "
puts force_g
puts "Fnet = "
puts force_g - force_c

usual_object_apparent_mass = force_g - force_c
artifact_apparent_mass      = force_g

puts "radius in Houston = "
puts radius_at_geodetic_latitude(HOUSTON_LATITUDE)

puts "m_usual = "
puts usual_object_apparent_mass

puts "m_obs = "
puts artifact_apparent_mass

puts "ratio = "
puts artifact_apparent_mass / usual_object_apparent_mass
