require 'date'

class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(items)
    names = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, _|
        if item == items
          names << vendor
        end
      end
    end
    names
  end

  def total_inventory
    total = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item1|
        if item1[0].name == "Peach"
          total[item1[0]] = {quantity: item1[1], vendors: [vendor]}
        elsif item1[0].name == "Tomato"
          total[item1[0]] = {quantity: item1[1], vendors: [vendor]}
        elsif item1[0].name == "Banana Nice Cream"
          total[item1[0]] = {quantity: item1[1], vendors: [vendor]}
        else item1[0].name == "Peach-Raspberry Nice Cream"
          total[item1[0]] = {quantity: item1[1], vendors: [vendor]}
        end
      end
    end
    total
  end

  def overstocked_items
    @vendors.map do |vendor|
      vendor.inventory.find_all do |item|
        if item[1] > 50
        return item[0]
        end
      end
    end.flatten
  end

  def sorted_item_list
    names = []
    @vendors.map do |vendor|
      vendor.inventory.each do |items|
        names << items[0].name
      end
    end
   names.uniq.sort
  end

  def date
    Time.new.strftime("%d/%m/%Y")
  end
end
