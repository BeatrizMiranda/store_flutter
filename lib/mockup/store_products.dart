class StoreProduct {
  const StoreProduct({
    this.price,
    this.name,
    this.description,
    this.image,
    this.weight,
  });

  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const storeProducts = <StoreProduct>[
  StoreProduct(
    price: 8.30,
    name: "Avocado",
    description: "lorem ipsum dolor sit amet, consectetur adip",
    image: 'assets/store/avocado.png',
    weight: '500g',
  ),
  StoreProduct(
    price: 8.30,
    name: "Banana",
    description: "lorem ipsum dolor sit amet, consectetur adip",
    image: 'assets/store/banana.png',
    weight: '500g',
  ),
  StoreProduct(
    price: 8.30,
    name: "Mango",
    description: "lorem ipsum dolor sit amet, consectetur adip",
    image: 'assets/store/mango.jpg',
    weight: '500g',
  ),
  StoreProduct(
    price: 8.30,
    name: "Pineapple",
    description: "lorem ipsum dolor sit amet, consectetur adip",
    image: 'assets/store/pineapple.png',
    weight: '500g',
  ),
  StoreProduct(
    price: 8.30,
    name: "Cherry",
    description: "lorem ipsum dolor sit amet, consectetur adip",
    image: 'assets/store/cherry.png',
    weight: '500g',
  ),
  StoreProduct(
    price: 8.30,
    name: "Orange",
    description: "lorem ipsum dolor sit amet, consectetur adip",
    image: 'assets/store/orange.png',
    weight: '500g',
  ),
];
