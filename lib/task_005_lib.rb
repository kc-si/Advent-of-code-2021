module Task005
  module_function

  class Point
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def self.build_from_str(point)
      x, y = point.split(',').map(&:to_i)
      Point.new(x, y)
    end
  end

  class Line
    attr_reader :point1, :point2

    def initialize(point1, point2)
      @point1 = point1
      @point2 = point2
    end

    def self.build_from_hash_line(line)
      Line.new(
        Point.build_from_str(line.split(' -> ')[0]),
        Point.build_from_str(line.split(' -> ')[1]),
      )
    end
  end

  class Diagram
    attr_accessor :diagram

    def initialize(diagram = {})
      @diagram = diagram
    end

    def mark_horizontal_and_vertical(lines)
      lines.each { |line| horizontal_or_vertical?(line) ? mark_horizontal_or_vertical(line) : nil }
      diagram
    end

    def mark_horizontal_vertical_45_degree(lines)
      lines.each do |line|
        horizontal_or_vertical?(line) ? mark_horizontal_or_vertical(line) : nil
        degree_45?(line) ? mark_45_degree(line) : nil
      end
      diagram
    end

    def horizontal_or_vertical?(line)
      line.point1.x == line.point2.x || line.point1.y == line.point2.y
    end

    def degree_45?(line)
      (line.point1.x - line.point2.x).abs == (line.point1.y - line.point2.y).abs
    end

    def mark_horizontal_or_vertical(line)
      x1, x2 = [line.point1.x, line.point2.x].sort
      y1, y2 = [line.point1.y, line.point2.y].sort
      (x1..x2).each do |x|
        (y1..y2).each do |y|
          diagram.key?([x, y]) ? diagram[[x, y]] += 1 : diagram.store([x, y], 1)
        end
      end
    end

    def mark_45_degree(line)
      x1, x2 = [line.point1.x, line.point2.x].sort
      y1, y2 = [line.point1.y, line.point2.y].sort

      x = line.point1.x - line.point2.x < 0 ? (x1..x2).each.to_a : (x1..x2).each.to_a.reverse
      y = line.point1.y - line.point2.y < 0 ? (y1..y2).each.to_a : (y1..y2).each.to_a.reverse

      x.size.times do |i|
        diagram.key?([x[i], y[i]]) ? diagram[[x[i], y[i]]] += 1 : diagram.store([x[i], y[i]], 1)
      end
    end
  end

  def parse_input(input_data)
    input_data.split("\n").map { |line| Line.build_from_hash_line(line) }
  end
end
