import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../Core/utils/Constant.dart';
import '../../../../../Core/utils/colors.dart';
import '../../../../../Core/widgets/LoaingAndShimmerEffect.dart';
import '../../../../../Core/widgets/background.dart';
import '../../Cubits/Getprouducrs_cubits/get_allproducts_cubit.dart';
import '../../Cubits/searsh_cubit/searsh_cubit_cubit.dart';
import '../../../../../Core/widgets/SmallWidgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  final FocusNode _searchFocus = FocusNode();
  TextEditingController _searchController = TextEditingController();
  void initState() {
    _searchFocus.requestFocus();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          background(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: BlocConsumer<SearshCubitCubit, SearshCubitState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Column(children: [
                    _custemapppar(context),
                    searchbar(),
                    _Searchbody(),
                    Spacer(),
                    Text(
                      "Search our products",
                      style: TextStyle(color: Colors_App.NotActiveIconColor),
                    ),
                  ]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Searchbody() {
    return SearshCubitCubit.get(context).isStartedSearch
        ? Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Center(child: SnipLoadingApp()),
              ),
              Text(
                "Searching",
                style: TextStyle(color: Colors_App.NotActiveIconColor),
              ),
            ],
          )
        : Container(
            height: MediaQuery.of(context).size.height - 200,
            child: SingleChildScrollView(
              child: SearshCubitCubit.get(context)
                          .GroupFoResultsfromSearched
                          .length ==
                      0
                  ? Center(
                      child: Text(""),
                    )
                  : Column(
                      children: List.generate(
                          SearshCubitCubit.get(context)
                                  .GroupFoResultsfromSearched
                                  .isEmpty
                              ? GetAllproductsCubit.get(context)
                                  .groupOproducts
                                  .length
                              : SearshCubitCubit.get(context)
                                  .GroupFoResultsfromSearched
                                  .length,
                          (index) => SearshCubitCubit.get(context)
                                  .GroupFoResultsfromSearched
                                  .isEmpty
                              ? Text("")
                              : searchitem(index)),
                    ),
            ),
          );
  }

  Widget searchbar() {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: searchwiget(
          context: context,
          searchFocus: _searchFocus,
          searchController: _searchController),
    );
  }

  Container _custemapppar(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white.withOpacity(0.5),
              )),
          Container(
            width: MediaQuery.of(context).size.width - 116,
            alignment: Alignment.center,
            child: CustomText(
              text: "Search",
              Size: 22,
            ),
          )
        ],
      ),
    );
  }

  ListTile searchitem(index) {
    return ListTile(
      leading: Container(
        clipBehavior: Clip.hardEdge,
        child: Image.network(
            "${SearshCubitCubit.get(context).GroupFoResultsfromSearched[index].image}"),
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(13)),
      ),
      title: CustomText(
        text:
            "${SearshCubitCubit.get(context).GroupFoResultsfromSearched[index].title}",
        Size: 16,
      ),
      subtitle: Text(
        "${SearshCubitCubit.get(context).GroupFoResultsfromSearched[index].description}",
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Padding(
        padding: EdgeInsets.only(left: 25),
        child: Text(
          "${SearshCubitCubit.get(context).GroupFoResultsfromSearched[index].price}\$",
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}

class searchwiget extends StatelessWidget {
  const searchwiget({
    super.key,
    required this.context,
    required FocusNode searchFocus,
    required TextEditingController searchController,
  })  : _searchFocus = searchFocus,
        _searchController = searchController;

  final BuildContext context;

  final FocusNode _searchFocus;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors_App.DarkColorFrom),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: TextFormField(
          onFieldSubmitted: (value) {
            value.isNotEmpty
                ? SearshCubitCubit.get(context).SearchProducts(value: value)
                : GetAllproductsCubit.get(context).GetAllProducts();
          },
          focusNode: _searchFocus,
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 17),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
