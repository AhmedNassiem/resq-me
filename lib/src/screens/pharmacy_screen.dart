import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resq_me/Cubits/pharmacy_cubit.dart';
import 'package:resq_me/src/screens/drawer_screen.dart';

import '../widgets/pharmacy_card.dart';

class Pharmacies extends StatefulWidget {
  const Pharmacies({super.key});

  @override
  _PharmaciesState createState() => _PharmaciesState();
}

class _PharmaciesState extends State<Pharmacies> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isSearchBarVisible = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch pharmacies when the widget is first built
    context.read<PharmacyCubit>().getPharmacies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyCubit, PharmacyState>(
      builder: (context, state) {
        if (state is PharmacyInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PharmacySuccess || state is PharmacyStateFiltered) {
          final pharmacies = state is PharmacySuccess
              ? state.pharmacyModel
              : (state as PharmacyStateFiltered).filteredPharmacyModel;

          return Scaffold(
            key: _scaffoldKey,
            drawer: const TheDrawer(),
            appBar: AppBar(
              elevation: 0,
              shadowColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isSearchBarVisible = !_isSearchBarVisible;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            body: Column(
              children: [
                if (_isSearchBarVisible)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search pharmacies...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            context.read<PharmacyCubit>().searchPharmacy('');
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      onSubmitted: (value) {
                        context.read<PharmacyCubit>().searchPharmacy(value);
                      },
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Pharmacy_Card(
                        pharmacyModel: pharmacies[index],
                      );
                    },
                    itemCount: pharmacies.length,
                  ),
                ),
              ],
            ),
          );
        } else if (state is PharmacyFailure) {
          return const Center(
            child: Text('Oops, there was an error'),
          );
        } else {
          return const Center(
            child: Text(
                'Oops, there was an unexpected error. Please try again later.'),
          );
        }
      },
    );
  }
}
