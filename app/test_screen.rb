class TestScreen < PM::GroupedTableScreen
  row_height :auto, estimated: 100

  title 'Test Screen'

  def table_data
    [{
      :title => 'First Section',
      :title_view_height => 12,
      :cells => [{
        :cell_class => CustomCell,
        :properties => { :obj => { :foo => coin_flip, :bar => coin_flip } }
      }, {
        :cell_class => CustomCell,
        :properties => { :obj => { :foo => coin_flip, :bar => coin_flip } }
      }]
    }, {
      :title => 'Second Section',
      :title_view_height => 12,
      :cells => [{
        :cell_class => CustomCell,
        :properties => { :obj => { :foo => coin_flip, :bar => coin_flip } }
      }, {
        :cell_class => CustomCell,
        :properties => { :obj => { :foo => coin_flip, :bar => coin_flip } }
      }]
    }]
  end

  private

  def coin_flip
    [true, false].sample
  end
end
