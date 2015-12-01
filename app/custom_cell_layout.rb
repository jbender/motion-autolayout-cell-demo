class CustomCellLayout < MotionKit::Layout
  DEFAULT_PADDING = 8

  attr_accessor :foo, :bar

  def layout
    root :cell do
      add UIImageView, :icon

      add UILabel, :foo
      add UILabel, :bar
    end
  end

  def foo=(foo)
    super
    update_frame_with_data if bar
  end

  def bar=(bar)
    super
    update_frame_with_data if foo
  end

  def update_frame_with_data
    mp "foo: #{foo} -- bar: #{bar}"

    get(:foo).text = foo ? short_foo : long_foo

    get(:bar).text = bar ? short_bar : long_bar
  end

  def short_foo
    'Fringilla Ornare'
  end

  def long_foo
    'Bibendum Justo Cursus Purus Adipiscing'
  end

  def short_bar
    'Maecenas sed diam eget risus varius blandit sit amet non magna.'
  end

  def long_bar
    'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Duis' \
    ' mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacini' \
    'a odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id el' \
    'it. Sed posuere consectetur est at lobortis. Vivamus sagittis lacus vel ' \
    'augue laoreet rutrum faucibus dolor auctor. Integer posuere erat a ante ' \
    'venenatis dapibus posuere velit aliquet. Maecenas sed diam eget risus va' \
    'rius blandit sit amet non magna.'
  end

  def icon_style
    background_color rmq.color.gray

    constraints do
      size.equals(40)
      top_left.equals(:superview).plus(DEFAULT_PADDING)
    end
  end

  def foo_style
    constraints do
      top.equals(:superview).plus(DEFAULT_PADDING)
      left.equals(nearest(:icon), :right).plus(DEFAULT_PADDING)
      right.equals(:superview).minus(DEFAULT_PADDING)
      bottom.equals(nearest(:bar), :top).minus(DEFAULT_PADDING)
    end

    line_break_mode NSLineBreakByWordWrapping
    number_of_lines 0
    size_to_fit
  end

  def bar_style
    constraints do
      foo = prev(:foo)

      left.equals(foo, :left)
      right.equals(foo, :right)
      bottom.equals(:superview).minus(DEFAULT_PADDING)
    end

    line_break_mode NSLineBreakByWordWrapping
    number_of_lines 0
    size_to_fit
  end
end
