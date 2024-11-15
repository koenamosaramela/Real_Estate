
import 'package:flutter/foundation.dart'; 
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const PropertyApp());
}

// Main App Widget with MaterialApp
class PropertyApp extends StatelessWidget {
  const PropertyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stanford & Koena Real Estate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

// Property Model Class
class Property {
  String address;
  double price;
  int bedrooms;
  int bathrooms;
  String description;
  List<String> imagePaths;
  bool isFavorite;
  String type;
  String location;
  bool isSold;

  Property({
    required this.address,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.description,
    required this.imagePaths,
    this.isFavorite = false,
    required this.type,
    required this.location,
    this.isSold = false,
  });
}// end of model 

// Home Screen with Search and Featured Properties
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Property> properties = [];
  List<Property> filteredProperties = [];
  final ImagePicker picker = ImagePicker();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProperties();
  }

  // Loaded properties
  void _loadProperties() {
    properties = [
     
    Property(
      address: 'Opulent Mansion',
      price: 25000000,
      bedrooms: 7,
      bathrooms: 9,
      description:
          'An opulent mansion featuring grand architecture, a private cinema, indoor pool, and lush gardens.',
      imagePaths: ['assets/pictures/h1.jpg', 'assets/pictures/h2.jpg'],
      type: 'For Sale',
      location: 'Sandhurst, Johannesburg',
      isSold: false,
    ),
    Property(
      address: 'Beachfront Palace',
      price: 32000000,
      bedrooms: 6,
      bathrooms: 8,
      description:
          'A stunning beachfront palace with panoramic ocean views, infinity pool, and private beach access.',
      imagePaths: ['assets/pictures/h3.jpg'],
      type: 'For Sale',
      location: 'Clifton, Cape Town',
      isSold: false,
    ),
    Property(
      address: 'Safari Lodge Estate',
      price: 29000000,
      bedrooms: 5,
      bathrooms: 7,
      description:
          'A luxurious safari lodge estate with stunning views of the African savannah, offering a private wildlife experience.',
      imagePaths: ['assets/pictures/h4.jpg', 'assets/pictures/h5.jpg'],
      type: 'For Sale',
      location: 'Kruger National Park, Limpopo',
      isSold: false,
    ),
    Property(
      address: 'Highveld Eco-Home',
      price: 15000000,
      bedrooms: 4,
      bathrooms: 4,
      description:
          'An eco-friendly home in the Highveld with sustainable architecture, solar panels, and a lush native garden.',
      imagePaths: ['assets/pictures/h6.jpg', 'assets/pictures/h7.jpg'],
      type: 'For Sale',
      location: 'Highveld, Gauteng',
      isSold: false,
    ),
    Property(
      address: 'Riverside Manor',
      price: 18000000,
      bedrooms: 5,
      bathrooms: 6,
      description:
          'A picturesque riverside manor with sprawling lawns, a private dock, and a large veranda overlooking the river.',
      imagePaths: ['assets/pictures/h8.jpg', 'assets/pictures/h9.png'],
      type: 'For Sale',
      location: 'Knysna, Western Cape',
      isSold: false,
    ),
    Property(
      address: 'Luxury Vineyard Retreat',
      price: 35000000,
      bedrooms: 7,
      bathrooms: 9,
      description:
          'An expansive vineyard estate with private wine cellars, tasting rooms, and panoramic vineyard views.',
      imagePaths: ['assets/pictures/h10.png'],
      type: 'For Sale',
      location: 'Stellenbosch, Western Cape',
      isSold: false,
    ),
    Property(
      address: 'Private Island Villa',
      price: 45000000,
      bedrooms: 8,
      bathrooms: 10,
      description:
          'An exclusive villa on a private island with white sand beaches, crystal clear waters, and top-tier amenities.',
      imagePaths: ['assets/pictures/h11.png'],
      type: 'For Sale',
      location: 'Kosi Bay, KwaZulu-Natal',
      isSold: false,
    ),
    Property(
      address: 'Modernist Cliffside Mansion',
      price: 27000000,
      bedrooms: 5,
      bathrooms: 7,
      description:
          'A breathtaking cliffside mansion with floor-to-ceiling windows, an infinity pool, and scenic ocean views.',
      imagePaths: ['assets/pictures/h12.png', 'assets/pictures/h13.png'],
      type: 'For Sale',
      location: 'Hermanus, Western Cape',
      isSold: false,
    ),
    Property(
      address: 'Luxury Penthouse Suite',
      price: 19000000,
      bedrooms: 4,
      bathrooms: 5,
      description:
          'An elegant penthouse suite in the heart of the city with expansive living spaces and panoramic skyline views.',
      imagePaths: ['assets/pictures/h14.png'],
      type: 'For Sale',
      location: 'Sandton, Johannesburg',
      isSold: false,
    ),
    Property(
      address: 'Historical Victorian Home',
      price: 15000000,
      bedrooms: 5,
      bathrooms: 6,
      description:
          'A beautifully restored Victorian home with exquisite period features, manicured gardens, and modern luxuries.',
      imagePaths: ['assets/pictures/h15.png'],
      type: 'For Sale',
      location: 'Port Elizabeth, Eastern Cape',
      isSold: false,
    ),
    Property(
      address: 'The Hillside Retreat',
      price: 22000000,
      bedrooms: 6,
      bathrooms: 7,
      description:
          'An elegant retreat nestled in the hills, featuring private balconies, a spacious terrace, and spectacular valley views.',
      imagePaths: ['assets/pictures/h16.png', 'assets/pictures/h17.png'],
      type: 'For Sale',
      location: 'Hazyview, Mpumalanga',
      isSold: false,
    ),
    Property(
      address: 'Lakeview Manor',
      price: 25000000,
      bedrooms: 5,
      bathrooms: 6,
      description:
          'A grand manor overlooking a tranquil lake, featuring expansive living areas and a luxurious master suite.',
      imagePaths: ['assets/pictures/h13.png'],
      type: 'For Sale',
      location: 'Hartbeespoort, North West',
      isSold: false,
    ),// end of loaded property 
   
    ];

    setState(() {
      filteredProperties = properties;
      isLoading = false;
    });
  }

  // Search functionality
  void _searchProperties(String query) {
    setState(() {
      filteredProperties = properties
          .where((property) =>
              property.address.toLowerCase().contains(query.toLowerCase()) ||
              property.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });// end search 
  }

  // Toggle favorite
  void _toggleFavorite(Property property) {
    setState(() {
      property.isFavorite = !property.isFavorite;
    });
  } // end toggle favorite 

  // Display property details onpress
  void _showPropertyDetails(Property property) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PropertyDetailsScreen(
          property: property,
          onEdit: (editedProperty) {
            setState(() {
              int index = properties.indexOf(property);
              properties[index] = editedProperty;
              filteredProperties = properties;
            });
          },
          onDelete: () {
            setState(() {
              properties.remove(property);
              filteredProperties = properties;
            });
          },
        ),
      ),
    );
  }

  // Function to add a new property
  void _addProperty() async {
    final newProperty = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddEditPropertyScreen(),
      ),
    );

    if (newProperty != null && newProperty is Property) {
      setState(() {
        properties.add(newProperty);
        filteredProperties = properties;
      });
    }
  }// end add new property 

  // Helper method to build property images 
  Widget _buildPropertyImage(String path) {
    if (path.contains('assets')) {
      return Image.asset(
        path,
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else if (kIsWeb) {
      // On the web, use Image.network with a URL 
      return Image.network(
        path,
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 150,
            color: Colors.grey.shade200,
            child: const Center(
              child: Icon(Icons.image, size: 50),
            ),
          );
        },
      );
    } else if (File(path).existsSync()) {
      // For mobile platforms
      return Image.file(
        File(path),
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return Container(
        height: 150,
        color: Colors.grey.shade200,
        child: const Center(
          child: Icon(Icons.image, size: 50),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('STANFORD & KOENA', style: TextStyle(fontSize: 22)),
          backgroundColor: Colors.blue.shade900,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('STANFORD & KOENA', style: TextStyle(fontSize: 22)),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Section with a gradient overlay 
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/pictures/h13.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    'OUT WITH THE OLD, IN WITH THE NEW.',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A3E85),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Life can be such an exhilarating experience filled with fond memories and irreplaceable thoughts '
                    'that linger long in your mind, but this can only happen within the right environment. Let us make your '
                    'fondest dreams come true with our selection of handpicked luxury houses waiting for you to call home.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            // Search Bar with enhanced padding
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: _searchProperties,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search properties by location or name...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            // Featured Properties Section
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'FEATURED PROPERTIES',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A3E85),
                ),
              ),
            ),
            // List of properties with square design
            properties.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1,
                    ),
                    itemCount: filteredProperties.length,
                    itemBuilder: (context, index) {
                      final property = filteredProperties[index];
                      return GestureDetector(
                        onTap: () {
                          _showPropertyDetails(property);
                        },
                        child: Stack(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: const EdgeInsets.all(8.0),
                              elevation: 4.0,
                              shadowColor: Colors.black26,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Hero(
                                      tag: property.address,
                                      child: _buildPropertyImage(
                                          property.imagePaths.first),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                property.type.toUpperCase(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  property.isFavorite
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: property.isFavorite
                                                      ? Colors.red
                                                      : Colors.grey,
                                                ),
                                                onPressed: () =>
                                                    _toggleFavorite(property),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'R${property.price.toStringAsFixed(0)}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            property.address,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (property.isSold)
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: const Text(
                                    'SOLD',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  )
                : const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'No properties available.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProperty,
        backgroundColor: Colors.blue.shade900,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Property Details Page with Hero animation
class PropertyDetailsScreen extends StatelessWidget {
  final Property property;
  final Function(Property) onEdit;
  final VoidCallback onDelete;

  const PropertyDetailsScreen({
    super.key,
    required this.property,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.address),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              // Navigate to AddEditPropertyScreen to edit the property
              final editedProperty = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddEditPropertyScreen(property: property),
                ),
              );
              if (editedProperty != null && editedProperty is Property) {
                onEdit(editedProperty);
           
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: property.address,
              child: property.imagePaths.isNotEmpty
                  ? _buildPropertyImage(property.imagePaths.first)
                  : Container(
                      height: 250,
                      color: Colors.grey.shade200,
                      child: const Center(
                        child: Icon(Icons.image, size: 100),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'R${property.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${property.bedrooms} Beds, ${property.bathrooms} Baths',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Location: ${property.location}',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    property.isSold ? 'Status: Sold' : 'Status: Available',
                    style: TextStyle(
                      fontSize: 18,
                      color: property.isSold ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    property.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build property images
  Widget _buildPropertyImage(String path) {
    if (path.contains('assets')) {
      return Image.asset(
        path,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else if (kIsWeb) {
      return Image.network(
        path,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 250,
            color: Colors.grey.shade200,
            child: const Center(
              child: Icon(Icons.image, size: 100),
            ),
          );
        },
      );
    } else if (File(path).existsSync()) {
      return Image.file(
        File(path),
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else {
      return Container(
        height: 250,
        color: Colors.grey.shade200,
        child: const Center(
          child: Icon(Icons.image, size: 100),
        ),
      );
    }
  }
}

// Add/Edit Property Screen
class AddEditPropertyScreen extends StatefulWidget {
  final Property? property;

  const AddEditPropertyScreen({super.key, this.property});

  @override
  AddEditPropertyScreenState createState() => AddEditPropertyScreenState();
}

class AddEditPropertyScreenState extends State<AddEditPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _addressController;
  late TextEditingController _priceController;
  late TextEditingController _bedroomsController;
  late TextEditingController _bathroomsController;
  late TextEditingController _descriptionController;
  late TextEditingController _typeController;
  late TextEditingController _locationController;
  final ImagePicker _picker = ImagePicker();
  List<String> _imagePaths = [];
  bool _isSold = false;

  @override
  void initState() {
    super.initState();
    _addressController =
        TextEditingController(text: widget.property?.address ?? '');
    _priceController =
        TextEditingController(text: widget.property?.price.toString() ?? '');
    _bedroomsController =
        TextEditingController(text: widget.property?.bedrooms.toString() ?? '');
    _bathroomsController = TextEditingController(
        text: widget.property?.bathrooms.toString() ?? '');
    _descriptionController =
        TextEditingController(text: widget.property?.description ?? '');
    _typeController = TextEditingController(text: widget.property?.type ?? '');
    _locationController =
        TextEditingController(text: widget.property?.location ?? '');
    _imagePaths = widget.property?.imagePaths ?? [];
    _isSold = widget.property?.isSold ?? false;
  }

  @override
  void dispose() {
    _addressController.dispose();
    _priceController.dispose();
    _bedroomsController.dispose();
    _bathroomsController.dispose();
    _descriptionController.dispose();
    _typeController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _saveProperty() {
    if (_formKey.currentState!.validate()) {
      final newProperty = Property(
        address: _addressController.text,
        price: double.tryParse(_priceController.text) ?? 0.0,
        bedrooms: int.tryParse(_bedroomsController.text) ?? 0,
        bathrooms: int.tryParse(_bathroomsController.text) ?? 0,
        description: _descriptionController.text,
        imagePaths: _imagePaths,
        type: _typeController.text,
        location: _locationController.text,
        isSold: _isSold,
      );
      Navigator.pop(context, newProperty);
    }
  }

  void _pickImage() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      if (kIsWeb) {
        // For Flutter convert picked file to a URL 
        final path = pickedImage.path;
        setState(() {
          _imagePaths.add(path);
        });
      } else {
        setState(() {
          _imagePaths.add(pickedImage.path);
        });
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imagePaths.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isEditing = widget.property != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Property' : 'Add Property'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter an address' : null,
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter a price' : null,
              ),
              TextFormField(
                controller: _bedroomsController,
                decoration: const InputDecoration(labelText: 'Bedrooms'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter number of bedrooms' : null,
              ),
              TextFormField(
                controller: _bathroomsController,
                decoration: const InputDecoration(labelText: 'Bathrooms'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter number of bathrooms' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              TextFormField(
                controller: _typeController,
                decoration: const InputDecoration(labelText: 'Type (For Sale, For Rent)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter the type' : null,
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please enter the location' : null,
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                title: const Text('Sold'),
                value: _isSold,
                onChanged: (value) {
                  setState(() {
                    _isSold = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Images',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 8.0,
                children: [
                  ..._imagePaths.map((path) {
                    int index = _imagePaths.indexOf(path);
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        kIsWeb
                            ? Image.network(
                                path,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.grey.shade200,
                                    child: const Center(
                                      child: Icon(Icons.image, size: 50),
                                    ),
                                  );
                                },
                              )
                            : Image.file(
                                File(path),
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () => _removeImage(index),
                        ),
                      ],
                    );
                  }),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: _pickImage,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProperty,
                child: const Text('Save Property'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
