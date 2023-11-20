import 'package:fantastico_app/repositories/product_repository.dart';
import 'package:fantastico_app/services/service_locator.dart';
import 'package:fantastico_app/ui/app/widgets/custom_app_bar.dart';
import 'package:fantastico_app/ui/product_item/product_list_item.dart';
import 'package:fantastico_app/ui/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchProvider extends StatelessWidget {
  const SearchProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        productRepo: ServiceLocator.getIt<ProductRepository>(),
      ),
      child: const SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(
        toolbarHeight: 100,
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.name,
                  controller: _searchController,
                  style: textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Escribe las palabras',
                    hintStyle: textTheme.bodySmall,
                    labelStyle: textTheme.bodySmall,
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: _searchController.clear,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  autocorrect: false,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    if (value.length < 3) {
                      return 'El texto de búsqueda debe ser '
                          'mayor a 2 caracteres';
                    }
                    return null;
                  },
                  onFieldSubmitted: context.read<SearchCubit>().onSearch,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: state.data != null
                        ? ListView.builder(
                            itemCount: state.data!.products.length,
                            itemBuilder: (context, index) {
                              final product = state.data!.products[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 8,
                                ),
                                child: ProductListItem(
                                  product: product,
                                  onTap: () => context.go(
                                    '/search/product/${product.hashedId}',
                                  ),
                                ),
                              );
                            },
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
