# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# sqlite reset
Item.destroy_all
ActiveRecord::Base.connection.execute("DELETE from items")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'items'")
User.destroy_all
ActiveRecord::Base.connection.execute("DELETE from users")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
ActiveRecord::Base.connection.execute("DELETE from items_users")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'items_users'")
ActiveRecord::Base.connection.execute("DELETE from carts")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'carts'")
ActiveRecord::Base.connection.execute("DELETE from ratings")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'ratings'")
ActiveRecord::Base.connection.execute("DELETE from purchases")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'purchases'")
ActiveRecord::Base.connection.execute("DELETE from subscribers")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'subscribers'")

# pg reset
#Item.destroy_all
#User.destroy_all
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE items RESTART IDENTITY;")
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE users RESTART IDENTITY;")
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE items_users RESTART IDENTITY;")
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE carts RESTART IDENTITY;")
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE ratings RESTART IDENTITY;")
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE subscribers RESTART IDENTITY;")
#ActiveRecord::Base.connection.execute("TRUNCATE TABLE purchases RESTART IDENTITY;")


Item.new
i1 = Item.new(name: "COOFANDY Men's Paisley Cotton Long Sleeve Shirt Floral Print Casual Retro Button Down Shirt", category: "Men", price: 28.99, itemdescription: "Button closure,,Material: 98% Cotton, offers you good feelings.,Process: High-end print process,the trendy vibrant color,do not shrink,do not fade.,Design: Button-front shirt featuring long sleeve,spread collar and adjustable cuffs,floral printing all over,and the hawaiian aloha style,these shirt will makes you stand out in the crowd.,Occasion: Retro printing design,printed shirt good for usual casual life,seaside vacation,beach,business,holiday,festivals,parties,provides choice for all occasions.", asseturl: "MenCasualRetroShirt.jpg", tag: "Shirt", colour: "RED,BLUE,GREEN,BLACK", size: "Small,Medium,Large", popularity: 2)  
i2 = Item.new(name: "COOFANDY Men's Business Dress Shirt Long Sleeve Slim Fit Casual Button Down Shirt", category: "Men", price: 29.99, itemdescription: "Button closure, Hand washable,Material: 98% Cotton 2% Polyester.,Fabric Material: High quality fabric,Slim fit style and with contrast color collar and cuff fashionable design shirt,make you handsome and attractive.,Features: button-front shirt, solid color, obscure plaid pattern, contrast color collar and cuff, long sleeves. Usually with a jacket, tie and a suit or formalwear, but this shirts are also worn more casually.,Occasion:Suitable for casual daily or as a formal business shirts, party, wedding, all seasons and any occasion, Perfect gift for families, friends or boyfriend.", asseturl: "MenCasualDiamondShirt.jpg", tag: "Shirt", colour: "RED,BLUE,GREEN,BLACK", size: "Small,Medium,Large", popularity: 0)  
i3 = Item.new(name: "COOFANDY Men's Slim Fit Floral Dress Shirt Long Sleeve Casual Button Down Shirts", category: "Men", price: 29.99, itemdescription: "Material: 98% Polyester, 2% Other, Button closure ,Hand Wash,Material - Slim fit, fits true to size, great quality silk touch fashion floral printed dress shirt fabric lets you be stylish and unique from crowd. This Mens shirts is a must-have on your wardrobe.,Design - All over Floral Printed ,Turn down collar,Slim Fit Button Down Dress Shirt. It's great to match with your deep blue jeans will add a graceful essence to your ensemble ,and look fresh .,Stylish-These floral button down shirts are perfect to wear suit jacket,or you can pair this floral silk long sleeve dess shirt with jeans or any types pants in all season. Flower shirts never go out of style.,Occasion - Fashionable print style button shirts are suitable for leisure,work, dating, dinner,costume parties, themed parties, streetwear, Hip Hop, Shows,daily life...perfect choice for a variety of occasions. floral printed shirt makes you more Stylish and Handsome.", asseturl: "MenCasualFloralShirt.jpg", tag: "Shirt", colour: "RED,BLUE,BLACK", size: "Small,Medium,Large", popularity: 1)  
i4 = Item.new(name: "Tinkwell Men's Casual Long Sleeve Shirt Button Down Shirt Cotton Regular fit Dress Shirts", category: "Men", price: 21.50, itemdescription: "Button closure, Wash cold,Material:98% Cotton, 2% Polyester,good fabric quality and style ensure that you feel good and comfortable when you wear it,Design: Classic design; Button closure; Long sleeves; Lightweight cotton fabric;Solid color;Soft & breathable;Good quality fabric.this long sleeve button down dress shirt characterized by contrasting color design on collar, sleeves and front, modern and stylish,Occasion:Fashion style button up shirt, regular fit, comfortable to wear, suitable for all seasons and many occasions, such casual, work, or party.Perfect Gift for families, friends or boyfriend", asseturl: "MenCasualBlackShirt.jpg", tag: "Shirt", colour: "RED,BLUE,GREEN,BLACK", size: "Small,Medium,Large", popularity: 0)  
i5 = Item.new(name: "Calvin Klein Women's Sleeveless Sheath with Chiffon Caplet Overlay", category: "Women", price: 22.97, itemdescription: "94% Polyester, 6% Spandex,Imported,Zipper closure,Dry Clean Only,Flattering fit", asseturl: "CalvinKleinWhiteDress.jpg", tag: "Dress", colour: "RED,BLUE,GREEN,BLACK", size: "Small,Medium,Large", popularity: 1)  
i6 = Item.new(name: "Calvin Klein Women's Solid V Neck Belted Jumpsuit", category: "Women", price: 35.99, itemdescription: "94% Polyester, 6% Spandex,Imported,Zipper closure,Dry Clean Only,Flattering fit", asseturl: "CalvinKleinBlueDress.jpg", tag: "Dress", colour: "RED,BLUE,GREEN,BLACK", size: "Small,Medium,Large", popularity: 0)  
i7 = Item.new(name: "Calvin Klein Women's Short Shoulder Sheath with Flutter Sleeves", category: "Women", price: 31.36, itemdescription: "94% Polyester, 6% Spandex,Imported,Zipper closure,Dry Clean Only,Flattering fit", asseturl: "CalvinKleinBlackDress.jpg", tag: "Dress", colour: "RED,BLUE,GREEN,BLACK", size: "Small,Medium,Large", popularity: 2)  
i8 = Item.new(name: "Calvin Klein Women's Belted Jumpsuit with Flutter Sleeves", category: "Women", price: 84.05, itemdescription: "94% Polyester, 6% Spandex,Imported,Zipper closure,Dry Clean Only,Flattering fit", asseturl: "CalvinKleinBlackFloralDress.jpg", tag: "Dress", colour: "PURPLE", size: "Small,Medium,Large", popularity: 0)  
i9 = Item.new(name: "Nike Boys' Dri FIT Triple Futura Graphic T Shirt and Shorts 2 Piece Set", category: "Kids,Men", price: 26.49, itemdescription: "100% Polyester,Nike Dri-FIT moisture-wicking technology keeps him dry and comfortable.,Ribbed crewneck on shirt. Knit fabric shorts.,Tagless neck. Nike Swoosh graphic print at chest.,Nike Swoosh logo at leg. Elastic and tagless waistband for added comfort. Fabric : 100% polyester", asseturl: "KidsRedNikeSet.jpg", tag: "Shirt,Sporting", colour: "RED,BLUE,GREEN,BLACK", size: "Small", popularity: 5)  
i10 = Item.new(name: "Air Jordan Jumpman 2 Piece Boys Outfit Set", category: "Kids", price: 21.50, itemdescription: "100% Polyester,Nike Dri-FIT moisture-wicking technology keeps him dry and comfortable.,Ribbed crewneck on shirt. Knit fabric shorts.,Tagless neck. Elastic and tagless waistband for added comfort. Fabric : 100% polyester", asseturl: "KidsRedJumpManSet.jpg", tag: "Shirt,Sporting", colour: "BLACK", size: "Small", popularity: 1)  
i11 = Item.new(name: "Nike Boy`s Jacket and Pants 2 Piece Set", category: "New,Kids", price: 21.50, itemdescription: "Regular fit jacket and sweatpants. High collared design offers additional protection if the weather gets chilly.,Full-zip style jacket adjusts comfort and warmth for your child.,Large logo located on back delivers a creative and stylish jacket that gets the kids excited to wear. Soft and comfy fabrics on both pants and jacket create a cozy feel.,Comfort elastic waistband supports a personalized fit. Contoured colors on jacket and sweat pants promote an athletic look.,Polyester", asseturl: "KidsBlackJacketSet.jpg", tag: "Shirt,Sporting", colour: "RED,BLACK", size: "Small", popularity: 0)  

