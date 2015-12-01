class CustomCell < UITableViewCell
  def initWithStyle(style, reuseIdentifier: identifier)
    super
    @layout = CustomCellLayout.new(root: WeakRef.new(self)).build
    self
  end

  def obj=(obj)
    @layout.foo = obj[:foo]
    @layout.bar = obj[:bar]
  end

  def updateViewConstraints
    @layout.root.size_to_fit
    super
  end
end
