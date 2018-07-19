# Triangle Project Code.

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  side_sum = [a,b,c].reduce(:+)
  long_side = [a,b,c].max

  # Check for invalid inputs first:
  if [a,b,c].any? { |x| x <= 0 }
    raise TriangleError #"Negative or zero-length side"
  elsif side_sum <= long_side * 2
    raise TriangleError #"Invalid sides"

  # Then categorise:
  elsif a == b && a == c
    # all 3 sides are equal
    return :equilateral
  elsif (a != b) && (a != c) && (b != c)
    # no sides are equal
    return :scalene
  else
    # by elimination, 2 sides must be equal
    return :isosceles
  end
end
