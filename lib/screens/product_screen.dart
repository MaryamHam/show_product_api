import 'package:api/cubit/cubit/product_cubit.dart';
import 'package:api/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
   var cubit = ProductCubit.get(context);
    cubit.getProducts();

    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 153, 59, 92),
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return state is GetProductLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is GetProductError
                  ? const Center(
                      child: Text("Error"),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Color.fromARGB(255, 203, 177, 186),
                          child: Column(
                            children: [
                             
                              Container(
                                width: 200,
                                height: 100,
                                child: Image.network(
                                  cubit.products[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text(
                                cubit.products[index].title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 153, 59, 92),fontWeight: FontWeight.bold),
                              ),
                              Text(cubit.products[index].category!, style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 153, 59, 92),)),
                              Text(cubit.products[index].price!, style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 153, 59, 92),)),
                            ],
                          ),
                        );
                      },
                      itemCount: cubit.products.length,
                    );
        },
      ),
    );
  }
}