i12 = Item.new(name: "The Long Sleeved Shirt", category: "New", price: 30.99, itemdescription: "The perfect addition to your wardrobe.", asseturl: "https://i.pinimg.com/originals/ee/28/d2/ee28d22c60e803ee1ea5a339b24acbf8.jpg", tag: "Shirt", colour: "RED,BLACK", size: "Small,Medium,Large", popularity: 0)
i13 = Item.new(name: "White Sweater", category: "New", price: 20.99, itemdescription: "The perfect addition to your wardrobe.", asseturl: "https://cdn.shopify.com/s/files/1/0485/1810/3193/collections/Main_sectionTopBanner_promotion_yak_1080_201030_1350x550.jpg?v=1612565602", tag: "Sweater", colour: "RED,BLACK", size: "Small,Medium,Large", popularity: 0)
i14 = Item.new(name: "Havard T-Shirt", category: "New", price: 10.99, itemdescription: "The perfect addition to your Havard wardrobe.", asseturl: "https://cdn.shopify.com/s/files/1/0084/9282/files/website_banners_1_2048x2048.png?v=1563910461", tag: "Shirt", colour: "RED,BLACK", size: "Small,Medium,Large", popularity: 0)


i15 = Item.new(name: "The White Polos", category: "popular", price: 30.99, itemdescription: "A very nice and fashionable polo", asseturl: "https://images-eu.ssl-images-amazon.com/images/I/71kFTNDCjsL.__AC_SY445_SX342_QL70_FMwebp_.jpg", tag: "Shirt", colour: "RED,BLACK", size: "Small,Medium,Large", popularity: 0)
i16 = Item.new(name: "The Purple Wool Sweater", category: "popular", price: 30.99, itemdescription: "A very nice and fashionable Wool Sweater", asseturl: "https://images-na.ssl-images-amazon.com/images/I/81BcQ77s6nL._AC_UL1500_.jpg", tag: "Sweater", colour: "RED,BLACK,PURPLE", size: "Small,Medium,Large", popularity: 0)
i17 = Item.new(name: "The Red Cotton Sweater", category: "popular", price: 30.99, itemdescription: "A very nice and fashionable Cotton Sweater", asseturl: "https://img.macson.es/fotos/631461_1_l.jpg", tag: "Sweater", colour: "RED,BLACK", size: "Small,Medium,Large", popularity: 0)
i18 = Item.new(name: "The Green Silk Sweater", category: "popular", price: 30.99, itemdescription: "A very nice and fashionable Silk Sweater", asseturl: "https://m.media-amazon.com/images/I/81ff0TanClL._AC_UL1500_.jpg", tag: "Sweater", colour: "RED,BLACK,GREEN", size: "Small,Medium,Large", popularity: 0)
i19 = Item.new(name: "The Black Hoodie", category: "popular", price: 30.99, itemdescription: "A very nice and fashionable hoodie", asseturl: "https://cdn.shopify.com/s/files/1/0317/5009/4893/products/05MAY04BRONZESNAKE0124.jpg?v=1588721313", tag: "Hoodie", colour: "RED,BLACK", size: "Small,Medium,Large", popularity: 0)
i20 = Item.new(name: "The White Linen Sweater", category: "popular", price: 30.99, itemdescription: "A very nice and fashionable Linen Sweater", asseturl: "https://m.media-amazon.com/images/I/81O3cekXLjL._AC_UL1500_.jpg", tag: "Sweater", colour: "RED,BLACK,WHITE", size: "Small,Medium,Large", popularity: 0)


