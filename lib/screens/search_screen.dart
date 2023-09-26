import 'package:api/cubit/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});


var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

 var cubit = ProductCubit.get(context);

    cubit.searchProducts = cubit.products;
    
    return  Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 153, 59, 92),
        title: const Text("Search"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height*.01,),
            Container(
              height: MediaQuery.sizeOf(context).height*.05,
              width: MediaQuery.sizeOf(context).width*.9,
              child: SearchBar(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 203, 177, 186)),
                controller: controller,
                onChanged: (value) {
                  cubit.search(value);
                },
                trailing: [
                  IconButton(
                      onPressed: () {
                        cubit.search(controller.text);
                      },
                      icon: const Icon(Icons.search,color: Colors.white,))
                ],
              ),
            ),
             SizedBox(height: MediaQuery.sizeOf(context).height*.01,),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                return cubit.searchProducts.isEmpty
                    ? const Center(child: Text("No items"))
                    : ListView.builder(
                        itemCount: cubit.searchProducts.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Color.fromARGB(255, 203, 177, 186),

                            child: ListTile(
                              leading: Container(
                                 width: 100,
                                height: 100,
                                child: Image.network(
                                  cubit.searchProducts[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(cubit.searchProducts[index].title!,style: TextStyle(color: Color.fromARGB(255, 153, 59, 92),fontSize: 14,fontWeight: FontWeight.bold),),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(cubit.searchProducts[index].category!,style: TextStyle(color: Colors.black,),),
                                  Text(cubit.searchProducts[index].price!,style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}