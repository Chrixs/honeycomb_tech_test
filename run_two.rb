require './lib/cumulative_discounts'
require './lib/broadcaster'
require './lib/discounts'
require './lib/delivery'
require './lib/material'
require './lib/order'

discounts = Discounts.new
cumulative_discounts = CumulativeDiscounts.new

standard_delivery = Delivery.new(:standard, 10.0)
express_delivery = Delivery.new(:express, 20.0)

broadcaster_1 = Broadcaster.new('Viacom')
broadcaster_2 = Broadcaster.new('Disney')
broadcaster_3 = Broadcaster.new('Discovery')
broadcaster_4 = Broadcaster.new('ITV')
broadcaster_5 = Broadcaster.new('Channel 4')
broadcaster_6 = Broadcaster.new('Bike Channel')
broadcaster_7 = Broadcaster.new('Horse and Country')

material = Material.new('ZDW/EOWW005/010')

order = Order.new(material, discounts, cumulative_discounts)

order.add broadcaster_1, express_delivery
order.add broadcaster_2, express_delivery
order.add broadcaster_3, express_delivery

print order.output
print "\n"