i1.save 
i2.save
i3.save
i4.save
i5.save
i6.save
i7.save
i8.save
i9.save
i10.save
i11.save

i12.save
i13.save
i14.save

i15.save
i16.save
i17.save
i18.save
i19.save
i20.save


User.new
u1 = User.new(name: "Username1", email: "zpane@test.com", password: "Pane1234", password_confirmation: "Pane1234")
u1.save
u2 = User.new(name: "RAD", email: "rad2021rmit@gmail.com", password: "Rails2021", password_confirmation: "Rails2021")
u2.save
u3 = User.new(name: "Thien", email: "thien@gmail.com", password: "123456789", password_confirmation: "123456789")
u3.save
u4 = User.new(name: "admin", email: "danny_le@y7mail.com", password: "Rails2021", password_confirmation: "Rails2021")
u4.save

ActiveRecord::Base.connection.execute("INSERT INTO items_users (item_id, user_id) VALUES (1,1)")
ActiveRecord::Base.connection.execute("INSERT INTO items_users (item_id, user_id) VALUES (3,1)")
ActiveRecord::Base.connection.execute("INSERT INTO items_users (item_id, user_id) VALUES (7,1)")
ActiveRecord::Base.connection.execute("INSERT INTO items_users (item_id, user_id) VALUES (5,2)")


ActiveRecord::Base.connection.execute("INSERT INTO carts (item_id, user_id, size, colour, quantity) VALUES (1,1,'Medium','RED',2)")
ActiveRecord::Base.connection.execute("INSERT INTO carts (item_id, user_id, size, colour, quantity) VALUES (7,1,'Large','RED',2)")
ActiveRecord::Base.connection.execute("INSERT INTO carts (item_id, user_id, size, colour, quantity) VALUES (10,2,'Extra Large','BLUE',3)")
