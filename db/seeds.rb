# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'items'")
Item.new
i1 = Item.new(name: "COOFANDY Men's Paisley Cotton Long Sleeve Shirt Floral Print Casual Retro Button Down Shirt", category: "Men", price: 28.99, itemdescription: "Button closure,,Material: 98% Cotton, offers you good feelings.,Process: High-end print process,the trendy vibrant color,do not shrink,do not fade.,Design: Button-front shirt featuring long sleeve,spread collar and adjustable cuffs,floral printing all over,and the hawaiian aloha style,these shirt will makes you stand out in the crowd.,Occasion: Retro printing design,printed shirt good for usual casual life,seaside vacation,beach,business,holiday,festivals,parties,provides choice for all occasions.", asseturl: "/app/assets/images/MenCasualRetroShirt.jpg")  
i2 = Item.new(name: "COOFANDY Men's Business Dress Shirt Long Sleeve Slim Fit Casual Button Down Shirt", category: "Men", price: 29.99, itemdescription: "Button closure, Hand washable,Material: 98% Cotton 2% Polyester.,Fabric Material: High quality fabric,Slim fit style and with contrast color collar and cuff fashionable design shirt,make you handsome and attractive.,Features: button-front shirt, solid color, obscure plaid pattern, contrast color collar and cuff, long sleeves. Usually with a jacket, tie and a suit or formalwear, but this shirts are also worn more casually.,Occasion:Suitable for casual daily or as a formal business shirts, party, wedding, all seasons and any occasion, Perfect gift for families, friends or boyfriend.", asseturl: "/app/assets/images/MenCasualDiamondShirt.jpg")  
i3 = Item.new(name: "COOFANDY Men's Slim Fit Floral Dress Shirt Long Sleeve Casual Button Down Shirts", category: "Men", price: 29.99, itemdescription: "Material: 98% Polyester, 2% Other, Button closure ,Hand Wash,Material - Slim fit, fits true to size, great quality silk touch fashion floral printed dress shirt fabric lets you be stylish and unique from crowd. This Mens shirts is a must-have on your wardrobe.,Design - All over Floral Printed ,Turn down collar,Slim Fit Button Down Dress Shirt. It's great to match with your deep blue jeans will add a graceful essence to your ensemble ,and look fresh .,Stylish-These floral button down shirts are perfect to wear suit jacket,or you can pair this floral silk long sleeve dess shirt with jeans or any types pants in all season. Flower shirts never go out of style.,Occasion - Fashionable print style button shirts are suitable for leisure,work, dating, dinner,costume parties, themed parties, streetwear, Hip Hop, Shows,daily life...perfect choice for a variety of occasions. floral printed shirt makes you more Stylish and Handsome.", asseturl: "/app/assets/images/MenCasualFloralShirt.jpg")  
i4 = Item.new(name: "Tinkwell Men's Casual Long Sleeve Shirt Button Down Shirt Cotton Regular fit Dress Shirts", category: "Men", price: 21.50, itemdescription: "Button closure, Wash cold,Material:98% Cotton, 2% Polyester,good fabric quality and style ensure that you feel good and comfortable when you wear it,Design: Classic design; Button closure; Long sleeves; Lightweight cotton fabric;Solid color;Soft & breathable;Good quality fabric.this long sleeve button down dress shirt characterized by contrasting color design on collar, sleeves and front, modern and stylish,Occasion:Fashion style button up shirt, regular fit, comfortable to wear, suitable for all seasons and many occasions, such casual, work, or party.Perfect Gift for families, friends or boyfriend", asseturl: "/app/assets/images/MenCasualBlackShirt.jpg")  
i5 = Item.new(name: "Calvin Klein Women's Sleeveless Sheath with Chiffon Caplet Overlay", category: "Women", price: 22.97, itemdescription: "94% Polyester, 6% Spandex,Imported,Zipper closure,Dry Clean Only,Flattering fit", asseturl: "/app/assets/images/CalvinKleinWhiteDress.jpg")  
i6 = Item.new(name: "Calvin Klein Women's Solid V Neck Belted Jumpsuit", category: "Women", price: 35.99, itemdescription: "94% Polyester, 6% Spandex,Imported,Zipper closure,Dry Clean Only,Flattering fit", asseturl: "/app/assets/images/CalvinKleinBlueDress.jpg")  
i7 = Item.new(name: "Calvin Klein Women's Short Shoulder Sheath with Flutter Sleeves", category: "Women", price: 31.36, itemdescription: "94% Polyester, 6% Spandex,Imported,Zipper closure,Dry Clean Only,Flattering fit", asseturl: "/app/assets/images/CalvinKleinBlackDress.jpg")  
i8 = Item.new(name: "Calvin Klein Women's Belted Jumpsuit with Flutter Sleeves", category: "Women", price: 84.05, itemdescription: "94% Polyester, 6% Spandex,Imported,Zipper closure,Dry Clean Only,Flattering fit", asseturl: "/app/assets/images/CalvinKleinBlackFloralDress.jpg")  
i9 = Item.new(name: "Nike Boys' Dri FIT Triple Futura Graphic T Shirt and Shorts 2 Piece Set", category: "Kids", price: 26.49, itemdescription: "100% Polyester,Nike Dri-FIT moisture-wicking technology keeps him dry and comfortable.,Ribbed crewneck on shirt. Knit fabric shorts.,Tagless neck. Nike Swoosh graphic print at chest.,Nike Swoosh logo at leg. Elastic and tagless waistband for added comfort. Fabric : 100% polyester", asseturl: "/app/assets/images/KidsRedNikeSet.jpg")  
i10 = Item.new(name: "Air Jordan Jumpman 2 Piece Boys Outfit Set", category: "Kids", price: 21.50, itemdescription: "100% Polyester,Nike Dri-FIT moisture-wicking technology keeps him dry and comfortable.,Ribbed crewneck on shirt. Knit fabric shorts.,Tagless neck. Elastic and tagless waistband for added comfort. Fabric : 100% polyester", asseturl: "/app/assets/images/KidsRedJumpManSet.jpg")  
i11 = Item.new(name: "Nike Boy`s Jacket and Pants 2 Piece Set", category: "New", price: 21.50, itemdescription: "Regular fit jacket and sweatpants. High collared design offers additional protection if the weather gets chilly.,Full-zip style jacket adjusts comfort and warmth for your child.,Large logo located on back delivers a creative and stylish jacket that gets the kids excited to wear. Soft and comfy fabrics on both pants and jacket create a cozy feel.,Comfort elastic waistband supports a personalized fit. Contoured colors on jacket and sweat pants promote an athletic look.,Polyester", asseturl: "/app/assets/images/KidsBlackJacketSet.jpg")  
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


