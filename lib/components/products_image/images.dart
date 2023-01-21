import 'package:e_commerce_app/model/all_category_model.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:e_commerce_app/screen/pages/search/cate_bag_page.dart';
import 'package:e_commerce_app/screen/pages/search/cate_dress_page.dart';
import 'package:e_commerce_app/screen/pages/search/cate_jewelry_page.dart';
import 'package:e_commerce_app/screen/pages/search/cate_shoes.dart';

class CategoryList {
  List<CategoryModel> category = [
    CategoryModel(name: "Clothes", route: SubDressPage()),
    CategoryModel(name: "Footwear", route: SearchShoesPage()),
    CategoryModel(name: "Bags", route: SearchBagPage()),
    CategoryModel( name: "Jewelry",route: SearchJewelryPage(),)
  ];
}
class AllCategory {
  List<Item> shoes = [
    Item(
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/01/10/1641801911f283e302fe32c672e9aa8feb5b88c263_thumbnail_405x552.webp",
      price: 120,
      name: "Colorblock Lace-up Front Skate Shoes",
    ),
    Item(
        price: 120,
        name: "Colorblock Lace-up Front Skate Shoes",
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/01/11/1641868441de23b3c177fef5367d918a9448a4c3e8_thumbnail_405x552.webp"),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/06/13/16550999359ecee8daae6b4e762ea45a639e6033bf_thumbnail_405x552.webp",
        price: 100,
        name: "Colorblock Lace-up Front Skate Shoes"),
    Item(
      name: "Colorblock Lace-up Front Skate Shoes",
      price: 190,
      image:
          "https://img.ltwebstatic.com/images3_pi/2021/07/28/16274732784955ea983334aa5cd2d26fa9ac4e6778_thumbnail_405x552.webp",
    ),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2021/12/28/16406571362bb973509b4a9302253fe72ba3302cb9_thumbnail_405x552.webp",
        name: "Colorblock Lace-up Front Skate Shoes",
        price: 400),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2021/10/21/16348106686d00af8e0e1777265826619e7e6caf50_thumbnail_405x552.webp",
        name: "Colorblock Lace-up Front Skate Shoes",
        price: 300),
    Item(
      name: "Colorblock Lace-up Front Skate Shoes",
      price: 300,
      image:
          "https://img.ltwebstatic.com/images3_pi/2021/12/27/1640600837ad43ebe9901cfd0bcee54d15659c59a3_thumbnail_405x552.webp",
    ),
    Item(
      name: "Colorblock Lace-up Front Skate Shoes",
      price: 500,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/07/28/1658990746b9fd7d0351f40ede87063a4681e30cf0_thumbnail_405x552.webp",
    ),
    Item(
      name: "Colorblock Lace-up Front Skate Shoes",
      price: 200,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/05/19/165292786477279ed4b28f77cf9e71bdf49fd5ce73_thumbnail_405x552.webp",
    ),
    Item(
      name: "Colorblock Lace-up Front Skate Shoes",
      price: 200,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/03/23/1648007945133a2b3c8ac9fce6bd92775e0d4b2d3c_thumbnail_405x552.webp",
    )
  ];

  List<Item> dress = [
    Item(
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/01/10/16417853755652e015d9cd2f2ae2473204f87eaa3b_thumbnail_405x552.webp",
      price: 120,
      name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
    ),
    Item(
        price: 120,
        name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/08/02/165940429751dc3b3990f9dbad800eb1ef8b37690b_thumbnail_405x552.webp"),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/04/26/16509537810445c8ee54401c5c49df922ce2fe178b_thumbnail_900x.webp",
        price: 100,
        name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress"),
    Item(
      name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
      price: 190,
      image:
          "https://img.ltwebstatic.com/images3_pi/2021/02/25/1614245376828921a1c8e57370d88be65a8beea1db_thumbnail_900x.webp",
    ),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/07/19/1658212916628c769d47da3c38e12cfe8dad85d566_thumbnail_405x552.webp",
        name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
        price: 400),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/07/18/165811057230c7e75dce37836931c69211c579452f_thumbnail_405x552.webp",
        name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
        price: 300),
    Item(
      name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
      price: 300,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/07/21/1658408095793c889730027c7c7ac766f3fd82bfd8_thumbnail_405x552.webp",
    ),
    Item(
      name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
      price: 500,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/05/30/1653896357f829fec10da71b07b9cfd9668394107e_thumbnail_405x552.webp",
    ),
    Item(
      name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
      price: 200,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/08/05/1659670938210589c82c8a28426ea15b695c75377d_thumbnail_405x552.webp",
    ),
    Item(
      name: "SHEIN MOD Floral Print Lettuce Trim Cami Dress",
      price: 200,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/07/07/165717144364cf787fbbdc0b66df739fef083fc284_thumbnail_900x.webp",
    )
  ];

  List<Item> bags = [
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/02/21/164542344692bb270517bfdc7b8ef24968a39225b0_thumbnail_900x.webp",
        price: 120,
        name: "Mini Two Tone Flap Square Bag"),
    Item(
        price: 120,
        name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/05/11/16522658101db44f7db8ee9b397a9e95c4d5303bd7_thumbnail_405x552.webp"),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/05/18/1652837465851d248a60efe6e1fa16cff27f5b3636_thumbnail_405x552.webp",
        price: 100,
        name: "Mini Twist Lock Color Block Flap Chain Satchel Bag"),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 190,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/06/13/1655083786db4696b3be8a411480161634f74f62ba_thumbnail_405x552.webp",
    ),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2021/07/07/1625647438f9c021d5844a25fca36e6f244ae8f592_thumbnail_405x552.webp",
        name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
        price: 400),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/05/18/16528515017da8f0b8fd2638e4950cd182256627ba_thumbnail_405x552.webp",
        name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
        price: 300),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 300,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/05/17/1652778392cba980489aa2980daa5b09603b389fc2_thumbnail_405x552.webp",
    ),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 500,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/02/14/1644810758e8d920fca643e1a2ace40d1bd3b8d00e_thumbnail_405x552.webp",
    ),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 200,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/01/21/1642733016e9d7f0fe0ff1bef4f2a812f424021c35_thumbnail_405x552.webp",
    ),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 200,
      image:
          "https://img.ltwebstatic.com/images3_pi/2021/03/02/1614669439f09b1cbabc4a34e9855e7fc717a44338_thumbnail_405x552.webp",
    )
  ];

  List<Item> Jewelry = [
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/07/15/165787392136a20f8ee3c61125969cea993b590e2a_thumbnail_405x552.webp",
        price: 120,
        name: "Flower Decor Choker"),
    Item(
        price: 120,
        name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
        image:
            "https://img.ltwebstatic.com/images3_pi/2022/07/12/1657597612062b2ae08b08e499657ccd550b141578_thumbnail_405x552.webp"),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2021/04/26/1619410951c976a41c58d4836b9533d4dedb191f92_thumbnail_405x552.webp",
        price: 100,
        name: "Zircon Butterfly Decor Ring"),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 190,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/07/27/165889851572993c926b49fdd6e0bcf9cc892ef118_thumbnail_405x552.webp",
    ),
    Item(
        image:
            "https://img.ltwebstatic.com/images2_pi/2019/05/07/15572166871037476148_thumbnail_405x552.webp",
        name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
        price: 400),
    Item(
        image:
            "https://img.ltwebstatic.com/images3_pi/2021/07/28/16274714158258c0aed6b8bb3bd32c2c1f38f0df25_thumbnail_405x552.webp",
        name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
        price: 300),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 300,
      image:
          "https://img.ltwebstatic.com/images3_pi/2020/06/18/1592458915af7b082b9ee3e0b75792f349a99f2384_thumbnail_405x552.webp",
    ),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 500,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/03/23/1648016044f86a1a4512a4734a70ee6d168300be79_thumbnail_405x552.webp",
    ),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 200,
      image:
          "https://img.ltwebstatic.com/images3_pi/2021/07/14/162622817027b78755fe1879dc058e4e1f49785188_thumbnail_405x552.webp",
    ),
    Item(
      name: "Mini Twist Lock Color Block Flap Chain Satchel Bag",
      price: 200,
      image:
          "https://img.ltwebstatic.com/images3_pi/2022/03/18/16475984971cebd6c7c40b84b1caa15f587920808c_thumbnail_900x.webp",
    )
  ];
}

