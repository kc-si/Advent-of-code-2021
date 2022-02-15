module Task005
  module_function

  class Point
    attr_reader :x, :y

    def self.from_input(point)
      x, y = point.split(',').map(&:to_i)
      Point.new(x, y)
    end

    def initialize(x, y)
      @x = x
      @y = y
    end
  end

  class Line
    attr_reader :point1, :point2

    def self.from_input(line)
      point1, point2 = line.split(' -> ').map { |point| Point.from_input(point) }
      Line.new(point1, point2)
    end

    def initialize(point1, point2)
      @point1 = point1
      @point2 = point2
    end

    def horizontal_or_vertical?(line)
      line.point1.x == line.point2.x || line.point1.y == line.point2.y
    end

    def degree_45?(line)
      (line.point1.x - line.point2.x).abs == (line.point1.y - line.point2.y).abs
    end

    def points_on_line(line)
      if horizontal_or_vertical?(line)
        points = []
        x1, x2 = [line.point1.x, line.point2.x].sort
        y1, y2 = [line.point1.y, line.point2.y].sort
        (x1..x2).each do |x|
          (y1..y2).each do |y|
            points << [x, y]
          end
        end
      elsif degree_45?(line)
        points = []
        x1, x2 = [line.point1.x, line.point2.x].sort
        y1, y2 = [line.point1.y, line.point2.y].sort

        x = line.point1.x - line.point2.x < 0 ? (x1..x2).each.to_a : (x1..x2).each.to_a.reverse
        y = line.point1.y - line.point2.y < 0 ? (y1..y2).each.to_a : (y1..y2).each.to_a.reverse

        x.size.times do |i|
          points << [x[i], y[i]]
        end
      end
      points
    end
  end

  class Diagram
    attr_accessor :diagram

    def initialize(diagram = {})
      @diagram = diagram
    end

    def mark_line(line)
      line.points_on_line(line).each do |x, y|
        @diagram.key?([x, y]) ? @diagram[[x, y]] += 1 : @diagram.store([x, y], 1)
      end
    end

    def mark_horizontal_and_vertical(lines)
      lines.each { |line| line.horizontal_or_vertical?(line) ? mark_line(line) : nil }
      @diagram
    end

    def mark_horizontal_vertical_45_degree(lines)
      lines.each do |line|
        line.horizontal_or_vertical?(line) ? mark_line(line) : nil
        line.degree_45?(line) ? mark_line(line) : nil
      end
      @diagram
    end
  end

  def parse_input(input_data)
    input_data.split("\n").map { |line| Line.from_input(line) }
  end
end
